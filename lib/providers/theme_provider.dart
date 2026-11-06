import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../data/repositories.dart';
import 'core_providers.dart';

/// Clé de la table `Parametres` sous laquelle est stocké le choix de thème
/// de l'utilisateur (écran Réglages, "Préférences d'ambiance" > "Thème visuel").

const cleThemeMode = 'theme_mode';

final themeModeProvider = StateNotifierProvider<ThemeModeController, ThemeMode>(
  (ref) {
    return ThemeModeController(ref.watch(parametreRepositoryProvider));
  },
);

class ThemeModeController extends StateNotifier<ThemeMode> {
  ThemeModeController(this._parametreRepository) : super(ThemeMode.system) {
    _charger();
  }

  final ParametreRepository _parametreRepository;

  Future<void> _charger() async {
    final valeur = await _parametreRepository.lire(cleThemeMode);
    state = _depuisTexte(valeur);
  }

  /// Appelée par le sélecteur "Clair / Sombre / Système" de l'écran Réglages.
  Future<void> definir(ThemeMode mode) async {
    state = mode;
    await _parametreRepository.ecrire(cleThemeMode, _versTexte(mode));
  }

  static ThemeMode _depuisTexte(String? valeur) {
    return switch (valeur) {
      'clair' => ThemeMode.light,
      'sombre' => ThemeMode.dark,
      _ => ThemeMode.system,
    };
  }

  static String _versTexte(ThemeMode mode) {
    return switch (mode) {
      ThemeMode.light => 'clair',
      ThemeMode.dark => 'sombre',
      ThemeMode.system => 'systeme',
    };
  }
}
