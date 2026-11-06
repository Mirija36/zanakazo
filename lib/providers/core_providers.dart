import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/database.dart';
import '../data/repositories.dart';

/// Instance unique de la base Drift pour toute l'app. Fermée automatiquement
/// quand le provider est disposé (ce qui n'arrive normalement qu'à la
/// fermeture de l'app, ce provider n'étant pas `autoDispose`).
final appDatabaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(db.close);
  return db;
});

final habitRepositoryProvider = Provider<HabitRepository>((ref) {
  return HabitRepository(ref.watch(appDatabaseProvider));
});

final planteRepositoryProvider = Provider<PlanteRepository>((ref) {
  return PlanteRepository(ref.watch(appDatabaseProvider));
});

final completionRepositoryProvider = Provider<CompletionRepository>((ref) {
  return CompletionRepository(ref.watch(appDatabaseProvider));
});

final reminderRepositoryProvider = Provider<ReminderRepository>((ref) {
  return ReminderRepository(ref.watch(appDatabaseProvider));
});

final parametreRepositoryProvider = Provider<ParametreRepository>((ref) {
  return ParametreRepository(ref.watch(appDatabaseProvider));
});
