import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'database.g.dart';

class Habitudes extends Table {
  TextColumn get id => text()();
  TextColumn get nom => text()();
  TextColumn get categorie => text()();
  TextColumn get frequence =>
      text().withDefault(const Constant('quotidienne'))();
  DateTimeColumn get dateCreation => dateTime()();
  BoolColumn get actif => boolean().withDefault(const Constant(true))();

  @override
  Set<Column> get primaryKey => {id};
}

class Plantes extends Table {
  TextColumn get id => text()();
  //TextColumn get stade => text().withDefault(const Constant('graine'))();
  IntColumn get vitalite => integer().withDefault(const Constant(100))();
  IntColumn get joursManquesConsecutifs =>
      integer().withDefault(const Constant(0))();
  IntColumn get streakActuel => integer().withDefault(const Constant(0))();
  IntColumn get meilleurStreak => integer().withDefault(const Constant(0))();

  TextColumn get habitudeId =>
      text().unique().references(Habitudes, #id, onDelete: KeyAction.cascade)();

  // réservé pour la V2
  //IntColumn get viesDisponibles => integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {id};
}

class Completions extends Table {
  TextColumn get id => text()();
  TextColumn get habitudeId =>
      text().references(Habitudes, #id, onDelete: KeyAction.cascade)();
  DateTimeColumn get date => dateTime()();
  TextColumn get statut => text()();

  @override
  Set<Column> get primaryKey => {id};

  // une seule complétion par habitude et par jour
  @override
  List<Set<Column>> get uniqueKeys => [
    {habitudeId, date},
  ];
}

class Reminders extends Table {
  TextColumn get id => text()();
  TextColumn get habitudeId =>
      text().references(Habitudes, #id, onDelete: KeyAction.cascade)();
  IntColumn get heure => integer()();
  IntColumn get minute => integer()();
  TextColumn get typeAlerte => text()();
  TextColumn get joursActifs => text().withDefault(const Constant(''))();
  TextColumn get repetition =>
      text().withDefault(const Constant('heure_precise'))();
  IntColumn get repetitionValeur => integer().nullable()();
  BoolColumn get plageNocturneActive =>
      boolean().withDefault(const Constant(false))();
  BoolColumn get actif => boolean().withDefault(const Constant(true))();
  BoolColumn get relanceActive =>
      boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}

/// Petite table clé/valeur pour l'état global de l'app.
/// Clé utilisée par le moteur de streak : 'derniere_date_calculee'
/// (date ISO "2026-09-28").
class Parametres extends Table {
  TextColumn get cle => text()();
  TextColumn get valeur => text()();

  @override
  Set<Column> get primaryKey => {cle};
}

@DriftDatabase(tables: [Habitudes, Reminders, Completions, Plantes, Parametres])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  // Pour les tests : AppDatabase.forTesting(NativeDatabase.memory())
  AppDatabase.forTesting(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async => m.createAll(),
    beforeOpen: (details) async {
      // Nécessaire pour que les clés étrangères soient appliquées en SQLite
      await customStatement('PRAGMA foreign_keys = ON');
    },
  );
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'app.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
