/// Les 6 catégories d'habitudes, chacune liée à UNE SEULE espèce fixe.
/// Voir feuille de route section 2.

enum HabitCategory {
  sport,
  sante,
  lecture,
  creativite,
  travail,
  general;

  String get label => switch (this) {
    HabitCategory.sport => 'Sport',
    HabitCategory.sante => 'Santé',
    HabitCategory.lecture => 'Lecture',
    HabitCategory.creativite => 'Créativité',
    HabitCategory.travail => 'Travail',
    HabitCategory.general => 'Général',
  };

  /// Les 6 catégories d'habitudes, chacune liée à UNE SEULE espèce fixe.
  /// Voir feuille de route section 2.
  String get speciesId => switch (this) {
    HabitCategory.sport => 'baobab',
    HabitCategory.sante => 'nenuphar',
    HabitCategory.lecture => 'ravinala',
    HabitCategory.creativite => 'orchidee',
    HabitCategory.travail => 'cactus',
    HabitCategory.general => 'zanakazo',
  };

  String get speciesName => switch (this) {
    HabitCategory.sport => 'Baobab',
    HabitCategory.sante => 'Nénuphar',
    HabitCategory.lecture => 'Ravinala',
    HabitCategory.creativite => 'Orchidée',
    HabitCategory.travail => 'Cactus',
    HabitCategory.general => 'Zanakazo',
  };
}

enum FrequenceType {
  quotidienne,
  joursSpecifiques;

  String get label => switch (this) {
    FrequenceType.quotidienne => 'Quotidienne',
    FrequenceType.joursSpecifiques => 'Jours spécifiques de la semaine',
  };
}

/// Les 5 stades de croissance, communs à toutes les espèces, dérivés du
/// streak actuel. Voir feuille de route section 4-A.
enum GrowthStage {
  graine,
  pousse,
  jeunePlant,
  mature,
  epanouie;

  String get label => switch (this) {
    GrowthStage.graine => 'Graine',
    GrowthStage.pousse => 'Pousse',
    GrowthStage.jeunePlant => 'Jeune plant',
    GrowthStage.mature => 'Mature',
    GrowthStage.epanouie => 'Épanouie',
  };

  String get assetName => switch (this) {
    GrowthStage.graine => 'graine',
    GrowthStage.pousse => 'pousse',
    GrowthStage.jeunePlant => 'jeune',
    GrowthStage.mature => 'mature',
    GrowthStage.epanouie => 'epanouie',
  };

  int get minStreak => switch (this) {
    GrowthStage.graine => 0,
    GrowthStage.pousse => 1,
    GrowthStage.jeunePlant => 4,
    GrowthStage.mature => 10,
    GrowthStage.epanouie => 30,
  };

  static GrowthStage fromStreak(int streak) {
    if (streak >= GrowthStage.epanouie.minStreak) return GrowthStage.epanouie;
    if (streak >= GrowthStage.mature.minStreak) return GrowthStage.mature;
    if (streak >= GrowthStage.jeunePlant.minStreak)
      return GrowthStage.jeunePlant;
    if (streak >= GrowthStage.pousse.minStreak) return GrowthStage.pousse;
    return GrowthStage.graine;
  }
}

/// Les 4 états de vitalité + la mort, dérivés du nombre de jours manqués
/// consécutifs. Voir feuille de route section 1 et 4-B.
/// IMPORTANT (point de vigilance n°3 de la feuille de route) : ceci est
/// INDÉPENDANT du streak. Le streak repart à 0 dès qu'un jour est manqué ;
/// la vitalité amortit uniquement le rendu visuel/émotionnel.
enum VitalityState {
  normale,
  legerementFanee,
  fanee,
  tresFanee,
  morte;

  /// Nombre de jours manqués consécutifs qui tuent la plante.
  static const int joursAvantMort = 4;

  String get label => switch (this) {
    VitalityState.normale => 'Normale',
    VitalityState.legerementFanee => 'Légèrement fanée',
    VitalityState.fanee => 'Fanée',
    VitalityState.tresFanee => 'Très fanée',
    VitalityState.morte => 'Morte',
  };

  /// Valeur de vitalité (0-100) associée à ce palier, pour l'affichage
  /// d'une barre de progression si besoin.
  int get vitalityValue => switch (this) {
    VitalityState.normale => 100,
    VitalityState.legerementFanee => 75,
    VitalityState.fanee => 50,
    VitalityState.tresFanee => 25,
    VitalityState.morte => 0,
  };

  /// État vivant correspondant à une valeur de vitalité (jamais `morte`).
  static VitalityState fromVitalite(int vitalite) {
    if (vitalite >= 100) return VitalityState.normale;
    if (vitalite >= 75) return VitalityState.legerementFanee;
    if (vitalite >= 50) return VitalityState.fanee;
    return VitalityState.tresFanee;
  }

  /// Nombre de jours restants avant la mort de la plante (point de
  /// vigilance n°4 : jours_restants = 4 - jours_manques_consecutifs).
  static int joursRestantsAvantMort(int joursManquesConsecutifs) {
    final restants = joursAvantMort - joursManquesConsecutifs;
    return restants < 0 ? 0 : restants;
  }
}

enum ReminderTypeAlerte {
  silencieux,
  son,
  alarme;

  String get label => switch (this) {
    ReminderTypeAlerte.silencieux => 'Silencieux',
    ReminderTypeAlerte.son => 'Son',
    ReminderTypeAlerte.alarme => 'Alarme',
  };
}

enum ReminderRepetition {
  heurePrecise('heure_precise', 0),
  toutesLesXMinutes('toutes_les_x_minutes', 1),
  toutesLesXHeures('toutes_les_x_heures', 60);

  const ReminderRepetition(this.dbValue, this.minutesParUnite);

  /// Valeur stockée dans la colonne `repetition`.
  final String dbValue;

  /// Nombre de minutes dans une unité de `repetitionValeur`.
  final int minutesParUnite;

  String get label => switch (this) {
    ReminderRepetition.heurePrecise => 'Heure précise',
    ReminderRepetition.toutesLesXMinutes => 'Toutes les X minutes',
    ReminderRepetition.toutesLesXHeures => 'Toutes les X heures',
  };

  static ReminderRepetition fromDb(String value) =>
      ReminderRepetition.values.firstWhere((r) => r.dbValue == value);
}

enum StatutCompletion {
  fait,
  manque;

  String get label => switch (this) {
    StatutCompletion.fait => 'Fait',
    StatutCompletion.manque => 'Manqué',
  };
}
