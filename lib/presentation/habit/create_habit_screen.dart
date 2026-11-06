import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../data/repositories.dart' show genereId;
import '../../domain/models/enums.dart';
import '../../domain/models/models.dart' as domain;
import '../../providers/habit_providers.dart';
import '../../providers/reminder_providers.dart';
import '../../theme/app_theme.dart';

/// Écran "Semer une habitude". Choisir une espèce = choisir une catégorie
/// (HabitCategory), il n'y a donc pas de champ catégorie séparé.
class CreateHabitScreen extends ConsumerStatefulWidget {
  const CreateHabitScreen({super.key});

  @override
  ConsumerState<CreateHabitScreen> createState() => _CreateHabitScreenState();
}

class _CreateHabitScreenState extends ConsumerState<CreateHabitScreen> {
  final _nomController = TextEditingController();

  HabitCategory _categorie = HabitCategory.sport;
  FrequenceType _frequence = FrequenceType.quotidienne;
  final Set<int> _jours = {};

  bool _rappelActif = true;
  TimeOfDay _heure = const TimeOfDay(hour: 8, minute: 30);
  ReminderTypeAlerte _alerte = ReminderTypeAlerte.son;
  bool _nocturne = false; // désactivée par défaut (point de vigilance n°5)
  bool _relance = false;

  bool _enCours = false;

  @override
  void initState() {
    super.initState();
    _nomController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _nomController.dispose();
    super.dispose();
  }

  bool get _valide =>
      _nomController.text.trim().isNotEmpty &&
      (_frequence == FrequenceType.quotidienne || _jours.isNotEmpty);

  Future<void> _choisirHeure() async {
    final choix = await showTimePicker(context: context, initialTime: _heure);
    if (choix != null) setState(() => _heure = choix);
  }

  Future<void> _planter() async {
    if (!_valide || _enCours) return;
    setState(() => _enCours = true);

    final joursActifs = _frequence == FrequenceType.quotidienne
        ? <int>{}
        : Set<int>.of(_jours);

    final habitude = domain.Habit(
      id: genereId(),
      nom: _nomController.text.trim(),
      categorie: _categorie,
      frequenceType: _frequence,
      joursActifs: joursActifs,
      dateCreation: DateTime.now(),
    );

    try {
      await ref.read(habitudeActionsProvider).creerHabitude(habitude);

      if (_rappelActif) {
        await ref
            .read(reminderActionsProvider)
            .ajouterReminder(
              domain.Reminder(
                id: genereId(),
                habitudeId: habitude.id,
                heure: _heure,
                typeAlerte: _alerte,
                joursActifs: joursActifs,
                plageNoctureActive: _nocturne,
                relanceActive: _relance,
              ),
            );
      }
      if (mounted) context.pop();
    } catch (e) {
      if (!mounted) return;
      setState(() => _enCours = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Impossible de planter la graine : $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final spacing = theme.extension<AppSpacing>() ?? const AppSpacing();

    return Scaffold(
      appBar: AppBar(title: const Text('Nouvelle habitude')),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(spacing.marginMobile),
          children: [
            Text('Semer une habitude', style: theme.textTheme.headlineLarge),
            SizedBox(height: spacing.xs),
            Text(
              'Donnez vie à une nouvelle routine végétale. Choisissez sa '
              'graine et son rythme de soin.',
              style: theme.textTheme.bodySmall,
            ),
            SizedBox(height: spacing.lg),

            // --- Nom ---
            Text('Nom de l\'habitude', style: theme.textTheme.labelLarge),
            SizedBox(height: spacing.sm),
            TextField(
              controller: _nomController,
              textCapitalization: TextCapitalization.sentences,
              maxLength: 40,
              decoration: const InputDecoration(
                hintText: 'Ex. 20 min d\'étirements',
                prefixIcon: Icon(Icons.eco_outlined),
                counterText: '',
              ),
            ),
            SizedBox(height: spacing.lg),

            // --- Espèce ---
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Choisir l\'espèce de graine',
                    style: theme.textTheme.labelLarge,
                  ),
                ),
                Text(
                  '${_categorie.speciesName} sélectionné',
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: theme.colorScheme.primary,
                  ),
                ),
              ],
            ),
            SizedBox(height: spacing.sm),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: spacing.gutterMobile,
              crossAxisSpacing: spacing.gutterMobile,
              childAspectRatio: 1.35,
              children: [
                for (final c in HabitCategory.values)
                  _EspeceCard(
                    categorie: c,
                    selectionnee: c == _categorie,
                    onTap: () => setState(() => _categorie = c),
                  ),
              ],
            ),
            SizedBox(height: spacing.lg),

            // --- Fréquence ---
            _Section(
              titre: 'Fréquence d\'arrosage',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SegmentedButton<FrequenceType>(
                    showSelectedIcon: false,
                    segments: const [
                      ButtonSegment(
                        value: FrequenceType.quotidienne,
                        label: Text('Quotidienne'),
                      ),
                      ButtonSegment(
                        value: FrequenceType.joursSpecifiques,
                        label: Text('Jours choisis'),
                      ),
                    ],
                    selected: {_frequence},
                    onSelectionChanged: (s) =>
                        setState(() => _frequence = s.first),
                  ),
                  if (_frequence == FrequenceType.joursSpecifiques) ...[
                    SizedBox(height: spacing.md),
                    _SelecteurJours(
                      jours: _jours,
                      onChanged: (jour, actif) => setState(() {
                        actif ? _jours.add(jour) : _jours.remove(jour);
                      }),
                    ),
                  ],
                ],
              ),
            ),
            SizedBox(height: spacing.md),

            // --- Rappel ---
            _Section(
              titre: 'Rappel',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SwitchListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('Me rappeler d\'arroser'),
                    value: _rappelActif,
                    onChanged: (v) => setState(() => _rappelActif = v),
                  ),
                  if (_rappelActif) ...[
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: const Text('Moment de soin'),
                      trailing: ActionChip(
                        avatar: const Icon(Icons.schedule, size: 18),
                        label: Text(_heure.format(context)),
                        onPressed: _choisirHeure,
                      ),
                    ),
                    SizedBox(height: spacing.sm),
                    Text(
                      'Tonalité du rappel',
                      style: theme.textTheme.labelMedium,
                    ),
                    SizedBox(height: spacing.sm),
                    SegmentedButton<ReminderTypeAlerte>(
                      showSelectedIcon: false,
                      segments: [
                        for (final t in ReminderTypeAlerte.values)
                          ButtonSegment(value: t, label: Text(t.label)),
                      ],
                      selected: {_alerte},
                      onSelectionChanged: (s) =>
                          setState(() => _alerte = s.first),
                    ),
                    SwitchListTile(
                      contentPadding: EdgeInsets.zero,
                      title: const Text('Fenêtre nocturne'),
                      subtitle: const Text('Ne pas déranger entre 22h et 07h'),
                      value: _nocturne,
                      onChanged: (v) => setState(() => _nocturne = v),
                    ),
                    SwitchListTile(
                      contentPadding: EdgeInsets.zero,
                      title: const Text('Relance si non fait'),
                      subtitle: const Text('Un second rappel doux (+2 h)'),
                      value: _relance,
                      onChanged: (v) => setState(() => _relance = v),
                    ),
                  ],
                ],
              ),
            ),
            SizedBox(height: spacing.lg),

            // --- Bouton ---
            FilledButton.icon(
              onPressed: _valide && !_enCours ? _planter : null,
              style: FilledButton.styleFrom(
                shape: const StadiumBorder(),
                padding: EdgeInsets.symmetric(vertical: spacing.md),
              ),
              icon: _enCours
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.eco),
              label: const Text('Planter cette graine'),
            ),
            SizedBox(height: spacing.sm),
            Center(
              child: Text(
                'Votre plante débutera au stade de graine',
                style: theme.textTheme.labelSmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Section extends StatelessWidget {
  const _Section({required this.titre, required this.child});
  final String titre;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final spacing = theme.extension<AppSpacing>() ?? const AppSpacing();
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(spacing.md),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(
          (theme.extension<AppRadii>() ?? const AppRadii()).md,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(titre, style: theme.textTheme.headlineSmall),
          SizedBox(height: spacing.sm),
          child,
        ],
      ),
    );
  }
}

class _EspeceCard extends StatelessWidget {
  const _EspeceCard({
    required this.categorie,
    required this.selectionnee,
    required this.onTap,
  });

  final HabitCategory categorie;
  final bool selectionnee;
  final VoidCallback onTap;

  static const _accroches = {
    HabitCategory.sport: 'Racine puissante',
    HabitCategory.sante: 'Graine aquatique',
    HabitCategory.lecture: 'Nervures en éventail',
    HabitCategory.creativite: 'Bourgeon délicat',
    HabitCategory.travail: 'Résistance aride',
    HabitCategory.general: 'Jeune pousse pure',
  };

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final radii = theme.extension<AppRadii>() ?? const AppRadii();

    return Material(
      color: cs.surfaceContainerLow,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radii.md),
        side: BorderSide(
          color: selectionnee ? cs.primary : Colors.transparent,
          width: 2,
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(radii.md),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(categorie.label, style: theme.textTheme.labelMedium),
                  const Spacer(),
                  if (selectionnee)
                    Icon(Icons.check_circle, size: 20, color: cs.primary),
                ],
              ),
              const Spacer(),
              Text(categorie.speciesName, style: theme.textTheme.labelLarge),
              Text(
                _accroches[categorie]!,
                style: theme.textTheme.labelSmall,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SelecteurJours extends StatelessWidget {
  const _SelecteurJours({required this.jours, required this.onChanged});
  final Set<int> jours;
  final void Function(int jour, bool actif) onChanged;

  static const _noms = ['Lun', 'Mar', 'Mer', 'Jeu', 'Ven', 'Sam', 'Dim'];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 6,
      children: [
        for (var i = 0; i < 7; i++)
          FilterChip(
            label: Text(_noms[i]),
            selected: jours.contains(i + 1), // 1 = lundi ... 7 = dimanche
            onSelected: (v) => onChanged(i + 1, v),
          ),
      ],
    );
  }
}
