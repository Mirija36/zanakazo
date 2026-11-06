import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/streak_engine.dart';
import 'core_providers.dart';

/// Clé de la table `Parametres` sous laquelle est stockée la date du
/// dernier calcul de streak (voir section 3 et 5 de la feuille de route).
const cleDerniereDateCalculee = 'derniere_date_calculee';

final streakEngineProvider = Provider<StreakEngine>((ref) {
  return StreakEngine(
    ref.watch(completionRepositoryProvider),
    ref.watch(planteRepositoryProvider),
  );
});

/// À observer une seule fois au démarrage de l'app (ex. dans un écran de
/// lancement/splash, avant `home_screen.dart`) : compare la date du dernier
/// calcul à aujourd'hui, rattrape les jours manqués pour toutes les
/// habitudes actives, puis met à jour la date de référence.
///
/// Au tout premier lancement (aucune date stockée), rien n'est rattrapé —
/// seule la date de référence est initialisée, puisqu'aucune habitude ne
/// peut encore avoir de jour manqué.
final startupProvider = FutureProvider<void>((ref) async {
  final habitRepository = ref.watch(habitRepositoryProvider);
  final parametreRepository = ref.watch(parametreRepositoryProvider);
  final streakEngine = ref.watch(streakEngineProvider);

  final aujourdHui = DateTime.now();
  final derniereDateTexte = await parametreRepository.lire(
    cleDerniereDateCalculee,
  );

  if (derniereDateTexte != null) {
    final habitudesActives = await habitRepository.watchHabitudeActives().first;
    await streakEngine.rattraperJour(
      habitudesActives: habitudesActives,
      derniereDate: DateTime.parse(derniereDateTexte),
      aujourdHui: aujourdHui,
    );
  }

  final hier = DateTime(
    aujourdHui.year,
    aujourdHui.month,
    aujourdHui.day,
  ).subtract(const Duration(days: 1));

  await parametreRepository.ecrire(
    cleDerniereDateCalculee,
    _formatDate(aujourdHui),
  );
});

/// Format "AAAA-MM-JJ", lisible par `DateTime.parse` et indépendant du
/// fuseau horaire (pas d'heure, pas de "Z").
String _formatDate(DateTime date) {
  final annee = date.year.toString().padLeft(4, '0');
  final mois = date.month.toString().padLeft(2, '0');
  final jour = date.day.toString().padLeft(2, '0');
  return '$annee-$mois-$jour';
}
