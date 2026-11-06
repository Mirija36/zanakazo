// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $HabitudesTable extends Habitudes
    with TableInfo<$HabitudesTable, Habitude> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HabitudesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nomMeta = const VerificationMeta('nom');
  @override
  late final GeneratedColumn<String> nom = GeneratedColumn<String>(
    'nom',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categorieMeta = const VerificationMeta(
    'categorie',
  );
  @override
  late final GeneratedColumn<String> categorie = GeneratedColumn<String>(
    'categorie',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _frequenceMeta = const VerificationMeta(
    'frequence',
  );
  @override
  late final GeneratedColumn<String> frequence = GeneratedColumn<String>(
    'frequence',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('quotidienne'),
  );
  static const VerificationMeta _dateCreationMeta = const VerificationMeta(
    'dateCreation',
  );
  @override
  late final GeneratedColumn<DateTime> dateCreation = GeneratedColumn<DateTime>(
    'date_creation',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _actifMeta = const VerificationMeta('actif');
  @override
  late final GeneratedColumn<bool> actif = GeneratedColumn<bool>(
    'actif',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("actif" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    nom,
    categorie,
    frequence,
    dateCreation,
    actif,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'habitudes';
  @override
  VerificationContext validateIntegrity(
    Insertable<Habitude> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('nom')) {
      context.handle(
        _nomMeta,
        nom.isAcceptableOrUnknown(data['nom']!, _nomMeta),
      );
    } else if (isInserting) {
      context.missing(_nomMeta);
    }
    if (data.containsKey('categorie')) {
      context.handle(
        _categorieMeta,
        categorie.isAcceptableOrUnknown(data['categorie']!, _categorieMeta),
      );
    } else if (isInserting) {
      context.missing(_categorieMeta);
    }
    if (data.containsKey('frequence')) {
      context.handle(
        _frequenceMeta,
        frequence.isAcceptableOrUnknown(data['frequence']!, _frequenceMeta),
      );
    }
    if (data.containsKey('date_creation')) {
      context.handle(
        _dateCreationMeta,
        dateCreation.isAcceptableOrUnknown(
          data['date_creation']!,
          _dateCreationMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_dateCreationMeta);
    }
    if (data.containsKey('actif')) {
      context.handle(
        _actifMeta,
        actif.isAcceptableOrUnknown(data['actif']!, _actifMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Habitude map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Habitude(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      nom: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nom'],
      )!,
      categorie: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}categorie'],
      )!,
      frequence: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}frequence'],
      )!,
      dateCreation: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date_creation'],
      )!,
      actif: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}actif'],
      )!,
    );
  }

  @override
  $HabitudesTable createAlias(String alias) {
    return $HabitudesTable(attachedDatabase, alias);
  }
}

class Habitude extends DataClass implements Insertable<Habitude> {
  final String id;
  final String nom;
  final String categorie;
  final String frequence;
  final DateTime dateCreation;
  final bool actif;
  const Habitude({
    required this.id,
    required this.nom,
    required this.categorie,
    required this.frequence,
    required this.dateCreation,
    required this.actif,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['nom'] = Variable<String>(nom);
    map['categorie'] = Variable<String>(categorie);
    map['frequence'] = Variable<String>(frequence);
    map['date_creation'] = Variable<DateTime>(dateCreation);
    map['actif'] = Variable<bool>(actif);
    return map;
  }

  HabitudesCompanion toCompanion(bool nullToAbsent) {
    return HabitudesCompanion(
      id: Value(id),
      nom: Value(nom),
      categorie: Value(categorie),
      frequence: Value(frequence),
      dateCreation: Value(dateCreation),
      actif: Value(actif),
    );
  }

  factory Habitude.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Habitude(
      id: serializer.fromJson<String>(json['id']),
      nom: serializer.fromJson<String>(json['nom']),
      categorie: serializer.fromJson<String>(json['categorie']),
      frequence: serializer.fromJson<String>(json['frequence']),
      dateCreation: serializer.fromJson<DateTime>(json['dateCreation']),
      actif: serializer.fromJson<bool>(json['actif']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'nom': serializer.toJson<String>(nom),
      'categorie': serializer.toJson<String>(categorie),
      'frequence': serializer.toJson<String>(frequence),
      'dateCreation': serializer.toJson<DateTime>(dateCreation),
      'actif': serializer.toJson<bool>(actif),
    };
  }

  Habitude copyWith({
    String? id,
    String? nom,
    String? categorie,
    String? frequence,
    DateTime? dateCreation,
    bool? actif,
  }) => Habitude(
    id: id ?? this.id,
    nom: nom ?? this.nom,
    categorie: categorie ?? this.categorie,
    frequence: frequence ?? this.frequence,
    dateCreation: dateCreation ?? this.dateCreation,
    actif: actif ?? this.actif,
  );
  Habitude copyWithCompanion(HabitudesCompanion data) {
    return Habitude(
      id: data.id.present ? data.id.value : this.id,
      nom: data.nom.present ? data.nom.value : this.nom,
      categorie: data.categorie.present ? data.categorie.value : this.categorie,
      frequence: data.frequence.present ? data.frequence.value : this.frequence,
      dateCreation: data.dateCreation.present
          ? data.dateCreation.value
          : this.dateCreation,
      actif: data.actif.present ? data.actif.value : this.actif,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Habitude(')
          ..write('id: $id, ')
          ..write('nom: $nom, ')
          ..write('categorie: $categorie, ')
          ..write('frequence: $frequence, ')
          ..write('dateCreation: $dateCreation, ')
          ..write('actif: $actif')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, nom, categorie, frequence, dateCreation, actif);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Habitude &&
          other.id == this.id &&
          other.nom == this.nom &&
          other.categorie == this.categorie &&
          other.frequence == this.frequence &&
          other.dateCreation == this.dateCreation &&
          other.actif == this.actif);
}

class HabitudesCompanion extends UpdateCompanion<Habitude> {
  final Value<String> id;
  final Value<String> nom;
  final Value<String> categorie;
  final Value<String> frequence;
  final Value<DateTime> dateCreation;
  final Value<bool> actif;
  final Value<int> rowid;
  const HabitudesCompanion({
    this.id = const Value.absent(),
    this.nom = const Value.absent(),
    this.categorie = const Value.absent(),
    this.frequence = const Value.absent(),
    this.dateCreation = const Value.absent(),
    this.actif = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  HabitudesCompanion.insert({
    required String id,
    required String nom,
    required String categorie,
    this.frequence = const Value.absent(),
    required DateTime dateCreation,
    this.actif = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       nom = Value(nom),
       categorie = Value(categorie),
       dateCreation = Value(dateCreation);
  static Insertable<Habitude> custom({
    Expression<String>? id,
    Expression<String>? nom,
    Expression<String>? categorie,
    Expression<String>? frequence,
    Expression<DateTime>? dateCreation,
    Expression<bool>? actif,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nom != null) 'nom': nom,
      if (categorie != null) 'categorie': categorie,
      if (frequence != null) 'frequence': frequence,
      if (dateCreation != null) 'date_creation': dateCreation,
      if (actif != null) 'actif': actif,
      if (rowid != null) 'rowid': rowid,
    });
  }

  HabitudesCompanion copyWith({
    Value<String>? id,
    Value<String>? nom,
    Value<String>? categorie,
    Value<String>? frequence,
    Value<DateTime>? dateCreation,
    Value<bool>? actif,
    Value<int>? rowid,
  }) {
    return HabitudesCompanion(
      id: id ?? this.id,
      nom: nom ?? this.nom,
      categorie: categorie ?? this.categorie,
      frequence: frequence ?? this.frequence,
      dateCreation: dateCreation ?? this.dateCreation,
      actif: actif ?? this.actif,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (nom.present) {
      map['nom'] = Variable<String>(nom.value);
    }
    if (categorie.present) {
      map['categorie'] = Variable<String>(categorie.value);
    }
    if (frequence.present) {
      map['frequence'] = Variable<String>(frequence.value);
    }
    if (dateCreation.present) {
      map['date_creation'] = Variable<DateTime>(dateCreation.value);
    }
    if (actif.present) {
      map['actif'] = Variable<bool>(actif.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HabitudesCompanion(')
          ..write('id: $id, ')
          ..write('nom: $nom, ')
          ..write('categorie: $categorie, ')
          ..write('frequence: $frequence, ')
          ..write('dateCreation: $dateCreation, ')
          ..write('actif: $actif, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RemindersTable extends Reminders
    with TableInfo<$RemindersTable, Reminder> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RemindersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _habitudeIdMeta = const VerificationMeta(
    'habitudeId',
  );
  @override
  late final GeneratedColumn<String> habitudeId = GeneratedColumn<String>(
    'habitude_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES habitudes (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _heureMeta = const VerificationMeta('heure');
  @override
  late final GeneratedColumn<int> heure = GeneratedColumn<int>(
    'heure',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _minuteMeta = const VerificationMeta('minute');
  @override
  late final GeneratedColumn<int> minute = GeneratedColumn<int>(
    'minute',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _typeAlerteMeta = const VerificationMeta(
    'typeAlerte',
  );
  @override
  late final GeneratedColumn<String> typeAlerte = GeneratedColumn<String>(
    'type_alerte',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _joursActifsMeta = const VerificationMeta(
    'joursActifs',
  );
  @override
  late final GeneratedColumn<String> joursActifs = GeneratedColumn<String>(
    'jours_actifs',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _repetitionMeta = const VerificationMeta(
    'repetition',
  );
  @override
  late final GeneratedColumn<String> repetition = GeneratedColumn<String>(
    'repetition',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('heure_precise'),
  );
  static const VerificationMeta _repetitionValeurMeta = const VerificationMeta(
    'repetitionValeur',
  );
  @override
  late final GeneratedColumn<int> repetitionValeur = GeneratedColumn<int>(
    'repetition_valeur',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _plageNocturneActiveMeta =
      const VerificationMeta('plageNocturneActive');
  @override
  late final GeneratedColumn<bool> plageNocturneActive = GeneratedColumn<bool>(
    'plage_nocturne_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("plage_nocturne_active" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _actifMeta = const VerificationMeta('actif');
  @override
  late final GeneratedColumn<bool> actif = GeneratedColumn<bool>(
    'actif',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("actif" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _relanceActiveMeta = const VerificationMeta(
    'relanceActive',
  );
  @override
  late final GeneratedColumn<bool> relanceActive = GeneratedColumn<bool>(
    'relance_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("relance_active" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    habitudeId,
    heure,
    minute,
    typeAlerte,
    joursActifs,
    repetition,
    repetitionValeur,
    plageNocturneActive,
    actif,
    relanceActive,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'reminders';
  @override
  VerificationContext validateIntegrity(
    Insertable<Reminder> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('habitude_id')) {
      context.handle(
        _habitudeIdMeta,
        habitudeId.isAcceptableOrUnknown(data['habitude_id']!, _habitudeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_habitudeIdMeta);
    }
    if (data.containsKey('heure')) {
      context.handle(
        _heureMeta,
        heure.isAcceptableOrUnknown(data['heure']!, _heureMeta),
      );
    } else if (isInserting) {
      context.missing(_heureMeta);
    }
    if (data.containsKey('minute')) {
      context.handle(
        _minuteMeta,
        minute.isAcceptableOrUnknown(data['minute']!, _minuteMeta),
      );
    } else if (isInserting) {
      context.missing(_minuteMeta);
    }
    if (data.containsKey('type_alerte')) {
      context.handle(
        _typeAlerteMeta,
        typeAlerte.isAcceptableOrUnknown(data['type_alerte']!, _typeAlerteMeta),
      );
    } else if (isInserting) {
      context.missing(_typeAlerteMeta);
    }
    if (data.containsKey('jours_actifs')) {
      context.handle(
        _joursActifsMeta,
        joursActifs.isAcceptableOrUnknown(
          data['jours_actifs']!,
          _joursActifsMeta,
        ),
      );
    }
    if (data.containsKey('repetition')) {
      context.handle(
        _repetitionMeta,
        repetition.isAcceptableOrUnknown(data['repetition']!, _repetitionMeta),
      );
    }
    if (data.containsKey('repetition_valeur')) {
      context.handle(
        _repetitionValeurMeta,
        repetitionValeur.isAcceptableOrUnknown(
          data['repetition_valeur']!,
          _repetitionValeurMeta,
        ),
      );
    }
    if (data.containsKey('plage_nocturne_active')) {
      context.handle(
        _plageNocturneActiveMeta,
        plageNocturneActive.isAcceptableOrUnknown(
          data['plage_nocturne_active']!,
          _plageNocturneActiveMeta,
        ),
      );
    }
    if (data.containsKey('actif')) {
      context.handle(
        _actifMeta,
        actif.isAcceptableOrUnknown(data['actif']!, _actifMeta),
      );
    }
    if (data.containsKey('relance_active')) {
      context.handle(
        _relanceActiveMeta,
        relanceActive.isAcceptableOrUnknown(
          data['relance_active']!,
          _relanceActiveMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Reminder map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Reminder(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      habitudeId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}habitude_id'],
      )!,
      heure: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}heure'],
      )!,
      minute: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}minute'],
      )!,
      typeAlerte: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type_alerte'],
      )!,
      joursActifs: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}jours_actifs'],
      )!,
      repetition: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}repetition'],
      )!,
      repetitionValeur: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}repetition_valeur'],
      ),
      plageNocturneActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}plage_nocturne_active'],
      )!,
      actif: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}actif'],
      )!,
      relanceActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}relance_active'],
      )!,
    );
  }

  @override
  $RemindersTable createAlias(String alias) {
    return $RemindersTable(attachedDatabase, alias);
  }
}

class Reminder extends DataClass implements Insertable<Reminder> {
  final String id;
  final String habitudeId;
  final int heure;
  final int minute;
  final String typeAlerte;
  final String joursActifs;
  final String repetition;
  final int? repetitionValeur;
  final bool plageNocturneActive;
  final bool actif;
  final bool relanceActive;
  const Reminder({
    required this.id,
    required this.habitudeId,
    required this.heure,
    required this.minute,
    required this.typeAlerte,
    required this.joursActifs,
    required this.repetition,
    this.repetitionValeur,
    required this.plageNocturneActive,
    required this.actif,
    required this.relanceActive,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['habitude_id'] = Variable<String>(habitudeId);
    map['heure'] = Variable<int>(heure);
    map['minute'] = Variable<int>(minute);
    map['type_alerte'] = Variable<String>(typeAlerte);
    map['jours_actifs'] = Variable<String>(joursActifs);
    map['repetition'] = Variable<String>(repetition);
    if (!nullToAbsent || repetitionValeur != null) {
      map['repetition_valeur'] = Variable<int>(repetitionValeur);
    }
    map['plage_nocturne_active'] = Variable<bool>(plageNocturneActive);
    map['actif'] = Variable<bool>(actif);
    map['relance_active'] = Variable<bool>(relanceActive);
    return map;
  }

  RemindersCompanion toCompanion(bool nullToAbsent) {
    return RemindersCompanion(
      id: Value(id),
      habitudeId: Value(habitudeId),
      heure: Value(heure),
      minute: Value(minute),
      typeAlerte: Value(typeAlerte),
      joursActifs: Value(joursActifs),
      repetition: Value(repetition),
      repetitionValeur: repetitionValeur == null && nullToAbsent
          ? const Value.absent()
          : Value(repetitionValeur),
      plageNocturneActive: Value(plageNocturneActive),
      actif: Value(actif),
      relanceActive: Value(relanceActive),
    );
  }

  factory Reminder.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Reminder(
      id: serializer.fromJson<String>(json['id']),
      habitudeId: serializer.fromJson<String>(json['habitudeId']),
      heure: serializer.fromJson<int>(json['heure']),
      minute: serializer.fromJson<int>(json['minute']),
      typeAlerte: serializer.fromJson<String>(json['typeAlerte']),
      joursActifs: serializer.fromJson<String>(json['joursActifs']),
      repetition: serializer.fromJson<String>(json['repetition']),
      repetitionValeur: serializer.fromJson<int?>(json['repetitionValeur']),
      plageNocturneActive: serializer.fromJson<bool>(
        json['plageNocturneActive'],
      ),
      actif: serializer.fromJson<bool>(json['actif']),
      relanceActive: serializer.fromJson<bool>(json['relanceActive']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'habitudeId': serializer.toJson<String>(habitudeId),
      'heure': serializer.toJson<int>(heure),
      'minute': serializer.toJson<int>(minute),
      'typeAlerte': serializer.toJson<String>(typeAlerte),
      'joursActifs': serializer.toJson<String>(joursActifs),
      'repetition': serializer.toJson<String>(repetition),
      'repetitionValeur': serializer.toJson<int?>(repetitionValeur),
      'plageNocturneActive': serializer.toJson<bool>(plageNocturneActive),
      'actif': serializer.toJson<bool>(actif),
      'relanceActive': serializer.toJson<bool>(relanceActive),
    };
  }

  Reminder copyWith({
    String? id,
    String? habitudeId,
    int? heure,
    int? minute,
    String? typeAlerte,
    String? joursActifs,
    String? repetition,
    Value<int?> repetitionValeur = const Value.absent(),
    bool? plageNocturneActive,
    bool? actif,
    bool? relanceActive,
  }) => Reminder(
    id: id ?? this.id,
    habitudeId: habitudeId ?? this.habitudeId,
    heure: heure ?? this.heure,
    minute: minute ?? this.minute,
    typeAlerte: typeAlerte ?? this.typeAlerte,
    joursActifs: joursActifs ?? this.joursActifs,
    repetition: repetition ?? this.repetition,
    repetitionValeur: repetitionValeur.present
        ? repetitionValeur.value
        : this.repetitionValeur,
    plageNocturneActive: plageNocturneActive ?? this.plageNocturneActive,
    actif: actif ?? this.actif,
    relanceActive: relanceActive ?? this.relanceActive,
  );
  Reminder copyWithCompanion(RemindersCompanion data) {
    return Reminder(
      id: data.id.present ? data.id.value : this.id,
      habitudeId: data.habitudeId.present
          ? data.habitudeId.value
          : this.habitudeId,
      heure: data.heure.present ? data.heure.value : this.heure,
      minute: data.minute.present ? data.minute.value : this.minute,
      typeAlerte: data.typeAlerte.present
          ? data.typeAlerte.value
          : this.typeAlerte,
      joursActifs: data.joursActifs.present
          ? data.joursActifs.value
          : this.joursActifs,
      repetition: data.repetition.present
          ? data.repetition.value
          : this.repetition,
      repetitionValeur: data.repetitionValeur.present
          ? data.repetitionValeur.value
          : this.repetitionValeur,
      plageNocturneActive: data.plageNocturneActive.present
          ? data.plageNocturneActive.value
          : this.plageNocturneActive,
      actif: data.actif.present ? data.actif.value : this.actif,
      relanceActive: data.relanceActive.present
          ? data.relanceActive.value
          : this.relanceActive,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Reminder(')
          ..write('id: $id, ')
          ..write('habitudeId: $habitudeId, ')
          ..write('heure: $heure, ')
          ..write('minute: $minute, ')
          ..write('typeAlerte: $typeAlerte, ')
          ..write('joursActifs: $joursActifs, ')
          ..write('repetition: $repetition, ')
          ..write('repetitionValeur: $repetitionValeur, ')
          ..write('plageNocturneActive: $plageNocturneActive, ')
          ..write('actif: $actif, ')
          ..write('relanceActive: $relanceActive')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    habitudeId,
    heure,
    minute,
    typeAlerte,
    joursActifs,
    repetition,
    repetitionValeur,
    plageNocturneActive,
    actif,
    relanceActive,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Reminder &&
          other.id == this.id &&
          other.habitudeId == this.habitudeId &&
          other.heure == this.heure &&
          other.minute == this.minute &&
          other.typeAlerte == this.typeAlerte &&
          other.joursActifs == this.joursActifs &&
          other.repetition == this.repetition &&
          other.repetitionValeur == this.repetitionValeur &&
          other.plageNocturneActive == this.plageNocturneActive &&
          other.actif == this.actif &&
          other.relanceActive == this.relanceActive);
}

class RemindersCompanion extends UpdateCompanion<Reminder> {
  final Value<String> id;
  final Value<String> habitudeId;
  final Value<int> heure;
  final Value<int> minute;
  final Value<String> typeAlerte;
  final Value<String> joursActifs;
  final Value<String> repetition;
  final Value<int?> repetitionValeur;
  final Value<bool> plageNocturneActive;
  final Value<bool> actif;
  final Value<bool> relanceActive;
  final Value<int> rowid;
  const RemindersCompanion({
    this.id = const Value.absent(),
    this.habitudeId = const Value.absent(),
    this.heure = const Value.absent(),
    this.minute = const Value.absent(),
    this.typeAlerte = const Value.absent(),
    this.joursActifs = const Value.absent(),
    this.repetition = const Value.absent(),
    this.repetitionValeur = const Value.absent(),
    this.plageNocturneActive = const Value.absent(),
    this.actif = const Value.absent(),
    this.relanceActive = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RemindersCompanion.insert({
    required String id,
    required String habitudeId,
    required int heure,
    required int minute,
    required String typeAlerte,
    this.joursActifs = const Value.absent(),
    this.repetition = const Value.absent(),
    this.repetitionValeur = const Value.absent(),
    this.plageNocturneActive = const Value.absent(),
    this.actif = const Value.absent(),
    this.relanceActive = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       habitudeId = Value(habitudeId),
       heure = Value(heure),
       minute = Value(minute),
       typeAlerte = Value(typeAlerte);
  static Insertable<Reminder> custom({
    Expression<String>? id,
    Expression<String>? habitudeId,
    Expression<int>? heure,
    Expression<int>? minute,
    Expression<String>? typeAlerte,
    Expression<String>? joursActifs,
    Expression<String>? repetition,
    Expression<int>? repetitionValeur,
    Expression<bool>? plageNocturneActive,
    Expression<bool>? actif,
    Expression<bool>? relanceActive,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (habitudeId != null) 'habitude_id': habitudeId,
      if (heure != null) 'heure': heure,
      if (minute != null) 'minute': minute,
      if (typeAlerte != null) 'type_alerte': typeAlerte,
      if (joursActifs != null) 'jours_actifs': joursActifs,
      if (repetition != null) 'repetition': repetition,
      if (repetitionValeur != null) 'repetition_valeur': repetitionValeur,
      if (plageNocturneActive != null)
        'plage_nocturne_active': plageNocturneActive,
      if (actif != null) 'actif': actif,
      if (relanceActive != null) 'relance_active': relanceActive,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RemindersCompanion copyWith({
    Value<String>? id,
    Value<String>? habitudeId,
    Value<int>? heure,
    Value<int>? minute,
    Value<String>? typeAlerte,
    Value<String>? joursActifs,
    Value<String>? repetition,
    Value<int?>? repetitionValeur,
    Value<bool>? plageNocturneActive,
    Value<bool>? actif,
    Value<bool>? relanceActive,
    Value<int>? rowid,
  }) {
    return RemindersCompanion(
      id: id ?? this.id,
      habitudeId: habitudeId ?? this.habitudeId,
      heure: heure ?? this.heure,
      minute: minute ?? this.minute,
      typeAlerte: typeAlerte ?? this.typeAlerte,
      joursActifs: joursActifs ?? this.joursActifs,
      repetition: repetition ?? this.repetition,
      repetitionValeur: repetitionValeur ?? this.repetitionValeur,
      plageNocturneActive: plageNocturneActive ?? this.plageNocturneActive,
      actif: actif ?? this.actif,
      relanceActive: relanceActive ?? this.relanceActive,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (habitudeId.present) {
      map['habitude_id'] = Variable<String>(habitudeId.value);
    }
    if (heure.present) {
      map['heure'] = Variable<int>(heure.value);
    }
    if (minute.present) {
      map['minute'] = Variable<int>(minute.value);
    }
    if (typeAlerte.present) {
      map['type_alerte'] = Variable<String>(typeAlerte.value);
    }
    if (joursActifs.present) {
      map['jours_actifs'] = Variable<String>(joursActifs.value);
    }
    if (repetition.present) {
      map['repetition'] = Variable<String>(repetition.value);
    }
    if (repetitionValeur.present) {
      map['repetition_valeur'] = Variable<int>(repetitionValeur.value);
    }
    if (plageNocturneActive.present) {
      map['plage_nocturne_active'] = Variable<bool>(plageNocturneActive.value);
    }
    if (actif.present) {
      map['actif'] = Variable<bool>(actif.value);
    }
    if (relanceActive.present) {
      map['relance_active'] = Variable<bool>(relanceActive.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RemindersCompanion(')
          ..write('id: $id, ')
          ..write('habitudeId: $habitudeId, ')
          ..write('heure: $heure, ')
          ..write('minute: $minute, ')
          ..write('typeAlerte: $typeAlerte, ')
          ..write('joursActifs: $joursActifs, ')
          ..write('repetition: $repetition, ')
          ..write('repetitionValeur: $repetitionValeur, ')
          ..write('plageNocturneActive: $plageNocturneActive, ')
          ..write('actif: $actif, ')
          ..write('relanceActive: $relanceActive, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CompletionsTable extends Completions
    with TableInfo<$CompletionsTable, Completion> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CompletionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _habitudeIdMeta = const VerificationMeta(
    'habitudeId',
  );
  @override
  late final GeneratedColumn<String> habitudeId = GeneratedColumn<String>(
    'habitude_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES habitudes (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statutMeta = const VerificationMeta('statut');
  @override
  late final GeneratedColumn<String> statut = GeneratedColumn<String>(
    'statut',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, habitudeId, date, statut];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'completions';
  @override
  VerificationContext validateIntegrity(
    Insertable<Completion> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('habitude_id')) {
      context.handle(
        _habitudeIdMeta,
        habitudeId.isAcceptableOrUnknown(data['habitude_id']!, _habitudeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_habitudeIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('statut')) {
      context.handle(
        _statutMeta,
        statut.isAcceptableOrUnknown(data['statut']!, _statutMeta),
      );
    } else if (isInserting) {
      context.missing(_statutMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {habitudeId, date},
  ];
  @override
  Completion map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Completion(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      habitudeId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}habitude_id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      statut: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}statut'],
      )!,
    );
  }

  @override
  $CompletionsTable createAlias(String alias) {
    return $CompletionsTable(attachedDatabase, alias);
  }
}

class Completion extends DataClass implements Insertable<Completion> {
  final String id;
  final String habitudeId;
  final DateTime date;
  final String statut;
  const Completion({
    required this.id,
    required this.habitudeId,
    required this.date,
    required this.statut,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['habitude_id'] = Variable<String>(habitudeId);
    map['date'] = Variable<DateTime>(date);
    map['statut'] = Variable<String>(statut);
    return map;
  }

  CompletionsCompanion toCompanion(bool nullToAbsent) {
    return CompletionsCompanion(
      id: Value(id),
      habitudeId: Value(habitudeId),
      date: Value(date),
      statut: Value(statut),
    );
  }

  factory Completion.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Completion(
      id: serializer.fromJson<String>(json['id']),
      habitudeId: serializer.fromJson<String>(json['habitudeId']),
      date: serializer.fromJson<DateTime>(json['date']),
      statut: serializer.fromJson<String>(json['statut']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'habitudeId': serializer.toJson<String>(habitudeId),
      'date': serializer.toJson<DateTime>(date),
      'statut': serializer.toJson<String>(statut),
    };
  }

  Completion copyWith({
    String? id,
    String? habitudeId,
    DateTime? date,
    String? statut,
  }) => Completion(
    id: id ?? this.id,
    habitudeId: habitudeId ?? this.habitudeId,
    date: date ?? this.date,
    statut: statut ?? this.statut,
  );
  Completion copyWithCompanion(CompletionsCompanion data) {
    return Completion(
      id: data.id.present ? data.id.value : this.id,
      habitudeId: data.habitudeId.present
          ? data.habitudeId.value
          : this.habitudeId,
      date: data.date.present ? data.date.value : this.date,
      statut: data.statut.present ? data.statut.value : this.statut,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Completion(')
          ..write('id: $id, ')
          ..write('habitudeId: $habitudeId, ')
          ..write('date: $date, ')
          ..write('statut: $statut')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, habitudeId, date, statut);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Completion &&
          other.id == this.id &&
          other.habitudeId == this.habitudeId &&
          other.date == this.date &&
          other.statut == this.statut);
}

class CompletionsCompanion extends UpdateCompanion<Completion> {
  final Value<String> id;
  final Value<String> habitudeId;
  final Value<DateTime> date;
  final Value<String> statut;
  final Value<int> rowid;
  const CompletionsCompanion({
    this.id = const Value.absent(),
    this.habitudeId = const Value.absent(),
    this.date = const Value.absent(),
    this.statut = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CompletionsCompanion.insert({
    required String id,
    required String habitudeId,
    required DateTime date,
    required String statut,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       habitudeId = Value(habitudeId),
       date = Value(date),
       statut = Value(statut);
  static Insertable<Completion> custom({
    Expression<String>? id,
    Expression<String>? habitudeId,
    Expression<DateTime>? date,
    Expression<String>? statut,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (habitudeId != null) 'habitude_id': habitudeId,
      if (date != null) 'date': date,
      if (statut != null) 'statut': statut,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CompletionsCompanion copyWith({
    Value<String>? id,
    Value<String>? habitudeId,
    Value<DateTime>? date,
    Value<String>? statut,
    Value<int>? rowid,
  }) {
    return CompletionsCompanion(
      id: id ?? this.id,
      habitudeId: habitudeId ?? this.habitudeId,
      date: date ?? this.date,
      statut: statut ?? this.statut,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (habitudeId.present) {
      map['habitude_id'] = Variable<String>(habitudeId.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (statut.present) {
      map['statut'] = Variable<String>(statut.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CompletionsCompanion(')
          ..write('id: $id, ')
          ..write('habitudeId: $habitudeId, ')
          ..write('date: $date, ')
          ..write('statut: $statut, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PlantesTable extends Plantes with TableInfo<$PlantesTable, Plante> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlantesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _vitaliteMeta = const VerificationMeta(
    'vitalite',
  );
  @override
  late final GeneratedColumn<int> vitalite = GeneratedColumn<int>(
    'vitalite',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(100),
  );
  static const VerificationMeta _joursManquesConsecutifsMeta =
      const VerificationMeta('joursManquesConsecutifs');
  @override
  late final GeneratedColumn<int> joursManquesConsecutifs =
      GeneratedColumn<int>(
        'jours_manques_consecutifs',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: false,
        defaultValue: const Constant(0),
      );
  static const VerificationMeta _streakActuelMeta = const VerificationMeta(
    'streakActuel',
  );
  @override
  late final GeneratedColumn<int> streakActuel = GeneratedColumn<int>(
    'streak_actuel',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _meilleurStreakMeta = const VerificationMeta(
    'meilleurStreak',
  );
  @override
  late final GeneratedColumn<int> meilleurStreak = GeneratedColumn<int>(
    'meilleur_streak',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _habitudeIdMeta = const VerificationMeta(
    'habitudeId',
  );
  @override
  late final GeneratedColumn<String> habitudeId = GeneratedColumn<String>(
    'habitude_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'UNIQUE REFERENCES habitudes (id) ON DELETE CASCADE',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    vitalite,
    joursManquesConsecutifs,
    streakActuel,
    meilleurStreak,
    habitudeId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'plantes';
  @override
  VerificationContext validateIntegrity(
    Insertable<Plante> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('vitalite')) {
      context.handle(
        _vitaliteMeta,
        vitalite.isAcceptableOrUnknown(data['vitalite']!, _vitaliteMeta),
      );
    }
    if (data.containsKey('jours_manques_consecutifs')) {
      context.handle(
        _joursManquesConsecutifsMeta,
        joursManquesConsecutifs.isAcceptableOrUnknown(
          data['jours_manques_consecutifs']!,
          _joursManquesConsecutifsMeta,
        ),
      );
    }
    if (data.containsKey('streak_actuel')) {
      context.handle(
        _streakActuelMeta,
        streakActuel.isAcceptableOrUnknown(
          data['streak_actuel']!,
          _streakActuelMeta,
        ),
      );
    }
    if (data.containsKey('meilleur_streak')) {
      context.handle(
        _meilleurStreakMeta,
        meilleurStreak.isAcceptableOrUnknown(
          data['meilleur_streak']!,
          _meilleurStreakMeta,
        ),
      );
    }
    if (data.containsKey('habitude_id')) {
      context.handle(
        _habitudeIdMeta,
        habitudeId.isAcceptableOrUnknown(data['habitude_id']!, _habitudeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_habitudeIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Plante map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Plante(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      vitalite: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}vitalite'],
      )!,
      joursManquesConsecutifs: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}jours_manques_consecutifs'],
      )!,
      streakActuel: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}streak_actuel'],
      )!,
      meilleurStreak: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}meilleur_streak'],
      )!,
      habitudeId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}habitude_id'],
      )!,
    );
  }

  @override
  $PlantesTable createAlias(String alias) {
    return $PlantesTable(attachedDatabase, alias);
  }
}

class Plante extends DataClass implements Insertable<Plante> {
  final String id;
  final int vitalite;
  final int joursManquesConsecutifs;
  final int streakActuel;
  final int meilleurStreak;
  final String habitudeId;
  const Plante({
    required this.id,
    required this.vitalite,
    required this.joursManquesConsecutifs,
    required this.streakActuel,
    required this.meilleurStreak,
    required this.habitudeId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['vitalite'] = Variable<int>(vitalite);
    map['jours_manques_consecutifs'] = Variable<int>(joursManquesConsecutifs);
    map['streak_actuel'] = Variable<int>(streakActuel);
    map['meilleur_streak'] = Variable<int>(meilleurStreak);
    map['habitude_id'] = Variable<String>(habitudeId);
    return map;
  }

  PlantesCompanion toCompanion(bool nullToAbsent) {
    return PlantesCompanion(
      id: Value(id),
      vitalite: Value(vitalite),
      joursManquesConsecutifs: Value(joursManquesConsecutifs),
      streakActuel: Value(streakActuel),
      meilleurStreak: Value(meilleurStreak),
      habitudeId: Value(habitudeId),
    );
  }

  factory Plante.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Plante(
      id: serializer.fromJson<String>(json['id']),
      vitalite: serializer.fromJson<int>(json['vitalite']),
      joursManquesConsecutifs: serializer.fromJson<int>(
        json['joursManquesConsecutifs'],
      ),
      streakActuel: serializer.fromJson<int>(json['streakActuel']),
      meilleurStreak: serializer.fromJson<int>(json['meilleurStreak']),
      habitudeId: serializer.fromJson<String>(json['habitudeId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'vitalite': serializer.toJson<int>(vitalite),
      'joursManquesConsecutifs': serializer.toJson<int>(
        joursManquesConsecutifs,
      ),
      'streakActuel': serializer.toJson<int>(streakActuel),
      'meilleurStreak': serializer.toJson<int>(meilleurStreak),
      'habitudeId': serializer.toJson<String>(habitudeId),
    };
  }

  Plante copyWith({
    String? id,
    int? vitalite,
    int? joursManquesConsecutifs,
    int? streakActuel,
    int? meilleurStreak,
    String? habitudeId,
  }) => Plante(
    id: id ?? this.id,
    vitalite: vitalite ?? this.vitalite,
    joursManquesConsecutifs:
        joursManquesConsecutifs ?? this.joursManquesConsecutifs,
    streakActuel: streakActuel ?? this.streakActuel,
    meilleurStreak: meilleurStreak ?? this.meilleurStreak,
    habitudeId: habitudeId ?? this.habitudeId,
  );
  Plante copyWithCompanion(PlantesCompanion data) {
    return Plante(
      id: data.id.present ? data.id.value : this.id,
      vitalite: data.vitalite.present ? data.vitalite.value : this.vitalite,
      joursManquesConsecutifs: data.joursManquesConsecutifs.present
          ? data.joursManquesConsecutifs.value
          : this.joursManquesConsecutifs,
      streakActuel: data.streakActuel.present
          ? data.streakActuel.value
          : this.streakActuel,
      meilleurStreak: data.meilleurStreak.present
          ? data.meilleurStreak.value
          : this.meilleurStreak,
      habitudeId: data.habitudeId.present
          ? data.habitudeId.value
          : this.habitudeId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Plante(')
          ..write('id: $id, ')
          ..write('vitalite: $vitalite, ')
          ..write('joursManquesConsecutifs: $joursManquesConsecutifs, ')
          ..write('streakActuel: $streakActuel, ')
          ..write('meilleurStreak: $meilleurStreak, ')
          ..write('habitudeId: $habitudeId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    vitalite,
    joursManquesConsecutifs,
    streakActuel,
    meilleurStreak,
    habitudeId,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Plante &&
          other.id == this.id &&
          other.vitalite == this.vitalite &&
          other.joursManquesConsecutifs == this.joursManquesConsecutifs &&
          other.streakActuel == this.streakActuel &&
          other.meilleurStreak == this.meilleurStreak &&
          other.habitudeId == this.habitudeId);
}

class PlantesCompanion extends UpdateCompanion<Plante> {
  final Value<String> id;
  final Value<int> vitalite;
  final Value<int> joursManquesConsecutifs;
  final Value<int> streakActuel;
  final Value<int> meilleurStreak;
  final Value<String> habitudeId;
  final Value<int> rowid;
  const PlantesCompanion({
    this.id = const Value.absent(),
    this.vitalite = const Value.absent(),
    this.joursManquesConsecutifs = const Value.absent(),
    this.streakActuel = const Value.absent(),
    this.meilleurStreak = const Value.absent(),
    this.habitudeId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PlantesCompanion.insert({
    required String id,
    this.vitalite = const Value.absent(),
    this.joursManquesConsecutifs = const Value.absent(),
    this.streakActuel = const Value.absent(),
    this.meilleurStreak = const Value.absent(),
    required String habitudeId,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       habitudeId = Value(habitudeId);
  static Insertable<Plante> custom({
    Expression<String>? id,
    Expression<int>? vitalite,
    Expression<int>? joursManquesConsecutifs,
    Expression<int>? streakActuel,
    Expression<int>? meilleurStreak,
    Expression<String>? habitudeId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (vitalite != null) 'vitalite': vitalite,
      if (joursManquesConsecutifs != null)
        'jours_manques_consecutifs': joursManquesConsecutifs,
      if (streakActuel != null) 'streak_actuel': streakActuel,
      if (meilleurStreak != null) 'meilleur_streak': meilleurStreak,
      if (habitudeId != null) 'habitude_id': habitudeId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PlantesCompanion copyWith({
    Value<String>? id,
    Value<int>? vitalite,
    Value<int>? joursManquesConsecutifs,
    Value<int>? streakActuel,
    Value<int>? meilleurStreak,
    Value<String>? habitudeId,
    Value<int>? rowid,
  }) {
    return PlantesCompanion(
      id: id ?? this.id,
      vitalite: vitalite ?? this.vitalite,
      joursManquesConsecutifs:
          joursManquesConsecutifs ?? this.joursManquesConsecutifs,
      streakActuel: streakActuel ?? this.streakActuel,
      meilleurStreak: meilleurStreak ?? this.meilleurStreak,
      habitudeId: habitudeId ?? this.habitudeId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (vitalite.present) {
      map['vitalite'] = Variable<int>(vitalite.value);
    }
    if (joursManquesConsecutifs.present) {
      map['jours_manques_consecutifs'] = Variable<int>(
        joursManquesConsecutifs.value,
      );
    }
    if (streakActuel.present) {
      map['streak_actuel'] = Variable<int>(streakActuel.value);
    }
    if (meilleurStreak.present) {
      map['meilleur_streak'] = Variable<int>(meilleurStreak.value);
    }
    if (habitudeId.present) {
      map['habitude_id'] = Variable<String>(habitudeId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlantesCompanion(')
          ..write('id: $id, ')
          ..write('vitalite: $vitalite, ')
          ..write('joursManquesConsecutifs: $joursManquesConsecutifs, ')
          ..write('streakActuel: $streakActuel, ')
          ..write('meilleurStreak: $meilleurStreak, ')
          ..write('habitudeId: $habitudeId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ParametresTable extends Parametres
    with TableInfo<$ParametresTable, Parametre> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ParametresTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _cleMeta = const VerificationMeta('cle');
  @override
  late final GeneratedColumn<String> cle = GeneratedColumn<String>(
    'cle',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valeurMeta = const VerificationMeta('valeur');
  @override
  late final GeneratedColumn<String> valeur = GeneratedColumn<String>(
    'valeur',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [cle, valeur];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'parametres';
  @override
  VerificationContext validateIntegrity(
    Insertable<Parametre> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('cle')) {
      context.handle(
        _cleMeta,
        cle.isAcceptableOrUnknown(data['cle']!, _cleMeta),
      );
    } else if (isInserting) {
      context.missing(_cleMeta);
    }
    if (data.containsKey('valeur')) {
      context.handle(
        _valeurMeta,
        valeur.isAcceptableOrUnknown(data['valeur']!, _valeurMeta),
      );
    } else if (isInserting) {
      context.missing(_valeurMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {cle};
  @override
  Parametre map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Parametre(
      cle: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cle'],
      )!,
      valeur: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}valeur'],
      )!,
    );
  }

  @override
  $ParametresTable createAlias(String alias) {
    return $ParametresTable(attachedDatabase, alias);
  }
}

class Parametre extends DataClass implements Insertable<Parametre> {
  final String cle;
  final String valeur;
  const Parametre({required this.cle, required this.valeur});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['cle'] = Variable<String>(cle);
    map['valeur'] = Variable<String>(valeur);
    return map;
  }

  ParametresCompanion toCompanion(bool nullToAbsent) {
    return ParametresCompanion(cle: Value(cle), valeur: Value(valeur));
  }

  factory Parametre.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Parametre(
      cle: serializer.fromJson<String>(json['cle']),
      valeur: serializer.fromJson<String>(json['valeur']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'cle': serializer.toJson<String>(cle),
      'valeur': serializer.toJson<String>(valeur),
    };
  }

  Parametre copyWith({String? cle, String? valeur}) =>
      Parametre(cle: cle ?? this.cle, valeur: valeur ?? this.valeur);
  Parametre copyWithCompanion(ParametresCompanion data) {
    return Parametre(
      cle: data.cle.present ? data.cle.value : this.cle,
      valeur: data.valeur.present ? data.valeur.value : this.valeur,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Parametre(')
          ..write('cle: $cle, ')
          ..write('valeur: $valeur')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(cle, valeur);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Parametre &&
          other.cle == this.cle &&
          other.valeur == this.valeur);
}

class ParametresCompanion extends UpdateCompanion<Parametre> {
  final Value<String> cle;
  final Value<String> valeur;
  final Value<int> rowid;
  const ParametresCompanion({
    this.cle = const Value.absent(),
    this.valeur = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ParametresCompanion.insert({
    required String cle,
    required String valeur,
    this.rowid = const Value.absent(),
  }) : cle = Value(cle),
       valeur = Value(valeur);
  static Insertable<Parametre> custom({
    Expression<String>? cle,
    Expression<String>? valeur,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (cle != null) 'cle': cle,
      if (valeur != null) 'valeur': valeur,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ParametresCompanion copyWith({
    Value<String>? cle,
    Value<String>? valeur,
    Value<int>? rowid,
  }) {
    return ParametresCompanion(
      cle: cle ?? this.cle,
      valeur: valeur ?? this.valeur,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (cle.present) {
      map['cle'] = Variable<String>(cle.value);
    }
    if (valeur.present) {
      map['valeur'] = Variable<String>(valeur.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ParametresCompanion(')
          ..write('cle: $cle, ')
          ..write('valeur: $valeur, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $HabitudesTable habitudes = $HabitudesTable(this);
  late final $RemindersTable reminders = $RemindersTable(this);
  late final $CompletionsTable completions = $CompletionsTable(this);
  late final $PlantesTable plantes = $PlantesTable(this);
  late final $ParametresTable parametres = $ParametresTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    habitudes,
    reminders,
    completions,
    plantes,
    parametres,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'habitudes',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('reminders', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'habitudes',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('completions', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'habitudes',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('plantes', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$HabitudesTableCreateCompanionBuilder =
    HabitudesCompanion Function({
      required String id,
      required String nom,
      required String categorie,
      Value<String> frequence,
      required DateTime dateCreation,
      Value<bool> actif,
      Value<int> rowid,
    });
typedef $$HabitudesTableUpdateCompanionBuilder =
    HabitudesCompanion Function({
      Value<String> id,
      Value<String> nom,
      Value<String> categorie,
      Value<String> frequence,
      Value<DateTime> dateCreation,
      Value<bool> actif,
      Value<int> rowid,
    });

final class $$HabitudesTableReferences
    extends BaseReferences<_$AppDatabase, $HabitudesTable, Habitude> {
  $$HabitudesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$RemindersTable, List<Reminder>>
  _remindersRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.reminders,
    aliasName: 'habitudes__id__reminders__habitude_id',
  );

  $$RemindersTableProcessedTableManager get remindersRefs {
    final manager = $$RemindersTableTableManager(
      $_db,
      $_db.reminders,
    ).filter((f) => f.habitudeId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_remindersRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$CompletionsTable, List<Completion>>
  _completionsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.completions,
    aliasName: 'habitudes__id__completions__habitude_id',
  );

  $$CompletionsTableProcessedTableManager get completionsRefs {
    final manager = $$CompletionsTableTableManager(
      $_db,
      $_db.completions,
    ).filter((f) => f.habitudeId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_completionsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$PlantesTable, List<Plante>> _plantesRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.plantes,
    aliasName: 'habitudes__id__plantes__habitude_id',
  );

  $$PlantesTableProcessedTableManager get plantesRefs {
    final manager = $$PlantesTableTableManager(
      $_db,
      $_db.plantes,
    ).filter((f) => f.habitudeId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_plantesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$HabitudesTableFilterComposer
    extends Composer<_$AppDatabase, $HabitudesTable> {
  $$HabitudesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nom => $composableBuilder(
    column: $table.nom,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get categorie => $composableBuilder(
    column: $table.categorie,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get frequence => $composableBuilder(
    column: $table.frequence,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dateCreation => $composableBuilder(
    column: $table.dateCreation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get actif => $composableBuilder(
    column: $table.actif,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> remindersRefs(
    Expression<bool> Function($$RemindersTableFilterComposer f) f,
  ) {
    final $$RemindersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.reminders,
      getReferencedColumn: (t) => t.habitudeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RemindersTableFilterComposer(
            $db: $db,
            $table: $db.reminders,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> completionsRefs(
    Expression<bool> Function($$CompletionsTableFilterComposer f) f,
  ) {
    final $$CompletionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.completions,
      getReferencedColumn: (t) => t.habitudeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CompletionsTableFilterComposer(
            $db: $db,
            $table: $db.completions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> plantesRefs(
    Expression<bool> Function($$PlantesTableFilterComposer f) f,
  ) {
    final $$PlantesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.plantes,
      getReferencedColumn: (t) => t.habitudeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlantesTableFilterComposer(
            $db: $db,
            $table: $db.plantes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$HabitudesTableOrderingComposer
    extends Composer<_$AppDatabase, $HabitudesTable> {
  $$HabitudesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nom => $composableBuilder(
    column: $table.nom,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get categorie => $composableBuilder(
    column: $table.categorie,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get frequence => $composableBuilder(
    column: $table.frequence,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dateCreation => $composableBuilder(
    column: $table.dateCreation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get actif => $composableBuilder(
    column: $table.actif,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$HabitudesTableAnnotationComposer
    extends Composer<_$AppDatabase, $HabitudesTable> {
  $$HabitudesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get nom =>
      $composableBuilder(column: $table.nom, builder: (column) => column);

  GeneratedColumn<String> get categorie =>
      $composableBuilder(column: $table.categorie, builder: (column) => column);

  GeneratedColumn<String> get frequence =>
      $composableBuilder(column: $table.frequence, builder: (column) => column);

  GeneratedColumn<DateTime> get dateCreation => $composableBuilder(
    column: $table.dateCreation,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get actif =>
      $composableBuilder(column: $table.actif, builder: (column) => column);

  Expression<T> remindersRefs<T extends Object>(
    Expression<T> Function($$RemindersTableAnnotationComposer a) f,
  ) {
    final $$RemindersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.reminders,
      getReferencedColumn: (t) => t.habitudeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RemindersTableAnnotationComposer(
            $db: $db,
            $table: $db.reminders,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> completionsRefs<T extends Object>(
    Expression<T> Function($$CompletionsTableAnnotationComposer a) f,
  ) {
    final $$CompletionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.completions,
      getReferencedColumn: (t) => t.habitudeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CompletionsTableAnnotationComposer(
            $db: $db,
            $table: $db.completions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> plantesRefs<T extends Object>(
    Expression<T> Function($$PlantesTableAnnotationComposer a) f,
  ) {
    final $$PlantesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.plantes,
      getReferencedColumn: (t) => t.habitudeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlantesTableAnnotationComposer(
            $db: $db,
            $table: $db.plantes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$HabitudesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $HabitudesTable,
          Habitude,
          $$HabitudesTableFilterComposer,
          $$HabitudesTableOrderingComposer,
          $$HabitudesTableAnnotationComposer,
          $$HabitudesTableCreateCompanionBuilder,
          $$HabitudesTableUpdateCompanionBuilder,
          (Habitude, $$HabitudesTableReferences),
          Habitude,
          PrefetchHooks Function({
            bool remindersRefs,
            bool completionsRefs,
            bool plantesRefs,
          })
        > {
  $$HabitudesTableTableManager(_$AppDatabase db, $HabitudesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HabitudesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HabitudesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HabitudesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> nom = const Value.absent(),
                Value<String> categorie = const Value.absent(),
                Value<String> frequence = const Value.absent(),
                Value<DateTime> dateCreation = const Value.absent(),
                Value<bool> actif = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => HabitudesCompanion(
                id: id,
                nom: nom,
                categorie: categorie,
                frequence: frequence,
                dateCreation: dateCreation,
                actif: actif,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String nom,
                required String categorie,
                Value<String> frequence = const Value.absent(),
                required DateTime dateCreation,
                Value<bool> actif = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => HabitudesCompanion.insert(
                id: id,
                nom: nom,
                categorie: categorie,
                frequence: frequence,
                dateCreation: dateCreation,
                actif: actif,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$HabitudesTable, Habitude>(table),
                  $$HabitudesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                remindersRefs = false,
                completionsRefs = false,
                plantesRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (remindersRefs) db.reminders,
                    if (completionsRefs) db.completions,
                    if (plantesRefs) db.plantes,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (remindersRefs)
                        await $_getPrefetchedData<
                          Habitude,
                          $HabitudesTable,
                          Reminder
                        >(
                          currentTable: table,
                          referencedTable: $$HabitudesTableReferences
                              ._remindersRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$HabitudesTableReferences(
                                db,
                                table,
                                p0,
                              ).remindersRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.habitudeId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (completionsRefs)
                        await $_getPrefetchedData<
                          Habitude,
                          $HabitudesTable,
                          Completion
                        >(
                          currentTable: table,
                          referencedTable: $$HabitudesTableReferences
                              ._completionsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$HabitudesTableReferences(
                                db,
                                table,
                                p0,
                              ).completionsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.habitudeId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (plantesRefs)
                        await $_getPrefetchedData<
                          Habitude,
                          $HabitudesTable,
                          Plante
                        >(
                          currentTable: table,
                          referencedTable: $$HabitudesTableReferences
                              ._plantesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$HabitudesTableReferences(
                                db,
                                table,
                                p0,
                              ).plantesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.habitudeId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$HabitudesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $HabitudesTable,
      Habitude,
      $$HabitudesTableFilterComposer,
      $$HabitudesTableOrderingComposer,
      $$HabitudesTableAnnotationComposer,
      $$HabitudesTableCreateCompanionBuilder,
      $$HabitudesTableUpdateCompanionBuilder,
      (Habitude, $$HabitudesTableReferences),
      Habitude,
      PrefetchHooks Function({
        bool remindersRefs,
        bool completionsRefs,
        bool plantesRefs,
      })
    >;
typedef $$RemindersTableCreateCompanionBuilder =
    RemindersCompanion Function({
      required String id,
      required String habitudeId,
      required int heure,
      required int minute,
      required String typeAlerte,
      Value<String> joursActifs,
      Value<String> repetition,
      Value<int?> repetitionValeur,
      Value<bool> plageNocturneActive,
      Value<bool> actif,
      Value<bool> relanceActive,
      Value<int> rowid,
    });
typedef $$RemindersTableUpdateCompanionBuilder =
    RemindersCompanion Function({
      Value<String> id,
      Value<String> habitudeId,
      Value<int> heure,
      Value<int> minute,
      Value<String> typeAlerte,
      Value<String> joursActifs,
      Value<String> repetition,
      Value<int?> repetitionValeur,
      Value<bool> plageNocturneActive,
      Value<bool> actif,
      Value<bool> relanceActive,
      Value<int> rowid,
    });

final class $$RemindersTableReferences
    extends BaseReferences<_$AppDatabase, $RemindersTable, Reminder> {
  $$RemindersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $HabitudesTable _habitudeIdTable(_$AppDatabase db) =>
      db.habitudes.createAlias('reminders__habitude_id__habitudes__id');

  $$HabitudesTableProcessedTableManager get habitudeId {
    final $_column = $_itemColumn<String>('habitude_id')!;

    final manager = $$HabitudesTableTableManager(
      $_db,
      $_db.habitudes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_habitudeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$RemindersTableFilterComposer
    extends Composer<_$AppDatabase, $RemindersTable> {
  $$RemindersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get heure => $composableBuilder(
    column: $table.heure,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get minute => $composableBuilder(
    column: $table.minute,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get typeAlerte => $composableBuilder(
    column: $table.typeAlerte,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get joursActifs => $composableBuilder(
    column: $table.joursActifs,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get repetition => $composableBuilder(
    column: $table.repetition,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get repetitionValeur => $composableBuilder(
    column: $table.repetitionValeur,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get plageNocturneActive => $composableBuilder(
    column: $table.plageNocturneActive,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get actif => $composableBuilder(
    column: $table.actif,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get relanceActive => $composableBuilder(
    column: $table.relanceActive,
    builder: (column) => ColumnFilters(column),
  );

  $$HabitudesTableFilterComposer get habitudeId {
    final $$HabitudesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.habitudeId,
      referencedTable: $db.habitudes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HabitudesTableFilterComposer(
            $db: $db,
            $table: $db.habitudes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RemindersTableOrderingComposer
    extends Composer<_$AppDatabase, $RemindersTable> {
  $$RemindersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get heure => $composableBuilder(
    column: $table.heure,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get minute => $composableBuilder(
    column: $table.minute,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get typeAlerte => $composableBuilder(
    column: $table.typeAlerte,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get joursActifs => $composableBuilder(
    column: $table.joursActifs,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get repetition => $composableBuilder(
    column: $table.repetition,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get repetitionValeur => $composableBuilder(
    column: $table.repetitionValeur,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get plageNocturneActive => $composableBuilder(
    column: $table.plageNocturneActive,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get actif => $composableBuilder(
    column: $table.actif,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get relanceActive => $composableBuilder(
    column: $table.relanceActive,
    builder: (column) => ColumnOrderings(column),
  );

  $$HabitudesTableOrderingComposer get habitudeId {
    final $$HabitudesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.habitudeId,
      referencedTable: $db.habitudes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HabitudesTableOrderingComposer(
            $db: $db,
            $table: $db.habitudes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RemindersTableAnnotationComposer
    extends Composer<_$AppDatabase, $RemindersTable> {
  $$RemindersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get heure =>
      $composableBuilder(column: $table.heure, builder: (column) => column);

  GeneratedColumn<int> get minute =>
      $composableBuilder(column: $table.minute, builder: (column) => column);

  GeneratedColumn<String> get typeAlerte => $composableBuilder(
    column: $table.typeAlerte,
    builder: (column) => column,
  );

  GeneratedColumn<String> get joursActifs => $composableBuilder(
    column: $table.joursActifs,
    builder: (column) => column,
  );

  GeneratedColumn<String> get repetition => $composableBuilder(
    column: $table.repetition,
    builder: (column) => column,
  );

  GeneratedColumn<int> get repetitionValeur => $composableBuilder(
    column: $table.repetitionValeur,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get plageNocturneActive => $composableBuilder(
    column: $table.plageNocturneActive,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get actif =>
      $composableBuilder(column: $table.actif, builder: (column) => column);

  GeneratedColumn<bool> get relanceActive => $composableBuilder(
    column: $table.relanceActive,
    builder: (column) => column,
  );

  $$HabitudesTableAnnotationComposer get habitudeId {
    final $$HabitudesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.habitudeId,
      referencedTable: $db.habitudes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HabitudesTableAnnotationComposer(
            $db: $db,
            $table: $db.habitudes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RemindersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RemindersTable,
          Reminder,
          $$RemindersTableFilterComposer,
          $$RemindersTableOrderingComposer,
          $$RemindersTableAnnotationComposer,
          $$RemindersTableCreateCompanionBuilder,
          $$RemindersTableUpdateCompanionBuilder,
          (Reminder, $$RemindersTableReferences),
          Reminder,
          PrefetchHooks Function({bool habitudeId})
        > {
  $$RemindersTableTableManager(_$AppDatabase db, $RemindersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RemindersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RemindersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RemindersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> habitudeId = const Value.absent(),
                Value<int> heure = const Value.absent(),
                Value<int> minute = const Value.absent(),
                Value<String> typeAlerte = const Value.absent(),
                Value<String> joursActifs = const Value.absent(),
                Value<String> repetition = const Value.absent(),
                Value<int?> repetitionValeur = const Value.absent(),
                Value<bool> plageNocturneActive = const Value.absent(),
                Value<bool> actif = const Value.absent(),
                Value<bool> relanceActive = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RemindersCompanion(
                id: id,
                habitudeId: habitudeId,
                heure: heure,
                minute: minute,
                typeAlerte: typeAlerte,
                joursActifs: joursActifs,
                repetition: repetition,
                repetitionValeur: repetitionValeur,
                plageNocturneActive: plageNocturneActive,
                actif: actif,
                relanceActive: relanceActive,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String habitudeId,
                required int heure,
                required int minute,
                required String typeAlerte,
                Value<String> joursActifs = const Value.absent(),
                Value<String> repetition = const Value.absent(),
                Value<int?> repetitionValeur = const Value.absent(),
                Value<bool> plageNocturneActive = const Value.absent(),
                Value<bool> actif = const Value.absent(),
                Value<bool> relanceActive = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RemindersCompanion.insert(
                id: id,
                habitudeId: habitudeId,
                heure: heure,
                minute: minute,
                typeAlerte: typeAlerte,
                joursActifs: joursActifs,
                repetition: repetition,
                repetitionValeur: repetitionValeur,
                plageNocturneActive: plageNocturneActive,
                actif: actif,
                relanceActive: relanceActive,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$RemindersTable, Reminder>(table),
                  $$RemindersTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({habitudeId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (habitudeId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.habitudeId,
                                referencedTable: $$RemindersTableReferences
                                    ._habitudeIdTable(db),
                                referencedColumn: $$RemindersTableReferences
                                    ._habitudeIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$RemindersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RemindersTable,
      Reminder,
      $$RemindersTableFilterComposer,
      $$RemindersTableOrderingComposer,
      $$RemindersTableAnnotationComposer,
      $$RemindersTableCreateCompanionBuilder,
      $$RemindersTableUpdateCompanionBuilder,
      (Reminder, $$RemindersTableReferences),
      Reminder,
      PrefetchHooks Function({bool habitudeId})
    >;
typedef $$CompletionsTableCreateCompanionBuilder =
    CompletionsCompanion Function({
      required String id,
      required String habitudeId,
      required DateTime date,
      required String statut,
      Value<int> rowid,
    });
typedef $$CompletionsTableUpdateCompanionBuilder =
    CompletionsCompanion Function({
      Value<String> id,
      Value<String> habitudeId,
      Value<DateTime> date,
      Value<String> statut,
      Value<int> rowid,
    });

final class $$CompletionsTableReferences
    extends BaseReferences<_$AppDatabase, $CompletionsTable, Completion> {
  $$CompletionsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $HabitudesTable _habitudeIdTable(_$AppDatabase db) =>
      db.habitudes.createAlias('completions__habitude_id__habitudes__id');

  $$HabitudesTableProcessedTableManager get habitudeId {
    final $_column = $_itemColumn<String>('habitude_id')!;

    final manager = $$HabitudesTableTableManager(
      $_db,
      $_db.habitudes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_habitudeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$CompletionsTableFilterComposer
    extends Composer<_$AppDatabase, $CompletionsTable> {
  $$CompletionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get statut => $composableBuilder(
    column: $table.statut,
    builder: (column) => ColumnFilters(column),
  );

  $$HabitudesTableFilterComposer get habitudeId {
    final $$HabitudesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.habitudeId,
      referencedTable: $db.habitudes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HabitudesTableFilterComposer(
            $db: $db,
            $table: $db.habitudes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CompletionsTableOrderingComposer
    extends Composer<_$AppDatabase, $CompletionsTable> {
  $$CompletionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get statut => $composableBuilder(
    column: $table.statut,
    builder: (column) => ColumnOrderings(column),
  );

  $$HabitudesTableOrderingComposer get habitudeId {
    final $$HabitudesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.habitudeId,
      referencedTable: $db.habitudes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HabitudesTableOrderingComposer(
            $db: $db,
            $table: $db.habitudes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CompletionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CompletionsTable> {
  $$CompletionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get statut =>
      $composableBuilder(column: $table.statut, builder: (column) => column);

  $$HabitudesTableAnnotationComposer get habitudeId {
    final $$HabitudesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.habitudeId,
      referencedTable: $db.habitudes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HabitudesTableAnnotationComposer(
            $db: $db,
            $table: $db.habitudes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CompletionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CompletionsTable,
          Completion,
          $$CompletionsTableFilterComposer,
          $$CompletionsTableOrderingComposer,
          $$CompletionsTableAnnotationComposer,
          $$CompletionsTableCreateCompanionBuilder,
          $$CompletionsTableUpdateCompanionBuilder,
          (Completion, $$CompletionsTableReferences),
          Completion,
          PrefetchHooks Function({bool habitudeId})
        > {
  $$CompletionsTableTableManager(_$AppDatabase db, $CompletionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CompletionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CompletionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CompletionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> habitudeId = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<String> statut = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CompletionsCompanion(
                id: id,
                habitudeId: habitudeId,
                date: date,
                statut: statut,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String habitudeId,
                required DateTime date,
                required String statut,
                Value<int> rowid = const Value.absent(),
              }) => CompletionsCompanion.insert(
                id: id,
                habitudeId: habitudeId,
                date: date,
                statut: statut,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$CompletionsTable, Completion>(table),
                  $$CompletionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({habitudeId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (habitudeId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.habitudeId,
                                referencedTable: $$CompletionsTableReferences
                                    ._habitudeIdTable(db),
                                referencedColumn: $$CompletionsTableReferences
                                    ._habitudeIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$CompletionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CompletionsTable,
      Completion,
      $$CompletionsTableFilterComposer,
      $$CompletionsTableOrderingComposer,
      $$CompletionsTableAnnotationComposer,
      $$CompletionsTableCreateCompanionBuilder,
      $$CompletionsTableUpdateCompanionBuilder,
      (Completion, $$CompletionsTableReferences),
      Completion,
      PrefetchHooks Function({bool habitudeId})
    >;
typedef $$PlantesTableCreateCompanionBuilder =
    PlantesCompanion Function({
      required String id,
      Value<int> vitalite,
      Value<int> joursManquesConsecutifs,
      Value<int> streakActuel,
      Value<int> meilleurStreak,
      required String habitudeId,
      Value<int> rowid,
    });
typedef $$PlantesTableUpdateCompanionBuilder =
    PlantesCompanion Function({
      Value<String> id,
      Value<int> vitalite,
      Value<int> joursManquesConsecutifs,
      Value<int> streakActuel,
      Value<int> meilleurStreak,
      Value<String> habitudeId,
      Value<int> rowid,
    });

final class $$PlantesTableReferences
    extends BaseReferences<_$AppDatabase, $PlantesTable, Plante> {
  $$PlantesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $HabitudesTable _habitudeIdTable(_$AppDatabase db) =>
      db.habitudes.createAlias('plantes__habitude_id__habitudes__id');

  $$HabitudesTableProcessedTableManager get habitudeId {
    final $_column = $_itemColumn<String>('habitude_id')!;

    final manager = $$HabitudesTableTableManager(
      $_db,
      $_db.habitudes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_habitudeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$PlantesTableFilterComposer
    extends Composer<_$AppDatabase, $PlantesTable> {
  $$PlantesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get vitalite => $composableBuilder(
    column: $table.vitalite,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get joursManquesConsecutifs => $composableBuilder(
    column: $table.joursManquesConsecutifs,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get streakActuel => $composableBuilder(
    column: $table.streakActuel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get meilleurStreak => $composableBuilder(
    column: $table.meilleurStreak,
    builder: (column) => ColumnFilters(column),
  );

  $$HabitudesTableFilterComposer get habitudeId {
    final $$HabitudesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.habitudeId,
      referencedTable: $db.habitudes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HabitudesTableFilterComposer(
            $db: $db,
            $table: $db.habitudes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PlantesTableOrderingComposer
    extends Composer<_$AppDatabase, $PlantesTable> {
  $$PlantesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get vitalite => $composableBuilder(
    column: $table.vitalite,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get joursManquesConsecutifs => $composableBuilder(
    column: $table.joursManquesConsecutifs,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get streakActuel => $composableBuilder(
    column: $table.streakActuel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get meilleurStreak => $composableBuilder(
    column: $table.meilleurStreak,
    builder: (column) => ColumnOrderings(column),
  );

  $$HabitudesTableOrderingComposer get habitudeId {
    final $$HabitudesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.habitudeId,
      referencedTable: $db.habitudes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HabitudesTableOrderingComposer(
            $db: $db,
            $table: $db.habitudes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PlantesTableAnnotationComposer
    extends Composer<_$AppDatabase, $PlantesTable> {
  $$PlantesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get vitalite =>
      $composableBuilder(column: $table.vitalite, builder: (column) => column);

  GeneratedColumn<int> get joursManquesConsecutifs => $composableBuilder(
    column: $table.joursManquesConsecutifs,
    builder: (column) => column,
  );

  GeneratedColumn<int> get streakActuel => $composableBuilder(
    column: $table.streakActuel,
    builder: (column) => column,
  );

  GeneratedColumn<int> get meilleurStreak => $composableBuilder(
    column: $table.meilleurStreak,
    builder: (column) => column,
  );

  $$HabitudesTableAnnotationComposer get habitudeId {
    final $$HabitudesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.habitudeId,
      referencedTable: $db.habitudes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HabitudesTableAnnotationComposer(
            $db: $db,
            $table: $db.habitudes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PlantesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PlantesTable,
          Plante,
          $$PlantesTableFilterComposer,
          $$PlantesTableOrderingComposer,
          $$PlantesTableAnnotationComposer,
          $$PlantesTableCreateCompanionBuilder,
          $$PlantesTableUpdateCompanionBuilder,
          (Plante, $$PlantesTableReferences),
          Plante,
          PrefetchHooks Function({bool habitudeId})
        > {
  $$PlantesTableTableManager(_$AppDatabase db, $PlantesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PlantesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PlantesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PlantesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<int> vitalite = const Value.absent(),
                Value<int> joursManquesConsecutifs = const Value.absent(),
                Value<int> streakActuel = const Value.absent(),
                Value<int> meilleurStreak = const Value.absent(),
                Value<String> habitudeId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PlantesCompanion(
                id: id,
                vitalite: vitalite,
                joursManquesConsecutifs: joursManquesConsecutifs,
                streakActuel: streakActuel,
                meilleurStreak: meilleurStreak,
                habitudeId: habitudeId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<int> vitalite = const Value.absent(),
                Value<int> joursManquesConsecutifs = const Value.absent(),
                Value<int> streakActuel = const Value.absent(),
                Value<int> meilleurStreak = const Value.absent(),
                required String habitudeId,
                Value<int> rowid = const Value.absent(),
              }) => PlantesCompanion.insert(
                id: id,
                vitalite: vitalite,
                joursManquesConsecutifs: joursManquesConsecutifs,
                streakActuel: streakActuel,
                meilleurStreak: meilleurStreak,
                habitudeId: habitudeId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$PlantesTable, Plante>(table),
                  $$PlantesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({habitudeId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (habitudeId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.habitudeId,
                                referencedTable: $$PlantesTableReferences
                                    ._habitudeIdTable(db),
                                referencedColumn: $$PlantesTableReferences
                                    ._habitudeIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$PlantesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PlantesTable,
      Plante,
      $$PlantesTableFilterComposer,
      $$PlantesTableOrderingComposer,
      $$PlantesTableAnnotationComposer,
      $$PlantesTableCreateCompanionBuilder,
      $$PlantesTableUpdateCompanionBuilder,
      (Plante, $$PlantesTableReferences),
      Plante,
      PrefetchHooks Function({bool habitudeId})
    >;
typedef $$ParametresTableCreateCompanionBuilder =
    ParametresCompanion Function({
      required String cle,
      required String valeur,
      Value<int> rowid,
    });
typedef $$ParametresTableUpdateCompanionBuilder =
    ParametresCompanion Function({
      Value<String> cle,
      Value<String> valeur,
      Value<int> rowid,
    });

class $$ParametresTableFilterComposer
    extends Composer<_$AppDatabase, $ParametresTable> {
  $$ParametresTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get cle => $composableBuilder(
    column: $table.cle,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get valeur => $composableBuilder(
    column: $table.valeur,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ParametresTableOrderingComposer
    extends Composer<_$AppDatabase, $ParametresTable> {
  $$ParametresTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get cle => $composableBuilder(
    column: $table.cle,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get valeur => $composableBuilder(
    column: $table.valeur,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ParametresTableAnnotationComposer
    extends Composer<_$AppDatabase, $ParametresTable> {
  $$ParametresTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get cle =>
      $composableBuilder(column: $table.cle, builder: (column) => column);

  GeneratedColumn<String> get valeur =>
      $composableBuilder(column: $table.valeur, builder: (column) => column);
}

class $$ParametresTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ParametresTable,
          Parametre,
          $$ParametresTableFilterComposer,
          $$ParametresTableOrderingComposer,
          $$ParametresTableAnnotationComposer,
          $$ParametresTableCreateCompanionBuilder,
          $$ParametresTableUpdateCompanionBuilder,
          (
            Parametre,
            BaseReferences<_$AppDatabase, $ParametresTable, Parametre>,
          ),
          Parametre,
          PrefetchHooks Function()
        > {
  $$ParametresTableTableManager(_$AppDatabase db, $ParametresTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ParametresTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ParametresTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ParametresTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> cle = const Value.absent(),
                Value<String> valeur = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ParametresCompanion(cle: cle, valeur: valeur, rowid: rowid),
          createCompanionCallback:
              ({
                required String cle,
                required String valeur,
                Value<int> rowid = const Value.absent(),
              }) => ParametresCompanion.insert(
                cle: cle,
                valeur: valeur,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ParametresTable, Parametre>(table),
                  BaseReferences<_$AppDatabase, $ParametresTable, Parametre>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ParametresTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ParametresTable,
      Parametre,
      $$ParametresTableFilterComposer,
      $$ParametresTableOrderingComposer,
      $$ParametresTableAnnotationComposer,
      $$ParametresTableCreateCompanionBuilder,
      $$ParametresTableUpdateCompanionBuilder,
      (Parametre, BaseReferences<_$AppDatabase, $ParametresTable, Parametre>),
      Parametre,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$HabitudesTableTableManager get habitudes =>
      $$HabitudesTableTableManager(_db, _db.habitudes);
  $$RemindersTableTableManager get reminders =>
      $$RemindersTableTableManager(_db, _db.reminders);
  $$CompletionsTableTableManager get completions =>
      $$CompletionsTableTableManager(_db, _db.completions);
  $$PlantesTableTableManager get plantes =>
      $$PlantesTableTableManager(_db, _db.plantes);
  $$ParametresTableTableManager get parametres =>
      $$ParametresTableTableManager(_db, _db.parametres);
}
