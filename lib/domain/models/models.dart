import 'package:flutter/material.dart';

import 'enums.dart';

/// Représentation domaine d'une habitude (indépendante du stockage Drift).
class Habit {
  final String id;
  final String nom;
  final HabitCategory categorie;
  final FrequenceType frequenceType;
  final Set<int> joursActifs;
  final DateTime dateCreation;
  final bool actif;

  const Habit({
    required this.id,
    required this.nom,
    required this.categorie,
    required this.frequenceType,
    required this.joursActifs,
    required this.dateCreation,
    this.actif = true,
  }) : assert(
         frequenceType == FrequenceType.quotidienne || joursActifs.length > 0,
         'Une fréquence "jours actifs" doit préciser au moins un jour.',
       );

  /// espece_plante — dérivée de categorie, jamais stockée.
  String get espece => categorie.speciesId;
  String get especeNom => categorie.speciesName;

  /// Est-ce que cette habitude est prévue le [date] donné ?
  bool estPrevuePour(DateTime date) {
    if (frequenceType == FrequenceType.quotidienne) return true;
    return joursActifs.contains(date.weekday);
  }

  Habit copyWith({
    String? nom,
    HabitCategory? categorie,
    FrequenceType? frequenceType,
    Set<int>? joursActifs,
    bool? actif,
  }) {
    return Habit(
      id: id,
      nom: nom ?? this.nom,
      categorie: categorie ?? this.categorie,
      frequenceType: frequenceType ?? this.frequenceType,
      joursActifs: joursActifs ?? this.joursActifs,
      dateCreation: dateCreation,
      actif: actif ?? this.actif,
    );
  }
}

/// Représentation domaine d'une plante — reflète la table Plantes :
/// plante_id, stade, vitalite, jours_manques_consecutifs, streak_actuel,
/// meilleur_streak, habitude_id.
/// `vitaliteEtat` (VitalityState) et `joursRestantsAvantMort` ne sont pas
/// stockés : ils sont dérivés de `joursManquesConsecutifs`, exactement
/// comme le stade de croissance est dérivé du streak (voir feuille de
/// route, points de vigilance n°3 et n°4 : vitalité et streak sont deux
/// mécaniques indépendantes).
class Plante {
  final String id;
  final String habitudeId;

  final int vitalite;
  final int joursManquesConsecutifs;
  final int streakActuel;
  final int meilleurStreak;

  // final int viesDisponibles; // V2
  const Plante({
    required this.id,
    required this.habitudeId,
    this.vitalite = 100,
    this.joursManquesConsecutifs = 0,
    this.streakActuel = 0,
    this.meilleurStreak = 0,
  }) : assert(
         vitalite >= 0 && vitalite <= 100,
         'vitalite doit être entre 0 et 100',
       ),
       assert(
         joursManquesConsecutifs >= 0 &&
             joursManquesConsecutifs <= VitalityState.joursAvantMort,
         'joursManquesConsecutifs doit être entre 0 et 4',
       ),
       assert(streakActuel >= 0 && meilleurStreak >= 0);
  //assert(viesDisponibles >= 0);

  GrowthStage get stade => GrowthStage.fromStreak(streakActuel);

  /// État de vitalité dérivé
  VitalityState get vitaliteEtat =>
      estMorte ? VitalityState.morte : VitalityState.fromVitalite(vitalite);

  /// Jours restants avant la mort (4 - joursManquesConsecutifs, jamais < 0).
  int get joursRestantsAvantMort =>
      VitalityState.joursRestantsAvantMort(joursManquesConsecutifs);

  bool get estMorte => joursManquesConsecutifs >= VitalityState.joursAvantMort;

  Plante copyWith({
    int? vitalite,
    int? joursManquesConsecutifs,
    int? streakActuel,
    int? meilleurStreak,
    //int? viesDisponibles,
  }) {
    return Plante(
      id: id,
      habitudeId: habitudeId,
      vitalite: vitalite ?? this.vitalite,
      joursManquesConsecutifs:
          joursManquesConsecutifs ?? this.joursManquesConsecutifs,
      streakActuel: streakActuel ?? this.streakActuel,
      meilleurStreak: meilleurStreak ?? this.meilleurStreak,
      // viesDisponibles: viesDisponibles ?? this.viesDisponibles,
    );
  }
}

class Completion {
  final String id;
  final String habitudeId;

  /// Toujours normalisée à minuit (année/mois/jour), sans heure
  final DateTime date;
  final StatutCompletion statut;

  Completion({
    required this.id,
    required this.habitudeId,
    required DateTime date,
    required this.statut,
  }) : date = DateTime(date.year, date.month, date.day);

  Completion copyWith({StatutCompletion? statut}) {
    return Completion(
      id: id,
      habitudeId: habitudeId,
      date: date,
      statut: statut ?? this.statut,
    );
  }
}

class Reminder {
  /// Écart minimum entre deux répétitions, en minutes.
  static const int minEcartMinutes = 15;

  final String id;
  final String habitudeId;

  final TimeOfDay heure;
  final ReminderTypeAlerte typeAlerte;

  final Set<int> joursActifs;

  final ReminderRepetition repetition;
  final int? repetitionValeur;
  final bool plageNoctureActive;
  final bool actif;
  final bool relanceActive;

  Reminder({
    required this.id,
    required this.habitudeId,
    required this.heure,
    required this.typeAlerte,
    this.joursActifs = const {},
    this.repetition = ReminderRepetition.heurePrecise,
    this.repetitionValeur,
    this.plageNoctureActive = false,
    this.actif = true,
    this.relanceActive = false,
  }) : assert(
         _repetitionValide(repetition, repetitionValeur),
         'repetitionValeur doit être null pour heure_precise, '
         'et >= 15 (minimum d\'écart) sinon.',
       );

  static bool _repetitionValide(ReminderRepetition r, int? valeur) {
    if (r == ReminderRepetition.heurePrecise) return valeur == null;
    return valeur != null && valeur * r.minutesParUnite >= minEcartMinutes;
  }

  bool get estRepetitif => repetition != ReminderRepetition.heurePrecise;

  /// Écart entre deux répétitions en minutes (null si heure précise).
  int? get ecartMinutes {
    final v = repetitionValeur;
    return v == null ? null : v * repetition.minutesParUnite;
  }

  /// Est-ce que ce reminder est actif le [date] donné ?
  bool estActifPour(DateTime date) {
    if (joursActifs.isEmpty) return true;
    return joursActifs.contains(date.weekday);
  }

  Reminder copyWith({
    TimeOfDay? heure,
    ReminderTypeAlerte? typeAlerte,
    Set<int>? joursActifs,
    ReminderRepetition? repetition,
    int? repetitionValeur,
    bool? plageNoctureActive,
    bool? actif,
    bool? relanceActive,
  }) {
    return Reminder(
      id: id,
      habitudeId: habitudeId,
      heure: heure ?? this.heure,
      typeAlerte: typeAlerte ?? this.typeAlerte,
      joursActifs: joursActifs ?? this.joursActifs,
      repetition: repetition ?? this.repetition,
      repetitionValeur: repetitionValeur ?? this.repetitionValeur,
      plageNoctureActive: plageNoctureActive ?? this.plageNoctureActive,
      actif: actif ?? this.actif,
      relanceActive: relanceActive ?? this.relanceActive,
    );
  }
}
