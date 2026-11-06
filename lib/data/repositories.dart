import 'dart:math';
import 'package:drift/drift.dart';

import '../domain/models/enums.dart';
import '../domain/models/models.dart' as domain;
import 'database.dart';
import 'mappers.dart';

/// Génère un identifiant simple (horodatage + aléatoire). Suffisant pour
/// une base locale mono-utilisateur ; remplace par `package:uuid` si tu
/// veux des identifiants standardisés (utile le jour d'une synchro V2).
String genereId() {
  final rand = Random();
  return '${DateTime.now().microsecondsSinceEpoch}-${rand.nextInt(1 << 32)}';
}

// =========================================================================
// Habitudes
// =========================================================================

class HabitRepository {
  HabitRepository(this._db);
  final AppDatabase _db;

  Stream<List<domain.Habit>> watchHabitudeActives() {
    final query = _db.select(_db.habitudes)
      ..where((h) => h.actif.equals(true))
      ..orderBy([(h) => OrderingTerm.asc(h.dateCreation)]);
    return query.watch().map((rows) => rows.map(habitFromRow).toList());
  }

  Stream<domain.Habit?> watchHabitude(String id) {
    final query = _db.select(_db.habitudes)..where((h) => h.id.equals(id));
    return query.watchSingleOrNull().map(
      (row) => row == null ? null : habitFromRow(row),
    );
  }

  Future<domain.Habit?> obtenirHabitude(String id) async {
    final query = _db.select(_db.habitudes)..where((h) => h.id.equals(id));
    final row = await query.getSingleOrNull();
    return row == null ? null : habitFromRow(row);
  }

  /// Crée l'habitude ET sa plante associée (relation 1-1, voir section 3
  /// de la feuille de route) dans une même transaction, avec des valeurs
  /// de plante par défaut (graine, vitalité 100, aucun streak).
  Future<void> creerHabitudeAvecPlante(domain.Habit habit) async {
    await _db.transaction(() async {
      await _db.into(_db.habitudes).insert(habitToCompanion(habit));
      final plante = domain.Plante(
        id: '${habit.id}_plante',
        habitudeId: habit.id,
      );
      await _db.into(_db.plantes).insert(planteToCompanion(plante));
    });
  }

  Future<void> modifierHabitude(domain.Habit habit) {
    return _db.update(_db.habitudes).replace(habitToCompanion(habit));
  }

  /// Archive sans supprimer (colonne `actif`, voir section 3).
  Future<void> archiveHabitude(String id) {
    return (_db.update(_db.habitudes)..where((h) => h.id.equals(id))).write(
      const HabitudesCompanion(actif: Value(false)),
    );
  }

  Future<void> reactiverHabitudes(String id) {
    return (_db.update(_db.habitudes)..where((h) => h.id.equals(id))).write(
      const HabitudesCompanion(actif: Value(true)),
    );
  }

  /// Suppression définitive — supprime en cascade sa Plante, ses
  /// Completions et ses Reminders (clés étrangères ON DELETE CASCADE).
  Future<void> supprimerHabitude(String id) {
    return (_db.delete(_db.habitudes)..where((h) => h.id.equals(id))).go();
  }
}
// =========================================================================
// Plantes
// =========================================================================

class PlanteRepository {
  PlanteRepository(this._db);
  final AppDatabase _db;

  Stream<domain.Plante?> watchPlante(String habitudeId) {
    final query = _db.select(_db.plantes)
      ..where((p) => p.habitudeId.equals(habitudeId));
    return query.watchSingleOrNull().map(
      (row) => row == null ? null : planteFromRow(row),
    );
  }

  Future<domain.Plante?> obtenirPlante(String habitudeId) async {
    final query = _db.select(_db.plantes)
      ..where((p) => p.habitudeId.equals(habitudeId));
    final row = await query.getSingleOrNull();
    return row == null ? null : planteFromRow(row);
  }

  /// Utilisée par le StreakEngine (section 5) après chaque transition.
  Future<void> mettreAJourPlante(domain.Plante plante) {
    return _db.update(_db.plantes).replace(planteToCompanion(plante));
  }
}

// =========================================================================
// Completions
// =========================================================================

class CompletionRepository {
  CompletionRepository(this._db);
  final AppDatabase _db;

  Stream<List<domain.Completion>> watchCompletions(String habitudeId) {
    final query = _db.select(_db.completions)
      ..where((c) => c.habitudeId.equals(habitudeId))
      ..orderBy([(c) => OrderingTerm.desc(c.date)]);
    return query.watch().map((rows) => rows.map(completionFromRow).toList());
  }

  Future<domain.Completion?> completionPour(
    String habitudeId,
    DateTime date,
  ) async {
    final dateNormalisee = DateTime(date.year, date.month, date.day);
    final query = _db.select(_db.completions)
      ..where(
        (c) => c.habitudeId.equals(habitudeId) & c.date.equals(dateNormalisee),
      );
    final row = await query.getSingleOrNull();
    return row == null ? null : completionFromRow(row);
  }

  /// Marque le statut du jour pour une habitude (coche "fait"/"manque" côté
  /// UI). Met à jour la complétion existante s'il y en a déjà une pour ce
  /// jour, sinon en crée une nouvelle — une seule complétion par
  /// (habitude, date), voir la contrainte unique de la table Completions.
  Future<void> marquerStatut({
    required String habitudeId,
    required DateTime date,
    required StatutCompletion statut,
  }) async {
    await _db.transaction(() async {
      final existance = await completionPour(habitudeId, date);
      final completion = domain.Completion(
        id: existance?.id ?? genereId(),
        habitudeId: habitudeId,
        date: date,
        statut: statut,
      );
      await _db
          .into(_db.completions)
          .insertOnConflictUpdate(completionToCompanion(completion));
    });
  }
}

// =========================================================================
// Reminders
// =========================================================================

class ReminderRepository {
  ReminderRepository(this._db);
  final AppDatabase _db;

  Stream<List<domain.Reminder>> watchReminders(String habitudeId) {
    final query = _db.select(_db.reminders)
      ..where((r) => r.habitudeId.equals(habitudeId));
    return query.watch().map((rows) => rows.map(reminderFromRow).toList());
  }

  Future<void> ajouterReminder(domain.Reminder reminder) {
    return _db.into(_db.reminders).insert(reminderToCompanion(reminder));
  }

  Future<void> modifierReminder(domain.Reminder reminder) {
    return (_db.update(_db.reminders).replace(reminderToCompanion(reminder)));
  }

  Future<void> supprimerReminder(String id) {
    return (_db.delete(_db.reminders)..where((r) => r.id.equals(id))).go();
  }
}

// =========================================================================
// Parametres (clé/valeur — utilisée par le StreakEngine pour
// `derniere_date_calculee`, voir section 5 de la feuille de route)
// =========================================================================

class ParametreRepository {
  ParametreRepository(this._db);
  final AppDatabase _db;

  Future<String?> lire(String cle) async {
    final query = _db.select(_db.parametres)..where((p) => p.cle.equals(cle));
    final row = await query.getSingleOrNull();
    return row?.valeur;
  }

  Future<void> ecrire(String cle, String valeur) {
    return _db
        .into(_db.parametres)
        .insertOnConflictUpdate(
          ParametresCompanion(cle: Value(cle), valeur: Value(valeur)),
        );
  }
}
