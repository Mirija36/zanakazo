import 'package:flutter/material.dart';

/// Nom de famille déclaré dans pubspec.yaml (voir section "Polices" plus bas) —
/// chargée localement, aucune dépendance réseau (google_fonts n'est pas utilisé).
const _fontFamily = 'Plus Jakarta Sans';

/// Espacements de `DESIGN_zanakazo.md` (section "spacing"), exposés comme
/// `ThemeExtension` pour être lus avec `Theme.of(context).extension<AppSpacing>()`
/// plutôt que recopiés en dur dans chaque écran.
class AppSpacing extends ThemeExtension<AppSpacing> {
  const AppSpacing({
    this.gutter = 16,
    this.gutterMobile = 12,
    this.margin = 24,
    this.marginMobile = 20,
    this.xs = 4,
    this.sm = 8,
    this.md = 16,
    this.lg = 24,
    this.xl = 32,
    this.xl2 = 48,
  });

  final double gutter;
  final double gutterMobile;
  final double margin;
  final double marginMobile;
  final double xs;
  final double sm;
  final double md;
  final double lg;
  final double xl;
  final double xl2;

  @override
  AppSpacing copyWith({
    double? gutter,
    double? gutterMobile,
    double? margin,
    double? marginMobile,
    double? xs,
    double? sm,
    double? md,
    double? lg,
    double? xl,
    double? xl2,
  }) {
    return AppSpacing(
      gutter: gutter ?? this.gutter,
      gutterMobile: gutterMobile ?? this.gutterMobile,
      margin: margin ?? this.margin,
      marginMobile: marginMobile ?? this.marginMobile,
      xs: xs ?? this.xs,
      sm: sm ?? this.sm,
      md: md ?? this.md,
      lg: lg ?? this.lg,
      xl: xl ?? this.xl,
      xl2: xl2 ?? this.xl2,
    );
  }

  @override
  AppSpacing lerp(ThemeExtension<AppSpacing>? other, double t) {
    // Les espacements ne changent pas entre clair/sombre : pas d'interpolation
    // nécessaire, on garde simplement les valeurs courantes.
    return this;
  }
}

/// Rayons d'arrondi de `DESIGN_zanakazo.md` (section "rounded").
class AppRadii extends ThemeExtension<AppRadii> {
  const AppRadii({
    this.sm = 8,
    this.defaultRadius = 16,
    this.md = 24,
    this.lg = 32,
    this.xl = 48,
  });

  final double sm;
  final double defaultRadius;
  final double md;
  final double lg;
  final double xl;

  /// Pilule complète (`rounded: full` = 9999px) — utilisée pour boutons,
  /// chips et champs de texte.
  static const BorderRadius pill = BorderRadius.all(Radius.circular(9999));

  BorderRadius get card =>
      BorderRadius.circular(xl); // cartes d'habitude/plante
  BorderRadius get sheet => BorderRadius.only(
    topLeft: Radius.circular(xl),
    topRight: Radius.circular(xl),
  );

  @override
  AppRadii copyWith({
    double? sm,
    double? defaultRadius,
    double? md,
    double? lg,
    double? xl,
  }) {
    return AppRadii(
      sm: sm ?? this.sm,
      defaultRadius: defaultRadius ?? this.defaultRadius,
      md: md ?? this.md,
      lg: lg ?? this.lg,
      xl: xl ?? this.xl,
    );
  }

  @override
  AppRadii lerp(ThemeExtension<AppRadii>? other, double t) => this;
}

/// Thème de l'application, construit à partir des jetons de couleur et de
/// typographie de `DESIGN_zanakazo.md` ("Serene Botanical Habit Canvas").
abstract final class AppTheme {
  // -----------------------------------------------------------------------
  // Couleurs — clair : reprend directement les jetons du fichier de design
  // (c'est un ColorScheme Material 3 complet, les noms correspondent 1:1).
  // -----------------------------------------------------------------------
  static const ColorScheme _lightScheme = ColorScheme(
    brightness: Brightness.light,
    surface: Color(0xFFFCF9F3),
    onSurface: Color(0xFF1C1C18),
    onSurfaceVariant: Color(0xFF414941),
    surfaceContainerLowest: Color(0xFFFFFFFF),
    surfaceContainerLow: Color(0xFFF6F3ED),
    surfaceContainer: Color(0xFFF0EEE8),
    surfaceContainerHigh: Color(0xFFEBE8E2),
    surfaceContainerHighest: Color(0xFFE5E2DC),
    surfaceDim: Color(0xFFDCDAD4),
    surfaceBright: Color(0xFFFCF9F3),
    surfaceTint: Color(0xFF3B6845),
    inverseSurface: Color(0xFF31312D),
    onInverseSurface: Color(0xFFF3F0EA),
    outline: Color(0xFF727970),
    outlineVariant: Color(0xFFC1C9BF),
    primary: Color(0xFF265332),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFF3E6B48),
    onPrimaryContainer: Color(0xFFB7E9BE),
    inversePrimary: Color(0xFFA1D2A8),
    primaryFixed: Color(0xFFBCEFC3),
    primaryFixedDim: Color(0xFFA1D2A8),
    onPrimaryFixed: Color(0xFF00210B),
    onPrimaryFixedVariant: Color(0xFF23502F),
    secondary: Color(0xFF41674B),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFC2EDCA),
    onSecondaryContainer: Color(0xFF476D51),
    secondaryFixed: Color(0xFFC2EDCA),
    secondaryFixedDim: Color(0xFFA7D1AF),
    onSecondaryFixed: Color(0xFF00210E),
    onSecondaryFixedVariant: Color(0xFF294E35),
    tertiary: Color(0xFF743917),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFF91502C),
    onTertiaryContainer: Color(0xFFFFD4C0),
    tertiaryFixed: Color(0xFFFFDBCB),
    tertiaryFixedDim: Color(0xFFFFB691),
    onTertiaryFixed: Color(0xFF341100),
    onTertiaryFixedVariant: Color(0xFF713714),
    error: Color(0xFFBA1A1A),
    onError: Color(0xFFFFFFFF),
    errorContainer: Color(0xFFFFDAD6),
    onErrorContainer: Color(0xFF93000A),
  );

  // -----------------------------------------------------------------------
  // Couleurs — sombre : `DESIGN_zanakazo.md` ne donne que deux surfaces
  // ("Deep Forest" / "Slate Moss"), pas un jeu de jetons complet. Le reste
  // du schéma sombre est généré à partir de la couleur primaire (Material 3
  // standard), puis on y réinjecte les deux surfaces nommées et le vert plus
  // clair déjà prévu comme `inversePrimary` (cohérent avec l'usage habituel
  // d'un primary plus clair sur fond sombre). À ajuster si tu obtiens un
  // jour un jeu de jetons sombres complet.
  // -----------------------------------------------------------------------

  static final ColorScheme _darkScheme =
      ColorScheme.fromSeed(
        seedColor: const Color(0xFF3E6B48),
        brightness: Brightness.dark,
      ).copyWith(
        surface: const Color(0xFF16221A), // Deep Forest
        surfaceContainer: const Color(0xFF1F2E24), // Slate Moss
        surfaceContainerLow: const Color(0xFF192017),
        surfaceContainerHigh: const Color(0xFF25332A),
        primary: const Color(0xFFA1D2A8), // inverse-primary du jeton clair
        onPrimary: const Color(0xFF00210B),
        tertiary: const Color(0xFFFFB691),
        onTertiary: const Color(0xFF341100),
      );

  static ColorScheme scheme(Brightness brightness) =>
      brightness == Brightness.dark ? _darkScheme : _lightScheme;

  // -----------------------------------------------------------------------
  // Typographie — Plus Jakarta Sans, échelle de `DESIGN_zanakazo.md`
  // ("typography"). `height` en Flutter est un multiplicateur de la taille
  // de police (lineHeight / fontSize), pas une valeur absolue.
  // -----------------------------------------------------------------------

  static TextTheme _textTheme(ColorScheme colorScheme) {
    final color = colorScheme.onSurface;

    TextStyle style({
      required double fontSize,
      required FontWeight weight,
      required double height,
      double letterSpacing = 0,
    }) {
      return TextStyle(
        fontFamily: _fontFamily,
        fontSize: fontSize,
        fontWeight: weight,
        height: height,
        letterSpacing: letterSpacing,
        color: color,
      );
    }

    return TextTheme(
      displayLarge: style(
        fontSize: 48,
        weight: FontWeight.w700,
        height: 56 / 48,
        letterSpacing: -0.96,
      ),
      headlineLarge: style(
        fontSize: 32,
        weight: FontWeight.w700,
        height: 40 / 32,
        letterSpacing: -0.48,
      ),
      headlineMedium: style(
        fontSize: 24,
        weight: FontWeight.w600,
        height: 32 / 24,
        letterSpacing: -0.24,
      ),
      headlineSmall: style(
        fontSize: 20,
        weight: FontWeight.w600,
        height: 28 / 20,
      ),
      bodyLarge: style(fontSize: 18, weight: FontWeight.w400, height: 28 / 18),
      bodyMedium: style(fontSize: 16, weight: FontWeight.w400, height: 24 / 16),
      bodySmall: style(fontSize: 14, weight: FontWeight.w400, height: 20 / 14),
      labelLarge: style(
        fontSize: 14,
        weight: FontWeight.w600,
        height: 20 / 14,
        letterSpacing: 0.14,
      ),
      labelMedium: style(
        fontSize: 12,
        weight: FontWeight.w600,
        height: 16 / 12,
        letterSpacing: 0.24,
      ),
      labelSmall: style(
        fontSize: 11,
        weight: FontWeight.w500,
        height: 14 / 11,
        letterSpacing: 0.33,
      ),
    );
  }

  // -----------------------------------------------------------------------
  // ThemeData
  // -----------------------------------------------------------------------

  static ThemeData light() => _build(_lightScheme);
  static ThemeData dark() => _build(_darkScheme);

  static ThemeData _build(ColorScheme colorScheme) {
    const spacing = AppSpacing();
    const radii = AppRadii();
    final textTheme = _textTheme(colorScheme);

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colorScheme.surface,
      fontFamily: _fontFamily,
      textTheme: textTheme,
      extensions: const [spacing, radii],

      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: textTheme.headlineSmall,
      ),

      cardTheme: CardThemeData(
        color: colorScheme.surfaceContainerLow,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: radii.card),
        margin: EdgeInsets.zero,
      ),

      chipTheme: ChipThemeData(
        backgroundColor: colorScheme.secondaryContainer,
        labelStyle: textTheme.labelMedium?.copyWith(
          color: colorScheme.onSecondaryContainer,
        ),
        shape: const StadiumBorder(),
        side: BorderSide.none,
        padding: EdgeInsets.symmetric(
          horizontal: spacing.sm,
          vertical: spacing.xs,
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          shape: const StadiumBorder(),
          padding: EdgeInsets.symmetric(
            horizontal: spacing.lg,
            vertical: spacing.md,
          ),
          textStyle: textTheme.labelLarge,
          elevation: 0,
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: colorScheme.secondary,
          side: BorderSide(color: colorScheme.secondary, width: 1.5),
          shape: const StadiumBorder(),
          padding: EdgeInsets.symmetric(
            horizontal: spacing.lg,
            vertical: spacing.md,
          ),
          textStyle: textTheme.labelLarge,
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: colorScheme.primary,
          shape: const StadiumBorder(),
          textStyle: textTheme.labelLarge,
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colorScheme.surfaceContainerLow,
        hintStyle: textTheme.bodyMedium?.copyWith(
          color: colorScheme.onSurfaceVariant,
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: spacing.md,
          vertical: spacing.md,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radii.md),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radii.md),
          borderSide: BorderSide(color: colorScheme.primary, width: 1.5),
        ),
      ),

      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.selected)
              ? colorScheme.onPrimary
              : colorScheme.outline,
        ),
        trackColor: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.selected)
              ? colorScheme.primary
              : colorScheme.surfaceContainerHighest,
        ),
      ),

      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: colorScheme.surfaceContainerLow,
        indicatorColor: colorScheme.secondaryContainer,
        elevation: 0,
        labelTextStyle: WidgetStateProperty.resolveWith(
          (states) => textTheme.labelSmall?.copyWith(
            color: states.contains(WidgetState.selected)
                ? colorScheme.onSecondaryContainer
                : colorScheme.onSurfaceVariant,
          ),
        ),
      ),

      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: colorScheme.surfaceContainerLowest,
        shape: RoundedRectangleBorder(borderRadius: radii.sheet),
      ),

      dividerTheme: DividerThemeData(
        color: colorScheme.outlineVariant,
        thickness: 1,
      ),
    );
  }
}
