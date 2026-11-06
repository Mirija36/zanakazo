import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/models/models.dart' as domain;
import 'core_providers.dart';

// =========================================================================
// Lecture
// =========================================================================

/// Les reminders d'une habitude donnée. Il peut y en avoir plusieurs par
/// habitude (ex. un rappel du matin et un du soir), voir section 3 de la
/// feuille de route — aucun reminder n'existe indépendamment d'une
/// habitude, donc pas de provider "tous les reminders" ici.
final remindersProvider = StreamProvider.family<List<domain.Reminder>, String>((
  ref,
  habitudeId,
) {
  return ref.watch(reminderRepositoryProvider).watchReminders(habitudeId);
});

// =========================================================================
// Écriture
// =========================================================================
final reminderActionsProvider = Provider<ReminderActions>((ref) {
  return ReminderActions(ref);
});

class ReminderActions {
  ReminderActions(this._ref);
  final Ref _ref;

  /// Ajoute un reminder (configuration faite depuis l'écran de création ou
  /// de détail d'une habitude, section 7 - sprint 3).
  Future<void> ajouterReminder(domain.Reminder reminder) {
    return _ref.read(reminderRepositoryProvider).ajouterReminder(reminder);
  }

  Future<void> modifierReminder(domain.Reminder reminder) {
    return _ref.read(reminderRepositoryProvider).modifierReminder(reminder);
  }

  Future<void> supprimerReminder(String reminderId) {
    return _ref.read(reminderRepositoryProvider).supprimerReminder(reminderId);
  }
}
