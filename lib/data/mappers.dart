import 'package:flutter/material.dart';
import 'package:drift/drift.dart';

import '../domain/models/enums.dart';
import '../domain/models/models.dart' as domain;
import 'database.dart';

// HABITUDE
domain.Habit habitFromRow(Habitude row) {
  final (frequenceType, joursActifs) = _parseFrequence(row.frequence);
  return domain.Habit(
    id: row.id,
    nom: row.nom,
    categorie: HabitCategory.values.byName(row.categorie),
    frequenceType: frequenceType,
    joursActifs: joursActifs,
    dateCreation: row.dateCreation,
    actif: row.actif,
  );
}

HabitudesCompanion habitToCompanion(domain.Habit habit) {
  return HabitudesCompanion(
    id: Value(habit.id),
    nom: Value(habit.nom),
    categorie: Value(habit.categorie.name),
    frequence: Value(
      _serializeFrequence(habit.frequenceType, habit.joursActifs),
    ),
    dateCreation: Value(habit.dateCreation),
    actif: Value(habit.actif),
  );
}

// ---------------------------------------------------------------------
// Plante — mapping 1:1, rien à dériver ici (stade/vitaliteEtat sont des
// getters du domaine, calculés à partir de ces mêmes champs).
// ---------------------------------------------------------------------
domain.Plante planteFromRow(Plante row) {
  return domain.Plante(
    id: row.id,
    habitudeId: row.habitudeId,
    vitalite: row.vitalite,
    joursManquesConsecutifs: row.joursManquesConsecutifs,
    streakActuel: row.streakActuel,
    meilleurStreak: row.meilleurStreak,
    //viesDisponibles: row.viesDisponibles,
  );
}

PlantesCompanion planteToCompanion(domain.Plante plante) {
  return PlantesCompanion(
    id: Value(plante.id),
    habitudeId: Value(plante.habitudeId),
    vitalite: Value(plante.vitalite),
    joursManquesConsecutifs: Value(plante.joursManquesConsecutifs),
    streakActuel: Value(plante.streakActuel),
    meilleurStreak: Value(plante.meilleurStreak),
    //viesDisponibles: Value(plante.viesDisponibles),
  );
}

// ---------------------------------------------------------------------
// Completion
// ---------------------------------------------------------------------
domain.Completion completionFromRow(Completion row) {
  return domain.Completion(
    id: row.id,
    habitudeId: row.habitudeId,
    date: row.date,
    statut: StatutCompletion.values.byName(row.statut),
  );
}

CompletionsCompanion completionToCompanion(domain.Completion completion) {
  return CompletionsCompanion(
    id: Value(completion.id),
    habitudeId: Value(completion.habitudeId),
    date: Value(completion.date),
    statut: Value(completion.statut.name),
  );
}

// ---------------------------------------------------------------------
// Reminder
// ---------------------------------------------------------------------
domain.Reminder reminderFromRow(Reminder row) {
  return domain.Reminder(
    id: row.id,
    habitudeId: row.habitudeId,
    heure: TimeOfDay(hour: row.heure, minute: row.minute),
    typeAlerte: ReminderTypeAlerte.values.byName(row.typeAlerte),
    joursActifs: _parseJours(row.joursActifs),
    repetition: ReminderRepetition.fromDb(row.repetition),
    repetitionValeur: row.repetitionValeur,
    plageNoctureActive: row.plageNocturneActive,
    actif: row.actif,
    relanceActive: row.relanceActive,
  );
}

RemindersCompanion reminderToCompanion(domain.Reminder reminder) {
  return RemindersCompanion(
    id: Value(reminder.id),
    habitudeId: Value(reminder.habitudeId),
    heure: Value(reminder.heure.hour),
    minute: Value(reminder.heure.minute),
    typeAlerte: Value(reminder.typeAlerte.name),
    joursActifs: Value(_joursToCsv(reminder.joursActifs)),
    repetition: Value(reminder.repetition.dbValue),
    repetitionValeur: Value(reminder.repetitionValeur),
    plageNocturneActive: Value(reminder.plageNoctureActive),
    actif: Value(reminder.actif),
    relanceActive: Value(reminder.relanceActive),
  );
}

// ---------------------------------------------------------------------
// Helpers CSV jours actifs (1 = lundi ... 7 = dimanche)
// Partagés entre Habitudes.frequence et Reminders.joursActifs.
// ---------------------------------------------------------------------

Set<int> _parseJours(String csv) {
  if (csv.trim().isEmpty) return {};
  return csv.split(',').map((s) => int.parse(s.trim())).toSet();
}

String _joursToCsv(Set<int> jours) {
  if (jours.isEmpty) return '';
  final tri = jours.toList()..sort();
  return tri.join(',');
}

// La colonne `frequence` de Habitudes stocke soit le littéral
/// "quotidienne", soit une liste CSV de jours (voir database.dart).
(FrequenceType, Set<int>) _parseFrequence(String frequence) {
  if (frequence.trim().toLowerCase() == 'quotidienne') {
    return (FrequenceType.quotidienne, <int>{});
  }
  return (FrequenceType.joursSpecifiques, _parseJours(frequence));
}

String _serializeFrequence(FrequenceType type, Set<int> joursActifs) {
  if (type == FrequenceType.quotidienne) return 'quotidienne';
  return _joursToCsv(joursActifs);
}
