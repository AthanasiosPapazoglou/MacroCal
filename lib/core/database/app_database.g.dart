// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $SettingsTable extends Settings with TableInfo<$SettingsTable, Setting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _localeCodeMeta = const VerificationMeta(
    'localeCode',
  );
  @override
  late final GeneratedColumn<String> localeCode = GeneratedColumn<String>(
    'locale_code',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _microcalEnabledMeta = const VerificationMeta(
    'microcalEnabled',
  );
  @override
  late final GeneratedColumn<bool> microcalEnabled = GeneratedColumn<bool>(
    'microcal_enabled',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("microcal_enabled" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [id, localeCode, microcalEnabled];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'settings';
  @override
  VerificationContext validateIntegrity(
    Insertable<Setting> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('locale_code')) {
      context.handle(
        _localeCodeMeta,
        localeCode.isAcceptableOrUnknown(data['locale_code']!, _localeCodeMeta),
      );
    }
    if (data.containsKey('microcal_enabled')) {
      context.handle(
        _microcalEnabledMeta,
        microcalEnabled.isAcceptableOrUnknown(
          data['microcal_enabled']!,
          _microcalEnabledMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Setting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Setting(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      localeCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}locale_code'],
      ),
      microcalEnabled: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}microcal_enabled'],
      )!,
    );
  }

  @override
  $SettingsTable createAlias(String alias) {
    return $SettingsTable(attachedDatabase, alias);
  }
}

class Setting extends DataClass implements Insertable<Setting> {
  final int id;
  final String? localeCode;
  final bool microcalEnabled;
  const Setting({
    required this.id,
    this.localeCode,
    required this.microcalEnabled,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || localeCode != null) {
      map['locale_code'] = Variable<String>(localeCode);
    }
    map['microcal_enabled'] = Variable<bool>(microcalEnabled);
    return map;
  }

  SettingsCompanion toCompanion(bool nullToAbsent) {
    return SettingsCompanion(
      id: Value(id),
      localeCode: localeCode == null && nullToAbsent
          ? const Value.absent()
          : Value(localeCode),
      microcalEnabled: Value(microcalEnabled),
    );
  }

  factory Setting.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Setting(
      id: serializer.fromJson<int>(json['id']),
      localeCode: serializer.fromJson<String?>(json['localeCode']),
      microcalEnabled: serializer.fromJson<bool>(json['microcalEnabled']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'localeCode': serializer.toJson<String?>(localeCode),
      'microcalEnabled': serializer.toJson<bool>(microcalEnabled),
    };
  }

  Setting copyWith({
    int? id,
    Value<String?> localeCode = const Value.absent(),
    bool? microcalEnabled,
  }) => Setting(
    id: id ?? this.id,
    localeCode: localeCode.present ? localeCode.value : this.localeCode,
    microcalEnabled: microcalEnabled ?? this.microcalEnabled,
  );
  Setting copyWithCompanion(SettingsCompanion data) {
    return Setting(
      id: data.id.present ? data.id.value : this.id,
      localeCode: data.localeCode.present
          ? data.localeCode.value
          : this.localeCode,
      microcalEnabled: data.microcalEnabled.present
          ? data.microcalEnabled.value
          : this.microcalEnabled,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Setting(')
          ..write('id: $id, ')
          ..write('localeCode: $localeCode, ')
          ..write('microcalEnabled: $microcalEnabled')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, localeCode, microcalEnabled);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Setting &&
          other.id == this.id &&
          other.localeCode == this.localeCode &&
          other.microcalEnabled == this.microcalEnabled);
}

class SettingsCompanion extends UpdateCompanion<Setting> {
  final Value<int> id;
  final Value<String?> localeCode;
  final Value<bool> microcalEnabled;
  const SettingsCompanion({
    this.id = const Value.absent(),
    this.localeCode = const Value.absent(),
    this.microcalEnabled = const Value.absent(),
  });
  SettingsCompanion.insert({
    this.id = const Value.absent(),
    this.localeCode = const Value.absent(),
    this.microcalEnabled = const Value.absent(),
  });
  static Insertable<Setting> custom({
    Expression<int>? id,
    Expression<String>? localeCode,
    Expression<bool>? microcalEnabled,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (localeCode != null) 'locale_code': localeCode,
      if (microcalEnabled != null) 'microcal_enabled': microcalEnabled,
    });
  }

  SettingsCompanion copyWith({
    Value<int>? id,
    Value<String?>? localeCode,
    Value<bool>? microcalEnabled,
  }) {
    return SettingsCompanion(
      id: id ?? this.id,
      localeCode: localeCode ?? this.localeCode,
      microcalEnabled: microcalEnabled ?? this.microcalEnabled,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (localeCode.present) {
      map['locale_code'] = Variable<String>(localeCode.value);
    }
    if (microcalEnabled.present) {
      map['microcal_enabled'] = Variable<bool>(microcalEnabled.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SettingsCompanion(')
          ..write('id: $id, ')
          ..write('localeCode: $localeCode, ')
          ..write('microcalEnabled: $microcalEnabled')
          ..write(')'))
        .toString();
  }
}

class $ProfileTableTable extends ProfileTable
    with TableInfo<$ProfileTableTable, ProfileRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProfileTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _dailyKcalMeta = const VerificationMeta(
    'dailyKcal',
  );
  @override
  late final GeneratedColumn<double> dailyKcal = GeneratedColumn<double>(
    'daily_kcal',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _proteinGMeta = const VerificationMeta(
    'proteinG',
  );
  @override
  late final GeneratedColumn<double> proteinG = GeneratedColumn<double>(
    'protein_g',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fiberGMeta = const VerificationMeta('fiberG');
  @override
  late final GeneratedColumn<double> fiberG = GeneratedColumn<double>(
    'fiber_g',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sugarLimitPctMeta = const VerificationMeta(
    'sugarLimitPct',
  );
  @override
  late final GeneratedColumn<double> sugarLimitPct = GeneratedColumn<double>(
    'sugar_limit_pct',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _saturatedLimitPctMeta = const VerificationMeta(
    'saturatedLimitPct',
  );
  @override
  late final GeneratedColumn<double> saturatedLimitPct =
      GeneratedColumn<double>(
        'saturated_limit_pct',
        aliasedName,
        false,
        type: DriftSqlType.double,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _saltLimitMgMeta = const VerificationMeta(
    'saltLimitMg',
  );
  @override
  late final GeneratedColumn<double> saltLimitMg = GeneratedColumn<double>(
    'salt_limit_mg',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _weightKgMeta = const VerificationMeta(
    'weightKg',
  );
  @override
  late final GeneratedColumn<double> weightKg = GeneratedColumn<double>(
    'weight_kg',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _heightCmMeta = const VerificationMeta(
    'heightCm',
  );
  @override
  late final GeneratedColumn<double> heightCm = GeneratedColumn<double>(
    'height_cm',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sexMeta = const VerificationMeta('sex');
  @override
  late final GeneratedColumn<String> sex = GeneratedColumn<String>(
    'sex',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _birthYearMeta = const VerificationMeta(
    'birthYear',
  );
  @override
  late final GeneratedColumn<int> birthYear = GeneratedColumn<int>(
    'birth_year',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    dailyKcal,
    proteinG,
    fiberG,
    sugarLimitPct,
    saturatedLimitPct,
    saltLimitMg,
    weightKg,
    heightCm,
    sex,
    birthYear,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'profile';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProfileRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('daily_kcal')) {
      context.handle(
        _dailyKcalMeta,
        dailyKcal.isAcceptableOrUnknown(data['daily_kcal']!, _dailyKcalMeta),
      );
    } else if (isInserting) {
      context.missing(_dailyKcalMeta);
    }
    if (data.containsKey('protein_g')) {
      context.handle(
        _proteinGMeta,
        proteinG.isAcceptableOrUnknown(data['protein_g']!, _proteinGMeta),
      );
    } else if (isInserting) {
      context.missing(_proteinGMeta);
    }
    if (data.containsKey('fiber_g')) {
      context.handle(
        _fiberGMeta,
        fiberG.isAcceptableOrUnknown(data['fiber_g']!, _fiberGMeta),
      );
    } else if (isInserting) {
      context.missing(_fiberGMeta);
    }
    if (data.containsKey('sugar_limit_pct')) {
      context.handle(
        _sugarLimitPctMeta,
        sugarLimitPct.isAcceptableOrUnknown(
          data['sugar_limit_pct']!,
          _sugarLimitPctMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_sugarLimitPctMeta);
    }
    if (data.containsKey('saturated_limit_pct')) {
      context.handle(
        _saturatedLimitPctMeta,
        saturatedLimitPct.isAcceptableOrUnknown(
          data['saturated_limit_pct']!,
          _saturatedLimitPctMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_saturatedLimitPctMeta);
    }
    if (data.containsKey('salt_limit_mg')) {
      context.handle(
        _saltLimitMgMeta,
        saltLimitMg.isAcceptableOrUnknown(
          data['salt_limit_mg']!,
          _saltLimitMgMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_saltLimitMgMeta);
    }
    if (data.containsKey('weight_kg')) {
      context.handle(
        _weightKgMeta,
        weightKg.isAcceptableOrUnknown(data['weight_kg']!, _weightKgMeta),
      );
    } else if (isInserting) {
      context.missing(_weightKgMeta);
    }
    if (data.containsKey('height_cm')) {
      context.handle(
        _heightCmMeta,
        heightCm.isAcceptableOrUnknown(data['height_cm']!, _heightCmMeta),
      );
    } else if (isInserting) {
      context.missing(_heightCmMeta);
    }
    if (data.containsKey('sex')) {
      context.handle(
        _sexMeta,
        sex.isAcceptableOrUnknown(data['sex']!, _sexMeta),
      );
    }
    if (data.containsKey('birth_year')) {
      context.handle(
        _birthYearMeta,
        birthYear.isAcceptableOrUnknown(data['birth_year']!, _birthYearMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProfileRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProfileRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      dailyKcal: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}daily_kcal'],
      )!,
      proteinG: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}protein_g'],
      )!,
      fiberG: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}fiber_g'],
      )!,
      sugarLimitPct: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}sugar_limit_pct'],
      )!,
      saturatedLimitPct: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}saturated_limit_pct'],
      )!,
      saltLimitMg: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}salt_limit_mg'],
      )!,
      weightKg: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}weight_kg'],
      )!,
      heightCm: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}height_cm'],
      )!,
      sex: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sex'],
      ),
      birthYear: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}birth_year'],
      ),
    );
  }

  @override
  $ProfileTableTable createAlias(String alias) {
    return $ProfileTableTable(attachedDatabase, alias);
  }
}

class ProfileRow extends DataClass implements Insertable<ProfileRow> {
  final int id;
  final double dailyKcal;
  final double proteinG;
  final double fiberG;
  final double sugarLimitPct;
  final double saturatedLimitPct;
  final double saltLimitMg;
  final double weightKg;
  final double heightCm;
  final String? sex;
  final int? birthYear;
  const ProfileRow({
    required this.id,
    required this.dailyKcal,
    required this.proteinG,
    required this.fiberG,
    required this.sugarLimitPct,
    required this.saturatedLimitPct,
    required this.saltLimitMg,
    required this.weightKg,
    required this.heightCm,
    this.sex,
    this.birthYear,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['daily_kcal'] = Variable<double>(dailyKcal);
    map['protein_g'] = Variable<double>(proteinG);
    map['fiber_g'] = Variable<double>(fiberG);
    map['sugar_limit_pct'] = Variable<double>(sugarLimitPct);
    map['saturated_limit_pct'] = Variable<double>(saturatedLimitPct);
    map['salt_limit_mg'] = Variable<double>(saltLimitMg);
    map['weight_kg'] = Variable<double>(weightKg);
    map['height_cm'] = Variable<double>(heightCm);
    if (!nullToAbsent || sex != null) {
      map['sex'] = Variable<String>(sex);
    }
    if (!nullToAbsent || birthYear != null) {
      map['birth_year'] = Variable<int>(birthYear);
    }
    return map;
  }

  ProfileTableCompanion toCompanion(bool nullToAbsent) {
    return ProfileTableCompanion(
      id: Value(id),
      dailyKcal: Value(dailyKcal),
      proteinG: Value(proteinG),
      fiberG: Value(fiberG),
      sugarLimitPct: Value(sugarLimitPct),
      saturatedLimitPct: Value(saturatedLimitPct),
      saltLimitMg: Value(saltLimitMg),
      weightKg: Value(weightKg),
      heightCm: Value(heightCm),
      sex: sex == null && nullToAbsent ? const Value.absent() : Value(sex),
      birthYear: birthYear == null && nullToAbsent
          ? const Value.absent()
          : Value(birthYear),
    );
  }

  factory ProfileRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProfileRow(
      id: serializer.fromJson<int>(json['id']),
      dailyKcal: serializer.fromJson<double>(json['dailyKcal']),
      proteinG: serializer.fromJson<double>(json['proteinG']),
      fiberG: serializer.fromJson<double>(json['fiberG']),
      sugarLimitPct: serializer.fromJson<double>(json['sugarLimitPct']),
      saturatedLimitPct: serializer.fromJson<double>(json['saturatedLimitPct']),
      saltLimitMg: serializer.fromJson<double>(json['saltLimitMg']),
      weightKg: serializer.fromJson<double>(json['weightKg']),
      heightCm: serializer.fromJson<double>(json['heightCm']),
      sex: serializer.fromJson<String?>(json['sex']),
      birthYear: serializer.fromJson<int?>(json['birthYear']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'dailyKcal': serializer.toJson<double>(dailyKcal),
      'proteinG': serializer.toJson<double>(proteinG),
      'fiberG': serializer.toJson<double>(fiberG),
      'sugarLimitPct': serializer.toJson<double>(sugarLimitPct),
      'saturatedLimitPct': serializer.toJson<double>(saturatedLimitPct),
      'saltLimitMg': serializer.toJson<double>(saltLimitMg),
      'weightKg': serializer.toJson<double>(weightKg),
      'heightCm': serializer.toJson<double>(heightCm),
      'sex': serializer.toJson<String?>(sex),
      'birthYear': serializer.toJson<int?>(birthYear),
    };
  }

  ProfileRow copyWith({
    int? id,
    double? dailyKcal,
    double? proteinG,
    double? fiberG,
    double? sugarLimitPct,
    double? saturatedLimitPct,
    double? saltLimitMg,
    double? weightKg,
    double? heightCm,
    Value<String?> sex = const Value.absent(),
    Value<int?> birthYear = const Value.absent(),
  }) => ProfileRow(
    id: id ?? this.id,
    dailyKcal: dailyKcal ?? this.dailyKcal,
    proteinG: proteinG ?? this.proteinG,
    fiberG: fiberG ?? this.fiberG,
    sugarLimitPct: sugarLimitPct ?? this.sugarLimitPct,
    saturatedLimitPct: saturatedLimitPct ?? this.saturatedLimitPct,
    saltLimitMg: saltLimitMg ?? this.saltLimitMg,
    weightKg: weightKg ?? this.weightKg,
    heightCm: heightCm ?? this.heightCm,
    sex: sex.present ? sex.value : this.sex,
    birthYear: birthYear.present ? birthYear.value : this.birthYear,
  );
  ProfileRow copyWithCompanion(ProfileTableCompanion data) {
    return ProfileRow(
      id: data.id.present ? data.id.value : this.id,
      dailyKcal: data.dailyKcal.present ? data.dailyKcal.value : this.dailyKcal,
      proteinG: data.proteinG.present ? data.proteinG.value : this.proteinG,
      fiberG: data.fiberG.present ? data.fiberG.value : this.fiberG,
      sugarLimitPct: data.sugarLimitPct.present
          ? data.sugarLimitPct.value
          : this.sugarLimitPct,
      saturatedLimitPct: data.saturatedLimitPct.present
          ? data.saturatedLimitPct.value
          : this.saturatedLimitPct,
      saltLimitMg: data.saltLimitMg.present
          ? data.saltLimitMg.value
          : this.saltLimitMg,
      weightKg: data.weightKg.present ? data.weightKg.value : this.weightKg,
      heightCm: data.heightCm.present ? data.heightCm.value : this.heightCm,
      sex: data.sex.present ? data.sex.value : this.sex,
      birthYear: data.birthYear.present ? data.birthYear.value : this.birthYear,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProfileRow(')
          ..write('id: $id, ')
          ..write('dailyKcal: $dailyKcal, ')
          ..write('proteinG: $proteinG, ')
          ..write('fiberG: $fiberG, ')
          ..write('sugarLimitPct: $sugarLimitPct, ')
          ..write('saturatedLimitPct: $saturatedLimitPct, ')
          ..write('saltLimitMg: $saltLimitMg, ')
          ..write('weightKg: $weightKg, ')
          ..write('heightCm: $heightCm, ')
          ..write('sex: $sex, ')
          ..write('birthYear: $birthYear')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    dailyKcal,
    proteinG,
    fiberG,
    sugarLimitPct,
    saturatedLimitPct,
    saltLimitMg,
    weightKg,
    heightCm,
    sex,
    birthYear,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProfileRow &&
          other.id == this.id &&
          other.dailyKcal == this.dailyKcal &&
          other.proteinG == this.proteinG &&
          other.fiberG == this.fiberG &&
          other.sugarLimitPct == this.sugarLimitPct &&
          other.saturatedLimitPct == this.saturatedLimitPct &&
          other.saltLimitMg == this.saltLimitMg &&
          other.weightKg == this.weightKg &&
          other.heightCm == this.heightCm &&
          other.sex == this.sex &&
          other.birthYear == this.birthYear);
}

class ProfileTableCompanion extends UpdateCompanion<ProfileRow> {
  final Value<int> id;
  final Value<double> dailyKcal;
  final Value<double> proteinG;
  final Value<double> fiberG;
  final Value<double> sugarLimitPct;
  final Value<double> saturatedLimitPct;
  final Value<double> saltLimitMg;
  final Value<double> weightKg;
  final Value<double> heightCm;
  final Value<String?> sex;
  final Value<int?> birthYear;
  const ProfileTableCompanion({
    this.id = const Value.absent(),
    this.dailyKcal = const Value.absent(),
    this.proteinG = const Value.absent(),
    this.fiberG = const Value.absent(),
    this.sugarLimitPct = const Value.absent(),
    this.saturatedLimitPct = const Value.absent(),
    this.saltLimitMg = const Value.absent(),
    this.weightKg = const Value.absent(),
    this.heightCm = const Value.absent(),
    this.sex = const Value.absent(),
    this.birthYear = const Value.absent(),
  });
  ProfileTableCompanion.insert({
    this.id = const Value.absent(),
    required double dailyKcal,
    required double proteinG,
    required double fiberG,
    required double sugarLimitPct,
    required double saturatedLimitPct,
    required double saltLimitMg,
    required double weightKg,
    required double heightCm,
    this.sex = const Value.absent(),
    this.birthYear = const Value.absent(),
  }) : dailyKcal = Value(dailyKcal),
       proteinG = Value(proteinG),
       fiberG = Value(fiberG),
       sugarLimitPct = Value(sugarLimitPct),
       saturatedLimitPct = Value(saturatedLimitPct),
       saltLimitMg = Value(saltLimitMg),
       weightKg = Value(weightKg),
       heightCm = Value(heightCm);
  static Insertable<ProfileRow> custom({
    Expression<int>? id,
    Expression<double>? dailyKcal,
    Expression<double>? proteinG,
    Expression<double>? fiberG,
    Expression<double>? sugarLimitPct,
    Expression<double>? saturatedLimitPct,
    Expression<double>? saltLimitMg,
    Expression<double>? weightKg,
    Expression<double>? heightCm,
    Expression<String>? sex,
    Expression<int>? birthYear,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (dailyKcal != null) 'daily_kcal': dailyKcal,
      if (proteinG != null) 'protein_g': proteinG,
      if (fiberG != null) 'fiber_g': fiberG,
      if (sugarLimitPct != null) 'sugar_limit_pct': sugarLimitPct,
      if (saturatedLimitPct != null) 'saturated_limit_pct': saturatedLimitPct,
      if (saltLimitMg != null) 'salt_limit_mg': saltLimitMg,
      if (weightKg != null) 'weight_kg': weightKg,
      if (heightCm != null) 'height_cm': heightCm,
      if (sex != null) 'sex': sex,
      if (birthYear != null) 'birth_year': birthYear,
    });
  }

  ProfileTableCompanion copyWith({
    Value<int>? id,
    Value<double>? dailyKcal,
    Value<double>? proteinG,
    Value<double>? fiberG,
    Value<double>? sugarLimitPct,
    Value<double>? saturatedLimitPct,
    Value<double>? saltLimitMg,
    Value<double>? weightKg,
    Value<double>? heightCm,
    Value<String?>? sex,
    Value<int?>? birthYear,
  }) {
    return ProfileTableCompanion(
      id: id ?? this.id,
      dailyKcal: dailyKcal ?? this.dailyKcal,
      proteinG: proteinG ?? this.proteinG,
      fiberG: fiberG ?? this.fiberG,
      sugarLimitPct: sugarLimitPct ?? this.sugarLimitPct,
      saturatedLimitPct: saturatedLimitPct ?? this.saturatedLimitPct,
      saltLimitMg: saltLimitMg ?? this.saltLimitMg,
      weightKg: weightKg ?? this.weightKg,
      heightCm: heightCm ?? this.heightCm,
      sex: sex ?? this.sex,
      birthYear: birthYear ?? this.birthYear,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (dailyKcal.present) {
      map['daily_kcal'] = Variable<double>(dailyKcal.value);
    }
    if (proteinG.present) {
      map['protein_g'] = Variable<double>(proteinG.value);
    }
    if (fiberG.present) {
      map['fiber_g'] = Variable<double>(fiberG.value);
    }
    if (sugarLimitPct.present) {
      map['sugar_limit_pct'] = Variable<double>(sugarLimitPct.value);
    }
    if (saturatedLimitPct.present) {
      map['saturated_limit_pct'] = Variable<double>(saturatedLimitPct.value);
    }
    if (saltLimitMg.present) {
      map['salt_limit_mg'] = Variable<double>(saltLimitMg.value);
    }
    if (weightKg.present) {
      map['weight_kg'] = Variable<double>(weightKg.value);
    }
    if (heightCm.present) {
      map['height_cm'] = Variable<double>(heightCm.value);
    }
    if (sex.present) {
      map['sex'] = Variable<String>(sex.value);
    }
    if (birthYear.present) {
      map['birth_year'] = Variable<int>(birthYear.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProfileTableCompanion(')
          ..write('id: $id, ')
          ..write('dailyKcal: $dailyKcal, ')
          ..write('proteinG: $proteinG, ')
          ..write('fiberG: $fiberG, ')
          ..write('sugarLimitPct: $sugarLimitPct, ')
          ..write('saturatedLimitPct: $saturatedLimitPct, ')
          ..write('saltLimitMg: $saltLimitMg, ')
          ..write('weightKg: $weightKg, ')
          ..write('heightCm: $heightCm, ')
          ..write('sex: $sex, ')
          ..write('birthYear: $birthYear')
          ..write(')'))
        .toString();
  }
}

class $ActivitiesTableTable extends ActivitiesTable
    with TableInfo<$ActivitiesTableTable, ActivityRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ActivitiesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _presetKeyMeta = const VerificationMeta(
    'presetKey',
  );
  @override
  late final GeneratedColumn<String> presetKey = GeneratedColumn<String>(
    'preset_key',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _kcalPerUnitMeta = const VerificationMeta(
    'kcalPerUnit',
  );
  @override
  late final GeneratedColumn<int> kcalPerUnit = GeneratedColumn<int>(
    'kcal_per_unit',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _unitLabelMeta = const VerificationMeta(
    'unitLabel',
  );
  @override
  late final GeneratedColumn<String> unitLabel = GeneratedColumn<String>(
    'unit_label',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isDurationBasedMeta = const VerificationMeta(
    'isDurationBased',
  );
  @override
  late final GeneratedColumn<bool> isDurationBased = GeneratedColumn<bool>(
    'is_duration_based',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_duration_based" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    presetKey,
    name,
    kcalPerUnit,
    unitLabel,
    isDurationBased,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'activities';
  @override
  VerificationContext validateIntegrity(
    Insertable<ActivityRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('preset_key')) {
      context.handle(
        _presetKeyMeta,
        presetKey.isAcceptableOrUnknown(data['preset_key']!, _presetKeyMeta),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('kcal_per_unit')) {
      context.handle(
        _kcalPerUnitMeta,
        kcalPerUnit.isAcceptableOrUnknown(
          data['kcal_per_unit']!,
          _kcalPerUnitMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_kcalPerUnitMeta);
    }
    if (data.containsKey('unit_label')) {
      context.handle(
        _unitLabelMeta,
        unitLabel.isAcceptableOrUnknown(data['unit_label']!, _unitLabelMeta),
      );
    } else if (isInserting) {
      context.missing(_unitLabelMeta);
    }
    if (data.containsKey('is_duration_based')) {
      context.handle(
        _isDurationBasedMeta,
        isDurationBased.isAcceptableOrUnknown(
          data['is_duration_based']!,
          _isDurationBasedMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ActivityRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ActivityRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      presetKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}preset_key'],
      ),
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      kcalPerUnit: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}kcal_per_unit'],
      )!,
      unitLabel: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}unit_label'],
      )!,
      isDurationBased: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_duration_based'],
      )!,
    );
  }

  @override
  $ActivitiesTableTable createAlias(String alias) {
    return $ActivitiesTableTable(attachedDatabase, alias);
  }
}

class ActivityRow extends DataClass implements Insertable<ActivityRow> {
  final int id;
  final String? presetKey;
  final String name;
  final int kcalPerUnit;
  final String unitLabel;
  final bool isDurationBased;
  const ActivityRow({
    required this.id,
    this.presetKey,
    required this.name,
    required this.kcalPerUnit,
    required this.unitLabel,
    required this.isDurationBased,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || presetKey != null) {
      map['preset_key'] = Variable<String>(presetKey);
    }
    map['name'] = Variable<String>(name);
    map['kcal_per_unit'] = Variable<int>(kcalPerUnit);
    map['unit_label'] = Variable<String>(unitLabel);
    map['is_duration_based'] = Variable<bool>(isDurationBased);
    return map;
  }

  ActivitiesTableCompanion toCompanion(bool nullToAbsent) {
    return ActivitiesTableCompanion(
      id: Value(id),
      presetKey: presetKey == null && nullToAbsent
          ? const Value.absent()
          : Value(presetKey),
      name: Value(name),
      kcalPerUnit: Value(kcalPerUnit),
      unitLabel: Value(unitLabel),
      isDurationBased: Value(isDurationBased),
    );
  }

  factory ActivityRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ActivityRow(
      id: serializer.fromJson<int>(json['id']),
      presetKey: serializer.fromJson<String?>(json['presetKey']),
      name: serializer.fromJson<String>(json['name']),
      kcalPerUnit: serializer.fromJson<int>(json['kcalPerUnit']),
      unitLabel: serializer.fromJson<String>(json['unitLabel']),
      isDurationBased: serializer.fromJson<bool>(json['isDurationBased']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'presetKey': serializer.toJson<String?>(presetKey),
      'name': serializer.toJson<String>(name),
      'kcalPerUnit': serializer.toJson<int>(kcalPerUnit),
      'unitLabel': serializer.toJson<String>(unitLabel),
      'isDurationBased': serializer.toJson<bool>(isDurationBased),
    };
  }

  ActivityRow copyWith({
    int? id,
    Value<String?> presetKey = const Value.absent(),
    String? name,
    int? kcalPerUnit,
    String? unitLabel,
    bool? isDurationBased,
  }) => ActivityRow(
    id: id ?? this.id,
    presetKey: presetKey.present ? presetKey.value : this.presetKey,
    name: name ?? this.name,
    kcalPerUnit: kcalPerUnit ?? this.kcalPerUnit,
    unitLabel: unitLabel ?? this.unitLabel,
    isDurationBased: isDurationBased ?? this.isDurationBased,
  );
  ActivityRow copyWithCompanion(ActivitiesTableCompanion data) {
    return ActivityRow(
      id: data.id.present ? data.id.value : this.id,
      presetKey: data.presetKey.present ? data.presetKey.value : this.presetKey,
      name: data.name.present ? data.name.value : this.name,
      kcalPerUnit: data.kcalPerUnit.present
          ? data.kcalPerUnit.value
          : this.kcalPerUnit,
      unitLabel: data.unitLabel.present ? data.unitLabel.value : this.unitLabel,
      isDurationBased: data.isDurationBased.present
          ? data.isDurationBased.value
          : this.isDurationBased,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ActivityRow(')
          ..write('id: $id, ')
          ..write('presetKey: $presetKey, ')
          ..write('name: $name, ')
          ..write('kcalPerUnit: $kcalPerUnit, ')
          ..write('unitLabel: $unitLabel, ')
          ..write('isDurationBased: $isDurationBased')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, presetKey, name, kcalPerUnit, unitLabel, isDurationBased);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ActivityRow &&
          other.id == this.id &&
          other.presetKey == this.presetKey &&
          other.name == this.name &&
          other.kcalPerUnit == this.kcalPerUnit &&
          other.unitLabel == this.unitLabel &&
          other.isDurationBased == this.isDurationBased);
}

class ActivitiesTableCompanion extends UpdateCompanion<ActivityRow> {
  final Value<int> id;
  final Value<String?> presetKey;
  final Value<String> name;
  final Value<int> kcalPerUnit;
  final Value<String> unitLabel;
  final Value<bool> isDurationBased;
  const ActivitiesTableCompanion({
    this.id = const Value.absent(),
    this.presetKey = const Value.absent(),
    this.name = const Value.absent(),
    this.kcalPerUnit = const Value.absent(),
    this.unitLabel = const Value.absent(),
    this.isDurationBased = const Value.absent(),
  });
  ActivitiesTableCompanion.insert({
    this.id = const Value.absent(),
    this.presetKey = const Value.absent(),
    required String name,
    required int kcalPerUnit,
    required String unitLabel,
    this.isDurationBased = const Value.absent(),
  }) : name = Value(name),
       kcalPerUnit = Value(kcalPerUnit),
       unitLabel = Value(unitLabel);
  static Insertable<ActivityRow> custom({
    Expression<int>? id,
    Expression<String>? presetKey,
    Expression<String>? name,
    Expression<int>? kcalPerUnit,
    Expression<String>? unitLabel,
    Expression<bool>? isDurationBased,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (presetKey != null) 'preset_key': presetKey,
      if (name != null) 'name': name,
      if (kcalPerUnit != null) 'kcal_per_unit': kcalPerUnit,
      if (unitLabel != null) 'unit_label': unitLabel,
      if (isDurationBased != null) 'is_duration_based': isDurationBased,
    });
  }

  ActivitiesTableCompanion copyWith({
    Value<int>? id,
    Value<String?>? presetKey,
    Value<String>? name,
    Value<int>? kcalPerUnit,
    Value<String>? unitLabel,
    Value<bool>? isDurationBased,
  }) {
    return ActivitiesTableCompanion(
      id: id ?? this.id,
      presetKey: presetKey ?? this.presetKey,
      name: name ?? this.name,
      kcalPerUnit: kcalPerUnit ?? this.kcalPerUnit,
      unitLabel: unitLabel ?? this.unitLabel,
      isDurationBased: isDurationBased ?? this.isDurationBased,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (presetKey.present) {
      map['preset_key'] = Variable<String>(presetKey.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (kcalPerUnit.present) {
      map['kcal_per_unit'] = Variable<int>(kcalPerUnit.value);
    }
    if (unitLabel.present) {
      map['unit_label'] = Variable<String>(unitLabel.value);
    }
    if (isDurationBased.present) {
      map['is_duration_based'] = Variable<bool>(isDurationBased.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ActivitiesTableCompanion(')
          ..write('id: $id, ')
          ..write('presetKey: $presetKey, ')
          ..write('name: $name, ')
          ..write('kcalPerUnit: $kcalPerUnit, ')
          ..write('unitLabel: $unitLabel, ')
          ..write('isDurationBased: $isDurationBased')
          ..write(')'))
        .toString();
  }
}

class $ActivityEntriesTableTable extends ActivityEntriesTable
    with TableInfo<$ActivityEntriesTableTable, ActivityEntryRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ActivityEntriesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _activityIdMeta = const VerificationMeta(
    'activityId',
  );
  @override
  late final GeneratedColumn<int> activityId = GeneratedColumn<int>(
    'activity_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'UNIQUE REFERENCES activities (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<int> amount = GeneratedColumn<int>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, activityId, amount];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'activity_entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<ActivityEntryRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('activity_id')) {
      context.handle(
        _activityIdMeta,
        activityId.isAcceptableOrUnknown(data['activity_id']!, _activityIdMeta),
      );
    } else if (isInserting) {
      context.missing(_activityIdMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ActivityEntryRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ActivityEntryRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      activityId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}activity_id'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}amount'],
      )!,
    );
  }

  @override
  $ActivityEntriesTableTable createAlias(String alias) {
    return $ActivityEntriesTableTable(attachedDatabase, alias);
  }
}

class ActivityEntryRow extends DataClass
    implements Insertable<ActivityEntryRow> {
  final int id;
  final int activityId;
  final int amount;
  const ActivityEntryRow({
    required this.id,
    required this.activityId,
    required this.amount,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['activity_id'] = Variable<int>(activityId);
    map['amount'] = Variable<int>(amount);
    return map;
  }

  ActivityEntriesTableCompanion toCompanion(bool nullToAbsent) {
    return ActivityEntriesTableCompanion(
      id: Value(id),
      activityId: Value(activityId),
      amount: Value(amount),
    );
  }

  factory ActivityEntryRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ActivityEntryRow(
      id: serializer.fromJson<int>(json['id']),
      activityId: serializer.fromJson<int>(json['activityId']),
      amount: serializer.fromJson<int>(json['amount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'activityId': serializer.toJson<int>(activityId),
      'amount': serializer.toJson<int>(amount),
    };
  }

  ActivityEntryRow copyWith({int? id, int? activityId, int? amount}) =>
      ActivityEntryRow(
        id: id ?? this.id,
        activityId: activityId ?? this.activityId,
        amount: amount ?? this.amount,
      );
  ActivityEntryRow copyWithCompanion(ActivityEntriesTableCompanion data) {
    return ActivityEntryRow(
      id: data.id.present ? data.id.value : this.id,
      activityId: data.activityId.present
          ? data.activityId.value
          : this.activityId,
      amount: data.amount.present ? data.amount.value : this.amount,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ActivityEntryRow(')
          ..write('id: $id, ')
          ..write('activityId: $activityId, ')
          ..write('amount: $amount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, activityId, amount);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ActivityEntryRow &&
          other.id == this.id &&
          other.activityId == this.activityId &&
          other.amount == this.amount);
}

class ActivityEntriesTableCompanion extends UpdateCompanion<ActivityEntryRow> {
  final Value<int> id;
  final Value<int> activityId;
  final Value<int> amount;
  const ActivityEntriesTableCompanion({
    this.id = const Value.absent(),
    this.activityId = const Value.absent(),
    this.amount = const Value.absent(),
  });
  ActivityEntriesTableCompanion.insert({
    this.id = const Value.absent(),
    required int activityId,
    required int amount,
  }) : activityId = Value(activityId),
       amount = Value(amount);
  static Insertable<ActivityEntryRow> custom({
    Expression<int>? id,
    Expression<int>? activityId,
    Expression<int>? amount,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (activityId != null) 'activity_id': activityId,
      if (amount != null) 'amount': amount,
    });
  }

  ActivityEntriesTableCompanion copyWith({
    Value<int>? id,
    Value<int>? activityId,
    Value<int>? amount,
  }) {
    return ActivityEntriesTableCompanion(
      id: id ?? this.id,
      activityId: activityId ?? this.activityId,
      amount: amount ?? this.amount,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (activityId.present) {
      map['activity_id'] = Variable<int>(activityId.value);
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ActivityEntriesTableCompanion(')
          ..write('id: $id, ')
          ..write('activityId: $activityId, ')
          ..write('amount: $amount')
          ..write(')'))
        .toString();
  }
}

class $IngredientsTableTable extends IngredientsTable
    with TableInfo<$IngredientsTableTable, IngredientRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $IngredientsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _referenceGMeta = const VerificationMeta(
    'referenceG',
  );
  @override
  late final GeneratedColumn<double> referenceG = GeneratedColumn<double>(
    'reference_g',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(100),
  );
  static const VerificationMeta _kcalMeta = const VerificationMeta('kcal');
  @override
  late final GeneratedColumn<double> kcal = GeneratedColumn<double>(
    'kcal',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _proteinGMeta = const VerificationMeta(
    'proteinG',
  );
  @override
  late final GeneratedColumn<double> proteinG = GeneratedColumn<double>(
    'protein_g',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _carbsGMeta = const VerificationMeta('carbsG');
  @override
  late final GeneratedColumn<double> carbsG = GeneratedColumn<double>(
    'carbs_g',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sugarsGMeta = const VerificationMeta(
    'sugarsG',
  );
  @override
  late final GeneratedColumn<double> sugarsG = GeneratedColumn<double>(
    'sugars_g',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fatGMeta = const VerificationMeta('fatG');
  @override
  late final GeneratedColumn<double> fatG = GeneratedColumn<double>(
    'fat_g',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _saturatedGMeta = const VerificationMeta(
    'saturatedG',
  );
  @override
  late final GeneratedColumn<double> saturatedG = GeneratedColumn<double>(
    'saturated_g',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fiberGMeta = const VerificationMeta('fiberG');
  @override
  late final GeneratedColumn<double> fiberG = GeneratedColumn<double>(
    'fiber_g',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _saltMgMeta = const VerificationMeta('saltMg');
  @override
  late final GeneratedColumn<double> saltMg = GeneratedColumn<double>(
    'salt_mg',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    category,
    referenceG,
    kcal,
    proteinG,
    carbsG,
    sugarsG,
    fatG,
    saturatedG,
    fiberG,
    saltMg,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'ingredients';
  @override
  VerificationContext validateIntegrity(
    Insertable<IngredientRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    }
    if (data.containsKey('reference_g')) {
      context.handle(
        _referenceGMeta,
        referenceG.isAcceptableOrUnknown(data['reference_g']!, _referenceGMeta),
      );
    }
    if (data.containsKey('kcal')) {
      context.handle(
        _kcalMeta,
        kcal.isAcceptableOrUnknown(data['kcal']!, _kcalMeta),
      );
    } else if (isInserting) {
      context.missing(_kcalMeta);
    }
    if (data.containsKey('protein_g')) {
      context.handle(
        _proteinGMeta,
        proteinG.isAcceptableOrUnknown(data['protein_g']!, _proteinGMeta),
      );
    } else if (isInserting) {
      context.missing(_proteinGMeta);
    }
    if (data.containsKey('carbs_g')) {
      context.handle(
        _carbsGMeta,
        carbsG.isAcceptableOrUnknown(data['carbs_g']!, _carbsGMeta),
      );
    } else if (isInserting) {
      context.missing(_carbsGMeta);
    }
    if (data.containsKey('sugars_g')) {
      context.handle(
        _sugarsGMeta,
        sugarsG.isAcceptableOrUnknown(data['sugars_g']!, _sugarsGMeta),
      );
    } else if (isInserting) {
      context.missing(_sugarsGMeta);
    }
    if (data.containsKey('fat_g')) {
      context.handle(
        _fatGMeta,
        fatG.isAcceptableOrUnknown(data['fat_g']!, _fatGMeta),
      );
    } else if (isInserting) {
      context.missing(_fatGMeta);
    }
    if (data.containsKey('saturated_g')) {
      context.handle(
        _saturatedGMeta,
        saturatedG.isAcceptableOrUnknown(data['saturated_g']!, _saturatedGMeta),
      );
    } else if (isInserting) {
      context.missing(_saturatedGMeta);
    }
    if (data.containsKey('fiber_g')) {
      context.handle(
        _fiberGMeta,
        fiberG.isAcceptableOrUnknown(data['fiber_g']!, _fiberGMeta),
      );
    } else if (isInserting) {
      context.missing(_fiberGMeta);
    }
    if (data.containsKey('salt_mg')) {
      context.handle(
        _saltMgMeta,
        saltMg.isAcceptableOrUnknown(data['salt_mg']!, _saltMgMeta),
      );
    } else if (isInserting) {
      context.missing(_saltMgMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  IngredientRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return IngredientRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      ),
      referenceG: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}reference_g'],
      )!,
      kcal: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}kcal'],
      )!,
      proteinG: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}protein_g'],
      )!,
      carbsG: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}carbs_g'],
      )!,
      sugarsG: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}sugars_g'],
      )!,
      fatG: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}fat_g'],
      )!,
      saturatedG: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}saturated_g'],
      )!,
      fiberG: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}fiber_g'],
      )!,
      saltMg: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}salt_mg'],
      )!,
    );
  }

  @override
  $IngredientsTableTable createAlias(String alias) {
    return $IngredientsTableTable(attachedDatabase, alias);
  }
}

class IngredientRow extends DataClass implements Insertable<IngredientRow> {
  final int id;
  final String name;
  final String? category;
  final double referenceG;
  final double kcal;
  final double proteinG;
  final double carbsG;
  final double sugarsG;
  final double fatG;
  final double saturatedG;
  final double fiberG;
  final double saltMg;
  const IngredientRow({
    required this.id,
    required this.name,
    this.category,
    required this.referenceG,
    required this.kcal,
    required this.proteinG,
    required this.carbsG,
    required this.sugarsG,
    required this.fatG,
    required this.saturatedG,
    required this.fiberG,
    required this.saltMg,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || category != null) {
      map['category'] = Variable<String>(category);
    }
    map['reference_g'] = Variable<double>(referenceG);
    map['kcal'] = Variable<double>(kcal);
    map['protein_g'] = Variable<double>(proteinG);
    map['carbs_g'] = Variable<double>(carbsG);
    map['sugars_g'] = Variable<double>(sugarsG);
    map['fat_g'] = Variable<double>(fatG);
    map['saturated_g'] = Variable<double>(saturatedG);
    map['fiber_g'] = Variable<double>(fiberG);
    map['salt_mg'] = Variable<double>(saltMg);
    return map;
  }

  IngredientsTableCompanion toCompanion(bool nullToAbsent) {
    return IngredientsTableCompanion(
      id: Value(id),
      name: Value(name),
      category: category == null && nullToAbsent
          ? const Value.absent()
          : Value(category),
      referenceG: Value(referenceG),
      kcal: Value(kcal),
      proteinG: Value(proteinG),
      carbsG: Value(carbsG),
      sugarsG: Value(sugarsG),
      fatG: Value(fatG),
      saturatedG: Value(saturatedG),
      fiberG: Value(fiberG),
      saltMg: Value(saltMg),
    );
  }

  factory IngredientRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return IngredientRow(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      category: serializer.fromJson<String?>(json['category']),
      referenceG: serializer.fromJson<double>(json['referenceG']),
      kcal: serializer.fromJson<double>(json['kcal']),
      proteinG: serializer.fromJson<double>(json['proteinG']),
      carbsG: serializer.fromJson<double>(json['carbsG']),
      sugarsG: serializer.fromJson<double>(json['sugarsG']),
      fatG: serializer.fromJson<double>(json['fatG']),
      saturatedG: serializer.fromJson<double>(json['saturatedG']),
      fiberG: serializer.fromJson<double>(json['fiberG']),
      saltMg: serializer.fromJson<double>(json['saltMg']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'category': serializer.toJson<String?>(category),
      'referenceG': serializer.toJson<double>(referenceG),
      'kcal': serializer.toJson<double>(kcal),
      'proteinG': serializer.toJson<double>(proteinG),
      'carbsG': serializer.toJson<double>(carbsG),
      'sugarsG': serializer.toJson<double>(sugarsG),
      'fatG': serializer.toJson<double>(fatG),
      'saturatedG': serializer.toJson<double>(saturatedG),
      'fiberG': serializer.toJson<double>(fiberG),
      'saltMg': serializer.toJson<double>(saltMg),
    };
  }

  IngredientRow copyWith({
    int? id,
    String? name,
    Value<String?> category = const Value.absent(),
    double? referenceG,
    double? kcal,
    double? proteinG,
    double? carbsG,
    double? sugarsG,
    double? fatG,
    double? saturatedG,
    double? fiberG,
    double? saltMg,
  }) => IngredientRow(
    id: id ?? this.id,
    name: name ?? this.name,
    category: category.present ? category.value : this.category,
    referenceG: referenceG ?? this.referenceG,
    kcal: kcal ?? this.kcal,
    proteinG: proteinG ?? this.proteinG,
    carbsG: carbsG ?? this.carbsG,
    sugarsG: sugarsG ?? this.sugarsG,
    fatG: fatG ?? this.fatG,
    saturatedG: saturatedG ?? this.saturatedG,
    fiberG: fiberG ?? this.fiberG,
    saltMg: saltMg ?? this.saltMg,
  );
  IngredientRow copyWithCompanion(IngredientsTableCompanion data) {
    return IngredientRow(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      category: data.category.present ? data.category.value : this.category,
      referenceG: data.referenceG.present
          ? data.referenceG.value
          : this.referenceG,
      kcal: data.kcal.present ? data.kcal.value : this.kcal,
      proteinG: data.proteinG.present ? data.proteinG.value : this.proteinG,
      carbsG: data.carbsG.present ? data.carbsG.value : this.carbsG,
      sugarsG: data.sugarsG.present ? data.sugarsG.value : this.sugarsG,
      fatG: data.fatG.present ? data.fatG.value : this.fatG,
      saturatedG: data.saturatedG.present
          ? data.saturatedG.value
          : this.saturatedG,
      fiberG: data.fiberG.present ? data.fiberG.value : this.fiberG,
      saltMg: data.saltMg.present ? data.saltMg.value : this.saltMg,
    );
  }

  @override
  String toString() {
    return (StringBuffer('IngredientRow(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('category: $category, ')
          ..write('referenceG: $referenceG, ')
          ..write('kcal: $kcal, ')
          ..write('proteinG: $proteinG, ')
          ..write('carbsG: $carbsG, ')
          ..write('sugarsG: $sugarsG, ')
          ..write('fatG: $fatG, ')
          ..write('saturatedG: $saturatedG, ')
          ..write('fiberG: $fiberG, ')
          ..write('saltMg: $saltMg')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    category,
    referenceG,
    kcal,
    proteinG,
    carbsG,
    sugarsG,
    fatG,
    saturatedG,
    fiberG,
    saltMg,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is IngredientRow &&
          other.id == this.id &&
          other.name == this.name &&
          other.category == this.category &&
          other.referenceG == this.referenceG &&
          other.kcal == this.kcal &&
          other.proteinG == this.proteinG &&
          other.carbsG == this.carbsG &&
          other.sugarsG == this.sugarsG &&
          other.fatG == this.fatG &&
          other.saturatedG == this.saturatedG &&
          other.fiberG == this.fiberG &&
          other.saltMg == this.saltMg);
}

class IngredientsTableCompanion extends UpdateCompanion<IngredientRow> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> category;
  final Value<double> referenceG;
  final Value<double> kcal;
  final Value<double> proteinG;
  final Value<double> carbsG;
  final Value<double> sugarsG;
  final Value<double> fatG;
  final Value<double> saturatedG;
  final Value<double> fiberG;
  final Value<double> saltMg;
  const IngredientsTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.category = const Value.absent(),
    this.referenceG = const Value.absent(),
    this.kcal = const Value.absent(),
    this.proteinG = const Value.absent(),
    this.carbsG = const Value.absent(),
    this.sugarsG = const Value.absent(),
    this.fatG = const Value.absent(),
    this.saturatedG = const Value.absent(),
    this.fiberG = const Value.absent(),
    this.saltMg = const Value.absent(),
  });
  IngredientsTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.category = const Value.absent(),
    this.referenceG = const Value.absent(),
    required double kcal,
    required double proteinG,
    required double carbsG,
    required double sugarsG,
    required double fatG,
    required double saturatedG,
    required double fiberG,
    required double saltMg,
  }) : name = Value(name),
       kcal = Value(kcal),
       proteinG = Value(proteinG),
       carbsG = Value(carbsG),
       sugarsG = Value(sugarsG),
       fatG = Value(fatG),
       saturatedG = Value(saturatedG),
       fiberG = Value(fiberG),
       saltMg = Value(saltMg);
  static Insertable<IngredientRow> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? category,
    Expression<double>? referenceG,
    Expression<double>? kcal,
    Expression<double>? proteinG,
    Expression<double>? carbsG,
    Expression<double>? sugarsG,
    Expression<double>? fatG,
    Expression<double>? saturatedG,
    Expression<double>? fiberG,
    Expression<double>? saltMg,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (category != null) 'category': category,
      if (referenceG != null) 'reference_g': referenceG,
      if (kcal != null) 'kcal': kcal,
      if (proteinG != null) 'protein_g': proteinG,
      if (carbsG != null) 'carbs_g': carbsG,
      if (sugarsG != null) 'sugars_g': sugarsG,
      if (fatG != null) 'fat_g': fatG,
      if (saturatedG != null) 'saturated_g': saturatedG,
      if (fiberG != null) 'fiber_g': fiberG,
      if (saltMg != null) 'salt_mg': saltMg,
    });
  }

  IngredientsTableCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String?>? category,
    Value<double>? referenceG,
    Value<double>? kcal,
    Value<double>? proteinG,
    Value<double>? carbsG,
    Value<double>? sugarsG,
    Value<double>? fatG,
    Value<double>? saturatedG,
    Value<double>? fiberG,
    Value<double>? saltMg,
  }) {
    return IngredientsTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      referenceG: referenceG ?? this.referenceG,
      kcal: kcal ?? this.kcal,
      proteinG: proteinG ?? this.proteinG,
      carbsG: carbsG ?? this.carbsG,
      sugarsG: sugarsG ?? this.sugarsG,
      fatG: fatG ?? this.fatG,
      saturatedG: saturatedG ?? this.saturatedG,
      fiberG: fiberG ?? this.fiberG,
      saltMg: saltMg ?? this.saltMg,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (referenceG.present) {
      map['reference_g'] = Variable<double>(referenceG.value);
    }
    if (kcal.present) {
      map['kcal'] = Variable<double>(kcal.value);
    }
    if (proteinG.present) {
      map['protein_g'] = Variable<double>(proteinG.value);
    }
    if (carbsG.present) {
      map['carbs_g'] = Variable<double>(carbsG.value);
    }
    if (sugarsG.present) {
      map['sugars_g'] = Variable<double>(sugarsG.value);
    }
    if (fatG.present) {
      map['fat_g'] = Variable<double>(fatG.value);
    }
    if (saturatedG.present) {
      map['saturated_g'] = Variable<double>(saturatedG.value);
    }
    if (fiberG.present) {
      map['fiber_g'] = Variable<double>(fiberG.value);
    }
    if (saltMg.present) {
      map['salt_mg'] = Variable<double>(saltMg.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('IngredientsTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('category: $category, ')
          ..write('referenceG: $referenceG, ')
          ..write('kcal: $kcal, ')
          ..write('proteinG: $proteinG, ')
          ..write('carbsG: $carbsG, ')
          ..write('sugarsG: $sugarsG, ')
          ..write('fatG: $fatG, ')
          ..write('saturatedG: $saturatedG, ')
          ..write('fiberG: $fiberG, ')
          ..write('saltMg: $saltMg')
          ..write(')'))
        .toString();
  }
}

class $FoodEntriesTableTable extends FoodEntriesTable
    with TableInfo<$FoodEntriesTableTable, FoodEntryRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FoodEntriesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _ingredientIdMeta = const VerificationMeta(
    'ingredientId',
  );
  @override
  late final GeneratedColumn<int> ingredientId = GeneratedColumn<int>(
    'ingredient_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'UNIQUE REFERENCES ingredients (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _gramsMeta = const VerificationMeta('grams');
  @override
  late final GeneratedColumn<int> grams = GeneratedColumn<int>(
    'grams',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, ingredientId, grams];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'food_entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<FoodEntryRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('ingredient_id')) {
      context.handle(
        _ingredientIdMeta,
        ingredientId.isAcceptableOrUnknown(
          data['ingredient_id']!,
          _ingredientIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_ingredientIdMeta);
    }
    if (data.containsKey('grams')) {
      context.handle(
        _gramsMeta,
        grams.isAcceptableOrUnknown(data['grams']!, _gramsMeta),
      );
    } else if (isInserting) {
      context.missing(_gramsMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FoodEntryRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FoodEntryRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      ingredientId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}ingredient_id'],
      )!,
      grams: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}grams'],
      )!,
    );
  }

  @override
  $FoodEntriesTableTable createAlias(String alias) {
    return $FoodEntriesTableTable(attachedDatabase, alias);
  }
}

class FoodEntryRow extends DataClass implements Insertable<FoodEntryRow> {
  final int id;
  final int ingredientId;
  final int grams;
  const FoodEntryRow({
    required this.id,
    required this.ingredientId,
    required this.grams,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['ingredient_id'] = Variable<int>(ingredientId);
    map['grams'] = Variable<int>(grams);
    return map;
  }

  FoodEntriesTableCompanion toCompanion(bool nullToAbsent) {
    return FoodEntriesTableCompanion(
      id: Value(id),
      ingredientId: Value(ingredientId),
      grams: Value(grams),
    );
  }

  factory FoodEntryRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FoodEntryRow(
      id: serializer.fromJson<int>(json['id']),
      ingredientId: serializer.fromJson<int>(json['ingredientId']),
      grams: serializer.fromJson<int>(json['grams']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'ingredientId': serializer.toJson<int>(ingredientId),
      'grams': serializer.toJson<int>(grams),
    };
  }

  FoodEntryRow copyWith({int? id, int? ingredientId, int? grams}) =>
      FoodEntryRow(
        id: id ?? this.id,
        ingredientId: ingredientId ?? this.ingredientId,
        grams: grams ?? this.grams,
      );
  FoodEntryRow copyWithCompanion(FoodEntriesTableCompanion data) {
    return FoodEntryRow(
      id: data.id.present ? data.id.value : this.id,
      ingredientId: data.ingredientId.present
          ? data.ingredientId.value
          : this.ingredientId,
      grams: data.grams.present ? data.grams.value : this.grams,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FoodEntryRow(')
          ..write('id: $id, ')
          ..write('ingredientId: $ingredientId, ')
          ..write('grams: $grams')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, ingredientId, grams);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FoodEntryRow &&
          other.id == this.id &&
          other.ingredientId == this.ingredientId &&
          other.grams == this.grams);
}

class FoodEntriesTableCompanion extends UpdateCompanion<FoodEntryRow> {
  final Value<int> id;
  final Value<int> ingredientId;
  final Value<int> grams;
  const FoodEntriesTableCompanion({
    this.id = const Value.absent(),
    this.ingredientId = const Value.absent(),
    this.grams = const Value.absent(),
  });
  FoodEntriesTableCompanion.insert({
    this.id = const Value.absent(),
    required int ingredientId,
    required int grams,
  }) : ingredientId = Value(ingredientId),
       grams = Value(grams);
  static Insertable<FoodEntryRow> custom({
    Expression<int>? id,
    Expression<int>? ingredientId,
    Expression<int>? grams,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (ingredientId != null) 'ingredient_id': ingredientId,
      if (grams != null) 'grams': grams,
    });
  }

  FoodEntriesTableCompanion copyWith({
    Value<int>? id,
    Value<int>? ingredientId,
    Value<int>? grams,
  }) {
    return FoodEntriesTableCompanion(
      id: id ?? this.id,
      ingredientId: ingredientId ?? this.ingredientId,
      grams: grams ?? this.grams,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (ingredientId.present) {
      map['ingredient_id'] = Variable<int>(ingredientId.value);
    }
    if (grams.present) {
      map['grams'] = Variable<int>(grams.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FoodEntriesTableCompanion(')
          ..write('id: $id, ')
          ..write('ingredientId: $ingredientId, ')
          ..write('grams: $grams')
          ..write(')'))
        .toString();
  }
}

class $DayLogsTableTable extends DayLogsTable
    with TableInfo<$DayLogsTableTable, DayLogRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DayLogsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _dayMeta = const VerificationMeta('day');
  @override
  late final GeneratedColumn<String> day = GeneratedColumn<String>(
    'day',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _dailyKcalMeta = const VerificationMeta(
    'dailyKcal',
  );
  @override
  late final GeneratedColumn<double> dailyKcal = GeneratedColumn<double>(
    'daily_kcal',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _proteinGoalGMeta = const VerificationMeta(
    'proteinGoalG',
  );
  @override
  late final GeneratedColumn<double> proteinGoalG = GeneratedColumn<double>(
    'protein_goal_g',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fiberGoalGMeta = const VerificationMeta(
    'fiberGoalG',
  );
  @override
  late final GeneratedColumn<double> fiberGoalG = GeneratedColumn<double>(
    'fiber_goal_g',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sugarLimitPctMeta = const VerificationMeta(
    'sugarLimitPct',
  );
  @override
  late final GeneratedColumn<double> sugarLimitPct = GeneratedColumn<double>(
    'sugar_limit_pct',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _saturatedLimitPctMeta = const VerificationMeta(
    'saturatedLimitPct',
  );
  @override
  late final GeneratedColumn<double> saturatedLimitPct =
      GeneratedColumn<double>(
        'saturated_limit_pct',
        aliasedName,
        false,
        type: DriftSqlType.double,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _saltLimitMgMeta = const VerificationMeta(
    'saltLimitMg',
  );
  @override
  late final GeneratedColumn<double> saltLimitMg = GeneratedColumn<double>(
    'salt_limit_mg',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _burnedKcalMeta = const VerificationMeta(
    'burnedKcal',
  );
  @override
  late final GeneratedColumn<double> burnedKcal = GeneratedColumn<double>(
    'burned_kcal',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _adjustedKcalMeta = const VerificationMeta(
    'adjustedKcal',
  );
  @override
  late final GeneratedColumn<double> adjustedKcal = GeneratedColumn<double>(
    'adjusted_kcal',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sugarLimitGMeta = const VerificationMeta(
    'sugarLimitG',
  );
  @override
  late final GeneratedColumn<double> sugarLimitG = GeneratedColumn<double>(
    'sugar_limit_g',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _saturatedLimitGMeta = const VerificationMeta(
    'saturatedLimitG',
  );
  @override
  late final GeneratedColumn<double> saturatedLimitG = GeneratedColumn<double>(
    'saturated_limit_g',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _kcalMeta = const VerificationMeta('kcal');
  @override
  late final GeneratedColumn<double> kcal = GeneratedColumn<double>(
    'kcal',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _proteinGMeta = const VerificationMeta(
    'proteinG',
  );
  @override
  late final GeneratedColumn<double> proteinG = GeneratedColumn<double>(
    'protein_g',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _carbsGMeta = const VerificationMeta('carbsG');
  @override
  late final GeneratedColumn<double> carbsG = GeneratedColumn<double>(
    'carbs_g',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sugarsGMeta = const VerificationMeta(
    'sugarsG',
  );
  @override
  late final GeneratedColumn<double> sugarsG = GeneratedColumn<double>(
    'sugars_g',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fatGMeta = const VerificationMeta('fatG');
  @override
  late final GeneratedColumn<double> fatG = GeneratedColumn<double>(
    'fat_g',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _saturatedGMeta = const VerificationMeta(
    'saturatedG',
  );
  @override
  late final GeneratedColumn<double> saturatedG = GeneratedColumn<double>(
    'saturated_g',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fiberGMeta = const VerificationMeta('fiberG');
  @override
  late final GeneratedColumn<double> fiberG = GeneratedColumn<double>(
    'fiber_g',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _saltMgMeta = const VerificationMeta('saltMg');
  @override
  late final GeneratedColumn<double> saltMg = GeneratedColumn<double>(
    'salt_mg',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sexMeta = const VerificationMeta('sex');
  @override
  late final GeneratedColumn<String> sex = GeneratedColumn<String>(
    'sex',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ageMeta = const VerificationMeta('age');
  @override
  late final GeneratedColumn<int> age = GeneratedColumn<int>(
    'age',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    day,
    dailyKcal,
    proteinGoalG,
    fiberGoalG,
    sugarLimitPct,
    saturatedLimitPct,
    saltLimitMg,
    burnedKcal,
    adjustedKcal,
    sugarLimitG,
    saturatedLimitG,
    kcal,
    proteinG,
    carbsG,
    sugarsG,
    fatG,
    saturatedG,
    fiberG,
    saltMg,
    sex,
    age,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'day_logs';
  @override
  VerificationContext validateIntegrity(
    Insertable<DayLogRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('day')) {
      context.handle(
        _dayMeta,
        day.isAcceptableOrUnknown(data['day']!, _dayMeta),
      );
    } else if (isInserting) {
      context.missing(_dayMeta);
    }
    if (data.containsKey('daily_kcal')) {
      context.handle(
        _dailyKcalMeta,
        dailyKcal.isAcceptableOrUnknown(data['daily_kcal']!, _dailyKcalMeta),
      );
    } else if (isInserting) {
      context.missing(_dailyKcalMeta);
    }
    if (data.containsKey('protein_goal_g')) {
      context.handle(
        _proteinGoalGMeta,
        proteinGoalG.isAcceptableOrUnknown(
          data['protein_goal_g']!,
          _proteinGoalGMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_proteinGoalGMeta);
    }
    if (data.containsKey('fiber_goal_g')) {
      context.handle(
        _fiberGoalGMeta,
        fiberGoalG.isAcceptableOrUnknown(
          data['fiber_goal_g']!,
          _fiberGoalGMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_fiberGoalGMeta);
    }
    if (data.containsKey('sugar_limit_pct')) {
      context.handle(
        _sugarLimitPctMeta,
        sugarLimitPct.isAcceptableOrUnknown(
          data['sugar_limit_pct']!,
          _sugarLimitPctMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_sugarLimitPctMeta);
    }
    if (data.containsKey('saturated_limit_pct')) {
      context.handle(
        _saturatedLimitPctMeta,
        saturatedLimitPct.isAcceptableOrUnknown(
          data['saturated_limit_pct']!,
          _saturatedLimitPctMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_saturatedLimitPctMeta);
    }
    if (data.containsKey('salt_limit_mg')) {
      context.handle(
        _saltLimitMgMeta,
        saltLimitMg.isAcceptableOrUnknown(
          data['salt_limit_mg']!,
          _saltLimitMgMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_saltLimitMgMeta);
    }
    if (data.containsKey('burned_kcal')) {
      context.handle(
        _burnedKcalMeta,
        burnedKcal.isAcceptableOrUnknown(data['burned_kcal']!, _burnedKcalMeta),
      );
    } else if (isInserting) {
      context.missing(_burnedKcalMeta);
    }
    if (data.containsKey('adjusted_kcal')) {
      context.handle(
        _adjustedKcalMeta,
        adjustedKcal.isAcceptableOrUnknown(
          data['adjusted_kcal']!,
          _adjustedKcalMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_adjustedKcalMeta);
    }
    if (data.containsKey('sugar_limit_g')) {
      context.handle(
        _sugarLimitGMeta,
        sugarLimitG.isAcceptableOrUnknown(
          data['sugar_limit_g']!,
          _sugarLimitGMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_sugarLimitGMeta);
    }
    if (data.containsKey('saturated_limit_g')) {
      context.handle(
        _saturatedLimitGMeta,
        saturatedLimitG.isAcceptableOrUnknown(
          data['saturated_limit_g']!,
          _saturatedLimitGMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_saturatedLimitGMeta);
    }
    if (data.containsKey('kcal')) {
      context.handle(
        _kcalMeta,
        kcal.isAcceptableOrUnknown(data['kcal']!, _kcalMeta),
      );
    } else if (isInserting) {
      context.missing(_kcalMeta);
    }
    if (data.containsKey('protein_g')) {
      context.handle(
        _proteinGMeta,
        proteinG.isAcceptableOrUnknown(data['protein_g']!, _proteinGMeta),
      );
    } else if (isInserting) {
      context.missing(_proteinGMeta);
    }
    if (data.containsKey('carbs_g')) {
      context.handle(
        _carbsGMeta,
        carbsG.isAcceptableOrUnknown(data['carbs_g']!, _carbsGMeta),
      );
    } else if (isInserting) {
      context.missing(_carbsGMeta);
    }
    if (data.containsKey('sugars_g')) {
      context.handle(
        _sugarsGMeta,
        sugarsG.isAcceptableOrUnknown(data['sugars_g']!, _sugarsGMeta),
      );
    } else if (isInserting) {
      context.missing(_sugarsGMeta);
    }
    if (data.containsKey('fat_g')) {
      context.handle(
        _fatGMeta,
        fatG.isAcceptableOrUnknown(data['fat_g']!, _fatGMeta),
      );
    } else if (isInserting) {
      context.missing(_fatGMeta);
    }
    if (data.containsKey('saturated_g')) {
      context.handle(
        _saturatedGMeta,
        saturatedG.isAcceptableOrUnknown(data['saturated_g']!, _saturatedGMeta),
      );
    } else if (isInserting) {
      context.missing(_saturatedGMeta);
    }
    if (data.containsKey('fiber_g')) {
      context.handle(
        _fiberGMeta,
        fiberG.isAcceptableOrUnknown(data['fiber_g']!, _fiberGMeta),
      );
    } else if (isInserting) {
      context.missing(_fiberGMeta);
    }
    if (data.containsKey('salt_mg')) {
      context.handle(
        _saltMgMeta,
        saltMg.isAcceptableOrUnknown(data['salt_mg']!, _saltMgMeta),
      );
    } else if (isInserting) {
      context.missing(_saltMgMeta);
    }
    if (data.containsKey('sex')) {
      context.handle(
        _sexMeta,
        sex.isAcceptableOrUnknown(data['sex']!, _sexMeta),
      );
    }
    if (data.containsKey('age')) {
      context.handle(
        _ageMeta,
        age.isAcceptableOrUnknown(data['age']!, _ageMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DayLogRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DayLogRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      day: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}day'],
      )!,
      dailyKcal: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}daily_kcal'],
      )!,
      proteinGoalG: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}protein_goal_g'],
      )!,
      fiberGoalG: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}fiber_goal_g'],
      )!,
      sugarLimitPct: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}sugar_limit_pct'],
      )!,
      saturatedLimitPct: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}saturated_limit_pct'],
      )!,
      saltLimitMg: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}salt_limit_mg'],
      )!,
      burnedKcal: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}burned_kcal'],
      )!,
      adjustedKcal: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}adjusted_kcal'],
      )!,
      sugarLimitG: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}sugar_limit_g'],
      )!,
      saturatedLimitG: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}saturated_limit_g'],
      )!,
      kcal: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}kcal'],
      )!,
      proteinG: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}protein_g'],
      )!,
      carbsG: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}carbs_g'],
      )!,
      sugarsG: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}sugars_g'],
      )!,
      fatG: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}fat_g'],
      )!,
      saturatedG: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}saturated_g'],
      )!,
      fiberG: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}fiber_g'],
      )!,
      saltMg: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}salt_mg'],
      )!,
      sex: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sex'],
      ),
      age: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}age'],
      ),
    );
  }

  @override
  $DayLogsTableTable createAlias(String alias) {
    return $DayLogsTableTable(attachedDatabase, alias);
  }
}

class DayLogRow extends DataClass implements Insertable<DayLogRow> {
  final int id;
  final String day;
  final double dailyKcal;
  final double proteinGoalG;
  final double fiberGoalG;
  final double sugarLimitPct;
  final double saturatedLimitPct;
  final double saltLimitMg;
  final double burnedKcal;
  final double adjustedKcal;
  final double sugarLimitG;
  final double saturatedLimitG;
  final double kcal;
  final double proteinG;
  final double carbsG;
  final double sugarsG;
  final double fatG;
  final double saturatedG;
  final double fiberG;
  final double saltMg;
  final String? sex;
  final int? age;
  const DayLogRow({
    required this.id,
    required this.day,
    required this.dailyKcal,
    required this.proteinGoalG,
    required this.fiberGoalG,
    required this.sugarLimitPct,
    required this.saturatedLimitPct,
    required this.saltLimitMg,
    required this.burnedKcal,
    required this.adjustedKcal,
    required this.sugarLimitG,
    required this.saturatedLimitG,
    required this.kcal,
    required this.proteinG,
    required this.carbsG,
    required this.sugarsG,
    required this.fatG,
    required this.saturatedG,
    required this.fiberG,
    required this.saltMg,
    this.sex,
    this.age,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['day'] = Variable<String>(day);
    map['daily_kcal'] = Variable<double>(dailyKcal);
    map['protein_goal_g'] = Variable<double>(proteinGoalG);
    map['fiber_goal_g'] = Variable<double>(fiberGoalG);
    map['sugar_limit_pct'] = Variable<double>(sugarLimitPct);
    map['saturated_limit_pct'] = Variable<double>(saturatedLimitPct);
    map['salt_limit_mg'] = Variable<double>(saltLimitMg);
    map['burned_kcal'] = Variable<double>(burnedKcal);
    map['adjusted_kcal'] = Variable<double>(adjustedKcal);
    map['sugar_limit_g'] = Variable<double>(sugarLimitG);
    map['saturated_limit_g'] = Variable<double>(saturatedLimitG);
    map['kcal'] = Variable<double>(kcal);
    map['protein_g'] = Variable<double>(proteinG);
    map['carbs_g'] = Variable<double>(carbsG);
    map['sugars_g'] = Variable<double>(sugarsG);
    map['fat_g'] = Variable<double>(fatG);
    map['saturated_g'] = Variable<double>(saturatedG);
    map['fiber_g'] = Variable<double>(fiberG);
    map['salt_mg'] = Variable<double>(saltMg);
    if (!nullToAbsent || sex != null) {
      map['sex'] = Variable<String>(sex);
    }
    if (!nullToAbsent || age != null) {
      map['age'] = Variable<int>(age);
    }
    return map;
  }

  DayLogsTableCompanion toCompanion(bool nullToAbsent) {
    return DayLogsTableCompanion(
      id: Value(id),
      day: Value(day),
      dailyKcal: Value(dailyKcal),
      proteinGoalG: Value(proteinGoalG),
      fiberGoalG: Value(fiberGoalG),
      sugarLimitPct: Value(sugarLimitPct),
      saturatedLimitPct: Value(saturatedLimitPct),
      saltLimitMg: Value(saltLimitMg),
      burnedKcal: Value(burnedKcal),
      adjustedKcal: Value(adjustedKcal),
      sugarLimitG: Value(sugarLimitG),
      saturatedLimitG: Value(saturatedLimitG),
      kcal: Value(kcal),
      proteinG: Value(proteinG),
      carbsG: Value(carbsG),
      sugarsG: Value(sugarsG),
      fatG: Value(fatG),
      saturatedG: Value(saturatedG),
      fiberG: Value(fiberG),
      saltMg: Value(saltMg),
      sex: sex == null && nullToAbsent ? const Value.absent() : Value(sex),
      age: age == null && nullToAbsent ? const Value.absent() : Value(age),
    );
  }

  factory DayLogRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DayLogRow(
      id: serializer.fromJson<int>(json['id']),
      day: serializer.fromJson<String>(json['day']),
      dailyKcal: serializer.fromJson<double>(json['dailyKcal']),
      proteinGoalG: serializer.fromJson<double>(json['proteinGoalG']),
      fiberGoalG: serializer.fromJson<double>(json['fiberGoalG']),
      sugarLimitPct: serializer.fromJson<double>(json['sugarLimitPct']),
      saturatedLimitPct: serializer.fromJson<double>(json['saturatedLimitPct']),
      saltLimitMg: serializer.fromJson<double>(json['saltLimitMg']),
      burnedKcal: serializer.fromJson<double>(json['burnedKcal']),
      adjustedKcal: serializer.fromJson<double>(json['adjustedKcal']),
      sugarLimitG: serializer.fromJson<double>(json['sugarLimitG']),
      saturatedLimitG: serializer.fromJson<double>(json['saturatedLimitG']),
      kcal: serializer.fromJson<double>(json['kcal']),
      proteinG: serializer.fromJson<double>(json['proteinG']),
      carbsG: serializer.fromJson<double>(json['carbsG']),
      sugarsG: serializer.fromJson<double>(json['sugarsG']),
      fatG: serializer.fromJson<double>(json['fatG']),
      saturatedG: serializer.fromJson<double>(json['saturatedG']),
      fiberG: serializer.fromJson<double>(json['fiberG']),
      saltMg: serializer.fromJson<double>(json['saltMg']),
      sex: serializer.fromJson<String?>(json['sex']),
      age: serializer.fromJson<int?>(json['age']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'day': serializer.toJson<String>(day),
      'dailyKcal': serializer.toJson<double>(dailyKcal),
      'proteinGoalG': serializer.toJson<double>(proteinGoalG),
      'fiberGoalG': serializer.toJson<double>(fiberGoalG),
      'sugarLimitPct': serializer.toJson<double>(sugarLimitPct),
      'saturatedLimitPct': serializer.toJson<double>(saturatedLimitPct),
      'saltLimitMg': serializer.toJson<double>(saltLimitMg),
      'burnedKcal': serializer.toJson<double>(burnedKcal),
      'adjustedKcal': serializer.toJson<double>(adjustedKcal),
      'sugarLimitG': serializer.toJson<double>(sugarLimitG),
      'saturatedLimitG': serializer.toJson<double>(saturatedLimitG),
      'kcal': serializer.toJson<double>(kcal),
      'proteinG': serializer.toJson<double>(proteinG),
      'carbsG': serializer.toJson<double>(carbsG),
      'sugarsG': serializer.toJson<double>(sugarsG),
      'fatG': serializer.toJson<double>(fatG),
      'saturatedG': serializer.toJson<double>(saturatedG),
      'fiberG': serializer.toJson<double>(fiberG),
      'saltMg': serializer.toJson<double>(saltMg),
      'sex': serializer.toJson<String?>(sex),
      'age': serializer.toJson<int?>(age),
    };
  }

  DayLogRow copyWith({
    int? id,
    String? day,
    double? dailyKcal,
    double? proteinGoalG,
    double? fiberGoalG,
    double? sugarLimitPct,
    double? saturatedLimitPct,
    double? saltLimitMg,
    double? burnedKcal,
    double? adjustedKcal,
    double? sugarLimitG,
    double? saturatedLimitG,
    double? kcal,
    double? proteinG,
    double? carbsG,
    double? sugarsG,
    double? fatG,
    double? saturatedG,
    double? fiberG,
    double? saltMg,
    Value<String?> sex = const Value.absent(),
    Value<int?> age = const Value.absent(),
  }) => DayLogRow(
    id: id ?? this.id,
    day: day ?? this.day,
    dailyKcal: dailyKcal ?? this.dailyKcal,
    proteinGoalG: proteinGoalG ?? this.proteinGoalG,
    fiberGoalG: fiberGoalG ?? this.fiberGoalG,
    sugarLimitPct: sugarLimitPct ?? this.sugarLimitPct,
    saturatedLimitPct: saturatedLimitPct ?? this.saturatedLimitPct,
    saltLimitMg: saltLimitMg ?? this.saltLimitMg,
    burnedKcal: burnedKcal ?? this.burnedKcal,
    adjustedKcal: adjustedKcal ?? this.adjustedKcal,
    sugarLimitG: sugarLimitG ?? this.sugarLimitG,
    saturatedLimitG: saturatedLimitG ?? this.saturatedLimitG,
    kcal: kcal ?? this.kcal,
    proteinG: proteinG ?? this.proteinG,
    carbsG: carbsG ?? this.carbsG,
    sugarsG: sugarsG ?? this.sugarsG,
    fatG: fatG ?? this.fatG,
    saturatedG: saturatedG ?? this.saturatedG,
    fiberG: fiberG ?? this.fiberG,
    saltMg: saltMg ?? this.saltMg,
    sex: sex.present ? sex.value : this.sex,
    age: age.present ? age.value : this.age,
  );
  DayLogRow copyWithCompanion(DayLogsTableCompanion data) {
    return DayLogRow(
      id: data.id.present ? data.id.value : this.id,
      day: data.day.present ? data.day.value : this.day,
      dailyKcal: data.dailyKcal.present ? data.dailyKcal.value : this.dailyKcal,
      proteinGoalG: data.proteinGoalG.present
          ? data.proteinGoalG.value
          : this.proteinGoalG,
      fiberGoalG: data.fiberGoalG.present
          ? data.fiberGoalG.value
          : this.fiberGoalG,
      sugarLimitPct: data.sugarLimitPct.present
          ? data.sugarLimitPct.value
          : this.sugarLimitPct,
      saturatedLimitPct: data.saturatedLimitPct.present
          ? data.saturatedLimitPct.value
          : this.saturatedLimitPct,
      saltLimitMg: data.saltLimitMg.present
          ? data.saltLimitMg.value
          : this.saltLimitMg,
      burnedKcal: data.burnedKcal.present
          ? data.burnedKcal.value
          : this.burnedKcal,
      adjustedKcal: data.adjustedKcal.present
          ? data.adjustedKcal.value
          : this.adjustedKcal,
      sugarLimitG: data.sugarLimitG.present
          ? data.sugarLimitG.value
          : this.sugarLimitG,
      saturatedLimitG: data.saturatedLimitG.present
          ? data.saturatedLimitG.value
          : this.saturatedLimitG,
      kcal: data.kcal.present ? data.kcal.value : this.kcal,
      proteinG: data.proteinG.present ? data.proteinG.value : this.proteinG,
      carbsG: data.carbsG.present ? data.carbsG.value : this.carbsG,
      sugarsG: data.sugarsG.present ? data.sugarsG.value : this.sugarsG,
      fatG: data.fatG.present ? data.fatG.value : this.fatG,
      saturatedG: data.saturatedG.present
          ? data.saturatedG.value
          : this.saturatedG,
      fiberG: data.fiberG.present ? data.fiberG.value : this.fiberG,
      saltMg: data.saltMg.present ? data.saltMg.value : this.saltMg,
      sex: data.sex.present ? data.sex.value : this.sex,
      age: data.age.present ? data.age.value : this.age,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DayLogRow(')
          ..write('id: $id, ')
          ..write('day: $day, ')
          ..write('dailyKcal: $dailyKcal, ')
          ..write('proteinGoalG: $proteinGoalG, ')
          ..write('fiberGoalG: $fiberGoalG, ')
          ..write('sugarLimitPct: $sugarLimitPct, ')
          ..write('saturatedLimitPct: $saturatedLimitPct, ')
          ..write('saltLimitMg: $saltLimitMg, ')
          ..write('burnedKcal: $burnedKcal, ')
          ..write('adjustedKcal: $adjustedKcal, ')
          ..write('sugarLimitG: $sugarLimitG, ')
          ..write('saturatedLimitG: $saturatedLimitG, ')
          ..write('kcal: $kcal, ')
          ..write('proteinG: $proteinG, ')
          ..write('carbsG: $carbsG, ')
          ..write('sugarsG: $sugarsG, ')
          ..write('fatG: $fatG, ')
          ..write('saturatedG: $saturatedG, ')
          ..write('fiberG: $fiberG, ')
          ..write('saltMg: $saltMg, ')
          ..write('sex: $sex, ')
          ..write('age: $age')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    day,
    dailyKcal,
    proteinGoalG,
    fiberGoalG,
    sugarLimitPct,
    saturatedLimitPct,
    saltLimitMg,
    burnedKcal,
    adjustedKcal,
    sugarLimitG,
    saturatedLimitG,
    kcal,
    proteinG,
    carbsG,
    sugarsG,
    fatG,
    saturatedG,
    fiberG,
    saltMg,
    sex,
    age,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DayLogRow &&
          other.id == this.id &&
          other.day == this.day &&
          other.dailyKcal == this.dailyKcal &&
          other.proteinGoalG == this.proteinGoalG &&
          other.fiberGoalG == this.fiberGoalG &&
          other.sugarLimitPct == this.sugarLimitPct &&
          other.saturatedLimitPct == this.saturatedLimitPct &&
          other.saltLimitMg == this.saltLimitMg &&
          other.burnedKcal == this.burnedKcal &&
          other.adjustedKcal == this.adjustedKcal &&
          other.sugarLimitG == this.sugarLimitG &&
          other.saturatedLimitG == this.saturatedLimitG &&
          other.kcal == this.kcal &&
          other.proteinG == this.proteinG &&
          other.carbsG == this.carbsG &&
          other.sugarsG == this.sugarsG &&
          other.fatG == this.fatG &&
          other.saturatedG == this.saturatedG &&
          other.fiberG == this.fiberG &&
          other.saltMg == this.saltMg &&
          other.sex == this.sex &&
          other.age == this.age);
}

class DayLogsTableCompanion extends UpdateCompanion<DayLogRow> {
  final Value<int> id;
  final Value<String> day;
  final Value<double> dailyKcal;
  final Value<double> proteinGoalG;
  final Value<double> fiberGoalG;
  final Value<double> sugarLimitPct;
  final Value<double> saturatedLimitPct;
  final Value<double> saltLimitMg;
  final Value<double> burnedKcal;
  final Value<double> adjustedKcal;
  final Value<double> sugarLimitG;
  final Value<double> saturatedLimitG;
  final Value<double> kcal;
  final Value<double> proteinG;
  final Value<double> carbsG;
  final Value<double> sugarsG;
  final Value<double> fatG;
  final Value<double> saturatedG;
  final Value<double> fiberG;
  final Value<double> saltMg;
  final Value<String?> sex;
  final Value<int?> age;
  const DayLogsTableCompanion({
    this.id = const Value.absent(),
    this.day = const Value.absent(),
    this.dailyKcal = const Value.absent(),
    this.proteinGoalG = const Value.absent(),
    this.fiberGoalG = const Value.absent(),
    this.sugarLimitPct = const Value.absent(),
    this.saturatedLimitPct = const Value.absent(),
    this.saltLimitMg = const Value.absent(),
    this.burnedKcal = const Value.absent(),
    this.adjustedKcal = const Value.absent(),
    this.sugarLimitG = const Value.absent(),
    this.saturatedLimitG = const Value.absent(),
    this.kcal = const Value.absent(),
    this.proteinG = const Value.absent(),
    this.carbsG = const Value.absent(),
    this.sugarsG = const Value.absent(),
    this.fatG = const Value.absent(),
    this.saturatedG = const Value.absent(),
    this.fiberG = const Value.absent(),
    this.saltMg = const Value.absent(),
    this.sex = const Value.absent(),
    this.age = const Value.absent(),
  });
  DayLogsTableCompanion.insert({
    this.id = const Value.absent(),
    required String day,
    required double dailyKcal,
    required double proteinGoalG,
    required double fiberGoalG,
    required double sugarLimitPct,
    required double saturatedLimitPct,
    required double saltLimitMg,
    required double burnedKcal,
    required double adjustedKcal,
    required double sugarLimitG,
    required double saturatedLimitG,
    required double kcal,
    required double proteinG,
    required double carbsG,
    required double sugarsG,
    required double fatG,
    required double saturatedG,
    required double fiberG,
    required double saltMg,
    this.sex = const Value.absent(),
    this.age = const Value.absent(),
  }) : day = Value(day),
       dailyKcal = Value(dailyKcal),
       proteinGoalG = Value(proteinGoalG),
       fiberGoalG = Value(fiberGoalG),
       sugarLimitPct = Value(sugarLimitPct),
       saturatedLimitPct = Value(saturatedLimitPct),
       saltLimitMg = Value(saltLimitMg),
       burnedKcal = Value(burnedKcal),
       adjustedKcal = Value(adjustedKcal),
       sugarLimitG = Value(sugarLimitG),
       saturatedLimitG = Value(saturatedLimitG),
       kcal = Value(kcal),
       proteinG = Value(proteinG),
       carbsG = Value(carbsG),
       sugarsG = Value(sugarsG),
       fatG = Value(fatG),
       saturatedG = Value(saturatedG),
       fiberG = Value(fiberG),
       saltMg = Value(saltMg);
  static Insertable<DayLogRow> custom({
    Expression<int>? id,
    Expression<String>? day,
    Expression<double>? dailyKcal,
    Expression<double>? proteinGoalG,
    Expression<double>? fiberGoalG,
    Expression<double>? sugarLimitPct,
    Expression<double>? saturatedLimitPct,
    Expression<double>? saltLimitMg,
    Expression<double>? burnedKcal,
    Expression<double>? adjustedKcal,
    Expression<double>? sugarLimitG,
    Expression<double>? saturatedLimitG,
    Expression<double>? kcal,
    Expression<double>? proteinG,
    Expression<double>? carbsG,
    Expression<double>? sugarsG,
    Expression<double>? fatG,
    Expression<double>? saturatedG,
    Expression<double>? fiberG,
    Expression<double>? saltMg,
    Expression<String>? sex,
    Expression<int>? age,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (day != null) 'day': day,
      if (dailyKcal != null) 'daily_kcal': dailyKcal,
      if (proteinGoalG != null) 'protein_goal_g': proteinGoalG,
      if (fiberGoalG != null) 'fiber_goal_g': fiberGoalG,
      if (sugarLimitPct != null) 'sugar_limit_pct': sugarLimitPct,
      if (saturatedLimitPct != null) 'saturated_limit_pct': saturatedLimitPct,
      if (saltLimitMg != null) 'salt_limit_mg': saltLimitMg,
      if (burnedKcal != null) 'burned_kcal': burnedKcal,
      if (adjustedKcal != null) 'adjusted_kcal': adjustedKcal,
      if (sugarLimitG != null) 'sugar_limit_g': sugarLimitG,
      if (saturatedLimitG != null) 'saturated_limit_g': saturatedLimitG,
      if (kcal != null) 'kcal': kcal,
      if (proteinG != null) 'protein_g': proteinG,
      if (carbsG != null) 'carbs_g': carbsG,
      if (sugarsG != null) 'sugars_g': sugarsG,
      if (fatG != null) 'fat_g': fatG,
      if (saturatedG != null) 'saturated_g': saturatedG,
      if (fiberG != null) 'fiber_g': fiberG,
      if (saltMg != null) 'salt_mg': saltMg,
      if (sex != null) 'sex': sex,
      if (age != null) 'age': age,
    });
  }

  DayLogsTableCompanion copyWith({
    Value<int>? id,
    Value<String>? day,
    Value<double>? dailyKcal,
    Value<double>? proteinGoalG,
    Value<double>? fiberGoalG,
    Value<double>? sugarLimitPct,
    Value<double>? saturatedLimitPct,
    Value<double>? saltLimitMg,
    Value<double>? burnedKcal,
    Value<double>? adjustedKcal,
    Value<double>? sugarLimitG,
    Value<double>? saturatedLimitG,
    Value<double>? kcal,
    Value<double>? proteinG,
    Value<double>? carbsG,
    Value<double>? sugarsG,
    Value<double>? fatG,
    Value<double>? saturatedG,
    Value<double>? fiberG,
    Value<double>? saltMg,
    Value<String?>? sex,
    Value<int?>? age,
  }) {
    return DayLogsTableCompanion(
      id: id ?? this.id,
      day: day ?? this.day,
      dailyKcal: dailyKcal ?? this.dailyKcal,
      proteinGoalG: proteinGoalG ?? this.proteinGoalG,
      fiberGoalG: fiberGoalG ?? this.fiberGoalG,
      sugarLimitPct: sugarLimitPct ?? this.sugarLimitPct,
      saturatedLimitPct: saturatedLimitPct ?? this.saturatedLimitPct,
      saltLimitMg: saltLimitMg ?? this.saltLimitMg,
      burnedKcal: burnedKcal ?? this.burnedKcal,
      adjustedKcal: adjustedKcal ?? this.adjustedKcal,
      sugarLimitG: sugarLimitG ?? this.sugarLimitG,
      saturatedLimitG: saturatedLimitG ?? this.saturatedLimitG,
      kcal: kcal ?? this.kcal,
      proteinG: proteinG ?? this.proteinG,
      carbsG: carbsG ?? this.carbsG,
      sugarsG: sugarsG ?? this.sugarsG,
      fatG: fatG ?? this.fatG,
      saturatedG: saturatedG ?? this.saturatedG,
      fiberG: fiberG ?? this.fiberG,
      saltMg: saltMg ?? this.saltMg,
      sex: sex ?? this.sex,
      age: age ?? this.age,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (day.present) {
      map['day'] = Variable<String>(day.value);
    }
    if (dailyKcal.present) {
      map['daily_kcal'] = Variable<double>(dailyKcal.value);
    }
    if (proteinGoalG.present) {
      map['protein_goal_g'] = Variable<double>(proteinGoalG.value);
    }
    if (fiberGoalG.present) {
      map['fiber_goal_g'] = Variable<double>(fiberGoalG.value);
    }
    if (sugarLimitPct.present) {
      map['sugar_limit_pct'] = Variable<double>(sugarLimitPct.value);
    }
    if (saturatedLimitPct.present) {
      map['saturated_limit_pct'] = Variable<double>(saturatedLimitPct.value);
    }
    if (saltLimitMg.present) {
      map['salt_limit_mg'] = Variable<double>(saltLimitMg.value);
    }
    if (burnedKcal.present) {
      map['burned_kcal'] = Variable<double>(burnedKcal.value);
    }
    if (adjustedKcal.present) {
      map['adjusted_kcal'] = Variable<double>(adjustedKcal.value);
    }
    if (sugarLimitG.present) {
      map['sugar_limit_g'] = Variable<double>(sugarLimitG.value);
    }
    if (saturatedLimitG.present) {
      map['saturated_limit_g'] = Variable<double>(saturatedLimitG.value);
    }
    if (kcal.present) {
      map['kcal'] = Variable<double>(kcal.value);
    }
    if (proteinG.present) {
      map['protein_g'] = Variable<double>(proteinG.value);
    }
    if (carbsG.present) {
      map['carbs_g'] = Variable<double>(carbsG.value);
    }
    if (sugarsG.present) {
      map['sugars_g'] = Variable<double>(sugarsG.value);
    }
    if (fatG.present) {
      map['fat_g'] = Variable<double>(fatG.value);
    }
    if (saturatedG.present) {
      map['saturated_g'] = Variable<double>(saturatedG.value);
    }
    if (fiberG.present) {
      map['fiber_g'] = Variable<double>(fiberG.value);
    }
    if (saltMg.present) {
      map['salt_mg'] = Variable<double>(saltMg.value);
    }
    if (sex.present) {
      map['sex'] = Variable<String>(sex.value);
    }
    if (age.present) {
      map['age'] = Variable<int>(age.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DayLogsTableCompanion(')
          ..write('id: $id, ')
          ..write('day: $day, ')
          ..write('dailyKcal: $dailyKcal, ')
          ..write('proteinGoalG: $proteinGoalG, ')
          ..write('fiberGoalG: $fiberGoalG, ')
          ..write('sugarLimitPct: $sugarLimitPct, ')
          ..write('saturatedLimitPct: $saturatedLimitPct, ')
          ..write('saltLimitMg: $saltLimitMg, ')
          ..write('burnedKcal: $burnedKcal, ')
          ..write('adjustedKcal: $adjustedKcal, ')
          ..write('sugarLimitG: $sugarLimitG, ')
          ..write('saturatedLimitG: $saturatedLimitG, ')
          ..write('kcal: $kcal, ')
          ..write('proteinG: $proteinG, ')
          ..write('carbsG: $carbsG, ')
          ..write('sugarsG: $sugarsG, ')
          ..write('fatG: $fatG, ')
          ..write('saturatedG: $saturatedG, ')
          ..write('fiberG: $fiberG, ')
          ..write('saltMg: $saltMg, ')
          ..write('sex: $sex, ')
          ..write('age: $age')
          ..write(')'))
        .toString();
  }
}

class $RecipesTableTable extends RecipesTable
    with TableInfo<$RecipesTableTable, RecipeRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecipesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _finalWeightGMeta = const VerificationMeta(
    'finalWeightG',
  );
  @override
  late final GeneratedColumn<int> finalWeightG = GeneratedColumn<int>(
    'final_weight_g',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, finalWeightG];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'recipes';
  @override
  VerificationContext validateIntegrity(
    Insertable<RecipeRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('final_weight_g')) {
      context.handle(
        _finalWeightGMeta,
        finalWeightG.isAcceptableOrUnknown(
          data['final_weight_g']!,
          _finalWeightGMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RecipeRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RecipeRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      finalWeightG: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}final_weight_g'],
      ),
    );
  }

  @override
  $RecipesTableTable createAlias(String alias) {
    return $RecipesTableTable(attachedDatabase, alias);
  }
}

class RecipeRow extends DataClass implements Insertable<RecipeRow> {
  final int id;
  final String name;
  final int? finalWeightG;
  const RecipeRow({required this.id, required this.name, this.finalWeightG});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || finalWeightG != null) {
      map['final_weight_g'] = Variable<int>(finalWeightG);
    }
    return map;
  }

  RecipesTableCompanion toCompanion(bool nullToAbsent) {
    return RecipesTableCompanion(
      id: Value(id),
      name: Value(name),
      finalWeightG: finalWeightG == null && nullToAbsent
          ? const Value.absent()
          : Value(finalWeightG),
    );
  }

  factory RecipeRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RecipeRow(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      finalWeightG: serializer.fromJson<int?>(json['finalWeightG']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'finalWeightG': serializer.toJson<int?>(finalWeightG),
    };
  }

  RecipeRow copyWith({
    int? id,
    String? name,
    Value<int?> finalWeightG = const Value.absent(),
  }) => RecipeRow(
    id: id ?? this.id,
    name: name ?? this.name,
    finalWeightG: finalWeightG.present ? finalWeightG.value : this.finalWeightG,
  );
  RecipeRow copyWithCompanion(RecipesTableCompanion data) {
    return RecipeRow(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      finalWeightG: data.finalWeightG.present
          ? data.finalWeightG.value
          : this.finalWeightG,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RecipeRow(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('finalWeightG: $finalWeightG')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, finalWeightG);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecipeRow &&
          other.id == this.id &&
          other.name == this.name &&
          other.finalWeightG == this.finalWeightG);
}

class RecipesTableCompanion extends UpdateCompanion<RecipeRow> {
  final Value<int> id;
  final Value<String> name;
  final Value<int?> finalWeightG;
  const RecipesTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.finalWeightG = const Value.absent(),
  });
  RecipesTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.finalWeightG = const Value.absent(),
  }) : name = Value(name);
  static Insertable<RecipeRow> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? finalWeightG,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (finalWeightG != null) 'final_weight_g': finalWeightG,
    });
  }

  RecipesTableCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<int?>? finalWeightG,
  }) {
    return RecipesTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      finalWeightG: finalWeightG ?? this.finalWeightG,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (finalWeightG.present) {
      map['final_weight_g'] = Variable<int>(finalWeightG.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecipesTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('finalWeightG: $finalWeightG')
          ..write(')'))
        .toString();
  }
}

class $RecipeIngredientsTableTable extends RecipeIngredientsTable
    with TableInfo<$RecipeIngredientsTableTable, RecipeIngredientRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecipeIngredientsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _recipeIdMeta = const VerificationMeta(
    'recipeId',
  );
  @override
  late final GeneratedColumn<int> recipeId = GeneratedColumn<int>(
    'recipe_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES recipes (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _ingredientIdMeta = const VerificationMeta(
    'ingredientId',
  );
  @override
  late final GeneratedColumn<int> ingredientId = GeneratedColumn<int>(
    'ingredient_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES ingredients (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _gramsMeta = const VerificationMeta('grams');
  @override
  late final GeneratedColumn<int> grams = GeneratedColumn<int>(
    'grams',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, recipeId, ingredientId, grams];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'recipe_ingredients';
  @override
  VerificationContext validateIntegrity(
    Insertable<RecipeIngredientRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('recipe_id')) {
      context.handle(
        _recipeIdMeta,
        recipeId.isAcceptableOrUnknown(data['recipe_id']!, _recipeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_recipeIdMeta);
    }
    if (data.containsKey('ingredient_id')) {
      context.handle(
        _ingredientIdMeta,
        ingredientId.isAcceptableOrUnknown(
          data['ingredient_id']!,
          _ingredientIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_ingredientIdMeta);
    }
    if (data.containsKey('grams')) {
      context.handle(
        _gramsMeta,
        grams.isAcceptableOrUnknown(data['grams']!, _gramsMeta),
      );
    } else if (isInserting) {
      context.missing(_gramsMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {recipeId, ingredientId},
  ];
  @override
  RecipeIngredientRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RecipeIngredientRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      recipeId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}recipe_id'],
      )!,
      ingredientId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}ingredient_id'],
      )!,
      grams: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}grams'],
      )!,
    );
  }

  @override
  $RecipeIngredientsTableTable createAlias(String alias) {
    return $RecipeIngredientsTableTable(attachedDatabase, alias);
  }
}

class RecipeIngredientRow extends DataClass
    implements Insertable<RecipeIngredientRow> {
  final int id;
  final int recipeId;
  final int ingredientId;
  final int grams;
  const RecipeIngredientRow({
    required this.id,
    required this.recipeId,
    required this.ingredientId,
    required this.grams,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['recipe_id'] = Variable<int>(recipeId);
    map['ingredient_id'] = Variable<int>(ingredientId);
    map['grams'] = Variable<int>(grams);
    return map;
  }

  RecipeIngredientsTableCompanion toCompanion(bool nullToAbsent) {
    return RecipeIngredientsTableCompanion(
      id: Value(id),
      recipeId: Value(recipeId),
      ingredientId: Value(ingredientId),
      grams: Value(grams),
    );
  }

  factory RecipeIngredientRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RecipeIngredientRow(
      id: serializer.fromJson<int>(json['id']),
      recipeId: serializer.fromJson<int>(json['recipeId']),
      ingredientId: serializer.fromJson<int>(json['ingredientId']),
      grams: serializer.fromJson<int>(json['grams']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'recipeId': serializer.toJson<int>(recipeId),
      'ingredientId': serializer.toJson<int>(ingredientId),
      'grams': serializer.toJson<int>(grams),
    };
  }

  RecipeIngredientRow copyWith({
    int? id,
    int? recipeId,
    int? ingredientId,
    int? grams,
  }) => RecipeIngredientRow(
    id: id ?? this.id,
    recipeId: recipeId ?? this.recipeId,
    ingredientId: ingredientId ?? this.ingredientId,
    grams: grams ?? this.grams,
  );
  RecipeIngredientRow copyWithCompanion(RecipeIngredientsTableCompanion data) {
    return RecipeIngredientRow(
      id: data.id.present ? data.id.value : this.id,
      recipeId: data.recipeId.present ? data.recipeId.value : this.recipeId,
      ingredientId: data.ingredientId.present
          ? data.ingredientId.value
          : this.ingredientId,
      grams: data.grams.present ? data.grams.value : this.grams,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RecipeIngredientRow(')
          ..write('id: $id, ')
          ..write('recipeId: $recipeId, ')
          ..write('ingredientId: $ingredientId, ')
          ..write('grams: $grams')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, recipeId, ingredientId, grams);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecipeIngredientRow &&
          other.id == this.id &&
          other.recipeId == this.recipeId &&
          other.ingredientId == this.ingredientId &&
          other.grams == this.grams);
}

class RecipeIngredientsTableCompanion
    extends UpdateCompanion<RecipeIngredientRow> {
  final Value<int> id;
  final Value<int> recipeId;
  final Value<int> ingredientId;
  final Value<int> grams;
  const RecipeIngredientsTableCompanion({
    this.id = const Value.absent(),
    this.recipeId = const Value.absent(),
    this.ingredientId = const Value.absent(),
    this.grams = const Value.absent(),
  });
  RecipeIngredientsTableCompanion.insert({
    this.id = const Value.absent(),
    required int recipeId,
    required int ingredientId,
    required int grams,
  }) : recipeId = Value(recipeId),
       ingredientId = Value(ingredientId),
       grams = Value(grams);
  static Insertable<RecipeIngredientRow> custom({
    Expression<int>? id,
    Expression<int>? recipeId,
    Expression<int>? ingredientId,
    Expression<int>? grams,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (recipeId != null) 'recipe_id': recipeId,
      if (ingredientId != null) 'ingredient_id': ingredientId,
      if (grams != null) 'grams': grams,
    });
  }

  RecipeIngredientsTableCompanion copyWith({
    Value<int>? id,
    Value<int>? recipeId,
    Value<int>? ingredientId,
    Value<int>? grams,
  }) {
    return RecipeIngredientsTableCompanion(
      id: id ?? this.id,
      recipeId: recipeId ?? this.recipeId,
      ingredientId: ingredientId ?? this.ingredientId,
      grams: grams ?? this.grams,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (recipeId.present) {
      map['recipe_id'] = Variable<int>(recipeId.value);
    }
    if (ingredientId.present) {
      map['ingredient_id'] = Variable<int>(ingredientId.value);
    }
    if (grams.present) {
      map['grams'] = Variable<int>(grams.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecipeIngredientsTableCompanion(')
          ..write('id: $id, ')
          ..write('recipeId: $recipeId, ')
          ..write('ingredientId: $ingredientId, ')
          ..write('grams: $grams')
          ..write(')'))
        .toString();
  }
}

class $RecipeEntriesTableTable extends RecipeEntriesTable
    with TableInfo<$RecipeEntriesTableTable, RecipeEntryRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecipeEntriesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _recipeIdMeta = const VerificationMeta(
    'recipeId',
  );
  @override
  late final GeneratedColumn<int> recipeId = GeneratedColumn<int>(
    'recipe_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'UNIQUE REFERENCES recipes (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _gramsMeta = const VerificationMeta('grams');
  @override
  late final GeneratedColumn<int> grams = GeneratedColumn<int>(
    'grams',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, recipeId, grams];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'recipe_entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<RecipeEntryRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('recipe_id')) {
      context.handle(
        _recipeIdMeta,
        recipeId.isAcceptableOrUnknown(data['recipe_id']!, _recipeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_recipeIdMeta);
    }
    if (data.containsKey('grams')) {
      context.handle(
        _gramsMeta,
        grams.isAcceptableOrUnknown(data['grams']!, _gramsMeta),
      );
    } else if (isInserting) {
      context.missing(_gramsMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RecipeEntryRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RecipeEntryRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      recipeId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}recipe_id'],
      )!,
      grams: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}grams'],
      )!,
    );
  }

  @override
  $RecipeEntriesTableTable createAlias(String alias) {
    return $RecipeEntriesTableTable(attachedDatabase, alias);
  }
}

class RecipeEntryRow extends DataClass implements Insertable<RecipeEntryRow> {
  final int id;
  final int recipeId;
  final int grams;
  const RecipeEntryRow({
    required this.id,
    required this.recipeId,
    required this.grams,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['recipe_id'] = Variable<int>(recipeId);
    map['grams'] = Variable<int>(grams);
    return map;
  }

  RecipeEntriesTableCompanion toCompanion(bool nullToAbsent) {
    return RecipeEntriesTableCompanion(
      id: Value(id),
      recipeId: Value(recipeId),
      grams: Value(grams),
    );
  }

  factory RecipeEntryRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RecipeEntryRow(
      id: serializer.fromJson<int>(json['id']),
      recipeId: serializer.fromJson<int>(json['recipeId']),
      grams: serializer.fromJson<int>(json['grams']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'recipeId': serializer.toJson<int>(recipeId),
      'grams': serializer.toJson<int>(grams),
    };
  }

  RecipeEntryRow copyWith({int? id, int? recipeId, int? grams}) =>
      RecipeEntryRow(
        id: id ?? this.id,
        recipeId: recipeId ?? this.recipeId,
        grams: grams ?? this.grams,
      );
  RecipeEntryRow copyWithCompanion(RecipeEntriesTableCompanion data) {
    return RecipeEntryRow(
      id: data.id.present ? data.id.value : this.id,
      recipeId: data.recipeId.present ? data.recipeId.value : this.recipeId,
      grams: data.grams.present ? data.grams.value : this.grams,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RecipeEntryRow(')
          ..write('id: $id, ')
          ..write('recipeId: $recipeId, ')
          ..write('grams: $grams')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, recipeId, grams);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecipeEntryRow &&
          other.id == this.id &&
          other.recipeId == this.recipeId &&
          other.grams == this.grams);
}

class RecipeEntriesTableCompanion extends UpdateCompanion<RecipeEntryRow> {
  final Value<int> id;
  final Value<int> recipeId;
  final Value<int> grams;
  const RecipeEntriesTableCompanion({
    this.id = const Value.absent(),
    this.recipeId = const Value.absent(),
    this.grams = const Value.absent(),
  });
  RecipeEntriesTableCompanion.insert({
    this.id = const Value.absent(),
    required int recipeId,
    required int grams,
  }) : recipeId = Value(recipeId),
       grams = Value(grams);
  static Insertable<RecipeEntryRow> custom({
    Expression<int>? id,
    Expression<int>? recipeId,
    Expression<int>? grams,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (recipeId != null) 'recipe_id': recipeId,
      if (grams != null) 'grams': grams,
    });
  }

  RecipeEntriesTableCompanion copyWith({
    Value<int>? id,
    Value<int>? recipeId,
    Value<int>? grams,
  }) {
    return RecipeEntriesTableCompanion(
      id: id ?? this.id,
      recipeId: recipeId ?? this.recipeId,
      grams: grams ?? this.grams,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (recipeId.present) {
      map['recipe_id'] = Variable<int>(recipeId.value);
    }
    if (grams.present) {
      map['grams'] = Variable<int>(grams.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecipeEntriesTableCompanion(')
          ..write('id: $id, ')
          ..write('recipeId: $recipeId, ')
          ..write('grams: $grams')
          ..write(')'))
        .toString();
  }
}

class $IngredientMicronutrientsTableTable extends IngredientMicronutrientsTable
    with
        TableInfo<
          $IngredientMicronutrientsTableTable,
          IngredientMicronutrientRow
        > {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $IngredientMicronutrientsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _ingredientIdMeta = const VerificationMeta(
    'ingredientId',
  );
  @override
  late final GeneratedColumn<int> ingredientId = GeneratedColumn<int>(
    'ingredient_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES ingredients (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _nutrientMeta = const VerificationMeta(
    'nutrient',
  );
  @override
  late final GeneratedColumn<String> nutrient = GeneratedColumn<String>(
    'nutrient',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [ingredientId, nutrient, amount];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'ingredient_micronutrients';
  @override
  VerificationContext validateIntegrity(
    Insertable<IngredientMicronutrientRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('ingredient_id')) {
      context.handle(
        _ingredientIdMeta,
        ingredientId.isAcceptableOrUnknown(
          data['ingredient_id']!,
          _ingredientIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_ingredientIdMeta);
    }
    if (data.containsKey('nutrient')) {
      context.handle(
        _nutrientMeta,
        nutrient.isAcceptableOrUnknown(data['nutrient']!, _nutrientMeta),
      );
    } else if (isInserting) {
      context.missing(_nutrientMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {ingredientId, nutrient};
  @override
  IngredientMicronutrientRow map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return IngredientMicronutrientRow(
      ingredientId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}ingredient_id'],
      )!,
      nutrient: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nutrient'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}amount'],
      )!,
    );
  }

  @override
  $IngredientMicronutrientsTableTable createAlias(String alias) {
    return $IngredientMicronutrientsTableTable(attachedDatabase, alias);
  }
}

class IngredientMicronutrientRow extends DataClass
    implements Insertable<IngredientMicronutrientRow> {
  final int ingredientId;
  final String nutrient;
  final double amount;
  const IngredientMicronutrientRow({
    required this.ingredientId,
    required this.nutrient,
    required this.amount,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['ingredient_id'] = Variable<int>(ingredientId);
    map['nutrient'] = Variable<String>(nutrient);
    map['amount'] = Variable<double>(amount);
    return map;
  }

  IngredientMicronutrientsTableCompanion toCompanion(bool nullToAbsent) {
    return IngredientMicronutrientsTableCompanion(
      ingredientId: Value(ingredientId),
      nutrient: Value(nutrient),
      amount: Value(amount),
    );
  }

  factory IngredientMicronutrientRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return IngredientMicronutrientRow(
      ingredientId: serializer.fromJson<int>(json['ingredientId']),
      nutrient: serializer.fromJson<String>(json['nutrient']),
      amount: serializer.fromJson<double>(json['amount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'ingredientId': serializer.toJson<int>(ingredientId),
      'nutrient': serializer.toJson<String>(nutrient),
      'amount': serializer.toJson<double>(amount),
    };
  }

  IngredientMicronutrientRow copyWith({
    int? ingredientId,
    String? nutrient,
    double? amount,
  }) => IngredientMicronutrientRow(
    ingredientId: ingredientId ?? this.ingredientId,
    nutrient: nutrient ?? this.nutrient,
    amount: amount ?? this.amount,
  );
  IngredientMicronutrientRow copyWithCompanion(
    IngredientMicronutrientsTableCompanion data,
  ) {
    return IngredientMicronutrientRow(
      ingredientId: data.ingredientId.present
          ? data.ingredientId.value
          : this.ingredientId,
      nutrient: data.nutrient.present ? data.nutrient.value : this.nutrient,
      amount: data.amount.present ? data.amount.value : this.amount,
    );
  }

  @override
  String toString() {
    return (StringBuffer('IngredientMicronutrientRow(')
          ..write('ingredientId: $ingredientId, ')
          ..write('nutrient: $nutrient, ')
          ..write('amount: $amount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(ingredientId, nutrient, amount);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is IngredientMicronutrientRow &&
          other.ingredientId == this.ingredientId &&
          other.nutrient == this.nutrient &&
          other.amount == this.amount);
}

class IngredientMicronutrientsTableCompanion
    extends UpdateCompanion<IngredientMicronutrientRow> {
  final Value<int> ingredientId;
  final Value<String> nutrient;
  final Value<double> amount;
  final Value<int> rowid;
  const IngredientMicronutrientsTableCompanion({
    this.ingredientId = const Value.absent(),
    this.nutrient = const Value.absent(),
    this.amount = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  IngredientMicronutrientsTableCompanion.insert({
    required int ingredientId,
    required String nutrient,
    required double amount,
    this.rowid = const Value.absent(),
  }) : ingredientId = Value(ingredientId),
       nutrient = Value(nutrient),
       amount = Value(amount);
  static Insertable<IngredientMicronutrientRow> custom({
    Expression<int>? ingredientId,
    Expression<String>? nutrient,
    Expression<double>? amount,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (ingredientId != null) 'ingredient_id': ingredientId,
      if (nutrient != null) 'nutrient': nutrient,
      if (amount != null) 'amount': amount,
      if (rowid != null) 'rowid': rowid,
    });
  }

  IngredientMicronutrientsTableCompanion copyWith({
    Value<int>? ingredientId,
    Value<String>? nutrient,
    Value<double>? amount,
    Value<int>? rowid,
  }) {
    return IngredientMicronutrientsTableCompanion(
      ingredientId: ingredientId ?? this.ingredientId,
      nutrient: nutrient ?? this.nutrient,
      amount: amount ?? this.amount,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (ingredientId.present) {
      map['ingredient_id'] = Variable<int>(ingredientId.value);
    }
    if (nutrient.present) {
      map['nutrient'] = Variable<String>(nutrient.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('IngredientMicronutrientsTableCompanion(')
          ..write('ingredientId: $ingredientId, ')
          ..write('nutrient: $nutrient, ')
          ..write('amount: $amount, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SupplementsTableTable extends SupplementsTable
    with TableInfo<$SupplementsTableTable, SupplementRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SupplementsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _unitMeta = const VerificationMeta('unit');
  @override
  late final GeneratedColumn<String> unit = GeneratedColumn<String>(
    'unit',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, unit];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'supplements';
  @override
  VerificationContext validateIntegrity(
    Insertable<SupplementRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('unit')) {
      context.handle(
        _unitMeta,
        unit.isAcceptableOrUnknown(data['unit']!, _unitMeta),
      );
    } else if (isInserting) {
      context.missing(_unitMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SupplementRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SupplementRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      unit: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}unit'],
      )!,
    );
  }

  @override
  $SupplementsTableTable createAlias(String alias) {
    return $SupplementsTableTable(attachedDatabase, alias);
  }
}

class SupplementRow extends DataClass implements Insertable<SupplementRow> {
  final int id;
  final String name;
  final String unit;
  const SupplementRow({
    required this.id,
    required this.name,
    required this.unit,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['unit'] = Variable<String>(unit);
    return map;
  }

  SupplementsTableCompanion toCompanion(bool nullToAbsent) {
    return SupplementsTableCompanion(
      id: Value(id),
      name: Value(name),
      unit: Value(unit),
    );
  }

  factory SupplementRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SupplementRow(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      unit: serializer.fromJson<String>(json['unit']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'unit': serializer.toJson<String>(unit),
    };
  }

  SupplementRow copyWith({int? id, String? name, String? unit}) =>
      SupplementRow(
        id: id ?? this.id,
        name: name ?? this.name,
        unit: unit ?? this.unit,
      );
  SupplementRow copyWithCompanion(SupplementsTableCompanion data) {
    return SupplementRow(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      unit: data.unit.present ? data.unit.value : this.unit,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SupplementRow(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('unit: $unit')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, unit);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SupplementRow &&
          other.id == this.id &&
          other.name == this.name &&
          other.unit == this.unit);
}

class SupplementsTableCompanion extends UpdateCompanion<SupplementRow> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> unit;
  const SupplementsTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.unit = const Value.absent(),
  });
  SupplementsTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String unit,
  }) : name = Value(name),
       unit = Value(unit);
  static Insertable<SupplementRow> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? unit,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (unit != null) 'unit': unit,
    });
  }

  SupplementsTableCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? unit,
  }) {
    return SupplementsTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      unit: unit ?? this.unit,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (unit.present) {
      map['unit'] = Variable<String>(unit.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SupplementsTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('unit: $unit')
          ..write(')'))
        .toString();
  }
}

class $SupplementMicronutrientsTableTable extends SupplementMicronutrientsTable
    with
        TableInfo<
          $SupplementMicronutrientsTableTable,
          SupplementMicronutrientRow
        > {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SupplementMicronutrientsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _supplementIdMeta = const VerificationMeta(
    'supplementId',
  );
  @override
  late final GeneratedColumn<int> supplementId = GeneratedColumn<int>(
    'supplement_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES supplements (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _nutrientMeta = const VerificationMeta(
    'nutrient',
  );
  @override
  late final GeneratedColumn<String> nutrient = GeneratedColumn<String>(
    'nutrient',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [supplementId, nutrient, amount];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'supplement_micronutrients';
  @override
  VerificationContext validateIntegrity(
    Insertable<SupplementMicronutrientRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('supplement_id')) {
      context.handle(
        _supplementIdMeta,
        supplementId.isAcceptableOrUnknown(
          data['supplement_id']!,
          _supplementIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_supplementIdMeta);
    }
    if (data.containsKey('nutrient')) {
      context.handle(
        _nutrientMeta,
        nutrient.isAcceptableOrUnknown(data['nutrient']!, _nutrientMeta),
      );
    } else if (isInserting) {
      context.missing(_nutrientMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {supplementId, nutrient};
  @override
  SupplementMicronutrientRow map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SupplementMicronutrientRow(
      supplementId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}supplement_id'],
      )!,
      nutrient: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nutrient'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}amount'],
      )!,
    );
  }

  @override
  $SupplementMicronutrientsTableTable createAlias(String alias) {
    return $SupplementMicronutrientsTableTable(attachedDatabase, alias);
  }
}

class SupplementMicronutrientRow extends DataClass
    implements Insertable<SupplementMicronutrientRow> {
  final int supplementId;
  final String nutrient;
  final double amount;
  const SupplementMicronutrientRow({
    required this.supplementId,
    required this.nutrient,
    required this.amount,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['supplement_id'] = Variable<int>(supplementId);
    map['nutrient'] = Variable<String>(nutrient);
    map['amount'] = Variable<double>(amount);
    return map;
  }

  SupplementMicronutrientsTableCompanion toCompanion(bool nullToAbsent) {
    return SupplementMicronutrientsTableCompanion(
      supplementId: Value(supplementId),
      nutrient: Value(nutrient),
      amount: Value(amount),
    );
  }

  factory SupplementMicronutrientRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SupplementMicronutrientRow(
      supplementId: serializer.fromJson<int>(json['supplementId']),
      nutrient: serializer.fromJson<String>(json['nutrient']),
      amount: serializer.fromJson<double>(json['amount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'supplementId': serializer.toJson<int>(supplementId),
      'nutrient': serializer.toJson<String>(nutrient),
      'amount': serializer.toJson<double>(amount),
    };
  }

  SupplementMicronutrientRow copyWith({
    int? supplementId,
    String? nutrient,
    double? amount,
  }) => SupplementMicronutrientRow(
    supplementId: supplementId ?? this.supplementId,
    nutrient: nutrient ?? this.nutrient,
    amount: amount ?? this.amount,
  );
  SupplementMicronutrientRow copyWithCompanion(
    SupplementMicronutrientsTableCompanion data,
  ) {
    return SupplementMicronutrientRow(
      supplementId: data.supplementId.present
          ? data.supplementId.value
          : this.supplementId,
      nutrient: data.nutrient.present ? data.nutrient.value : this.nutrient,
      amount: data.amount.present ? data.amount.value : this.amount,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SupplementMicronutrientRow(')
          ..write('supplementId: $supplementId, ')
          ..write('nutrient: $nutrient, ')
          ..write('amount: $amount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(supplementId, nutrient, amount);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SupplementMicronutrientRow &&
          other.supplementId == this.supplementId &&
          other.nutrient == this.nutrient &&
          other.amount == this.amount);
}

class SupplementMicronutrientsTableCompanion
    extends UpdateCompanion<SupplementMicronutrientRow> {
  final Value<int> supplementId;
  final Value<String> nutrient;
  final Value<double> amount;
  final Value<int> rowid;
  const SupplementMicronutrientsTableCompanion({
    this.supplementId = const Value.absent(),
    this.nutrient = const Value.absent(),
    this.amount = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SupplementMicronutrientsTableCompanion.insert({
    required int supplementId,
    required String nutrient,
    required double amount,
    this.rowid = const Value.absent(),
  }) : supplementId = Value(supplementId),
       nutrient = Value(nutrient),
       amount = Value(amount);
  static Insertable<SupplementMicronutrientRow> custom({
    Expression<int>? supplementId,
    Expression<String>? nutrient,
    Expression<double>? amount,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (supplementId != null) 'supplement_id': supplementId,
      if (nutrient != null) 'nutrient': nutrient,
      if (amount != null) 'amount': amount,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SupplementMicronutrientsTableCompanion copyWith({
    Value<int>? supplementId,
    Value<String>? nutrient,
    Value<double>? amount,
    Value<int>? rowid,
  }) {
    return SupplementMicronutrientsTableCompanion(
      supplementId: supplementId ?? this.supplementId,
      nutrient: nutrient ?? this.nutrient,
      amount: amount ?? this.amount,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (supplementId.present) {
      map['supplement_id'] = Variable<int>(supplementId.value);
    }
    if (nutrient.present) {
      map['nutrient'] = Variable<String>(nutrient.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SupplementMicronutrientsTableCompanion(')
          ..write('supplementId: $supplementId, ')
          ..write('nutrient: $nutrient, ')
          ..write('amount: $amount, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SupplementEntriesTableTable extends SupplementEntriesTable
    with TableInfo<$SupplementEntriesTableTable, SupplementEntryRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SupplementEntriesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _supplementIdMeta = const VerificationMeta(
    'supplementId',
  );
  @override
  late final GeneratedColumn<int> supplementId = GeneratedColumn<int>(
    'supplement_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'UNIQUE REFERENCES supplements (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _unitsMeta = const VerificationMeta('units');
  @override
  late final GeneratedColumn<double> units = GeneratedColumn<double>(
    'units',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, supplementId, units];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'supplement_entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<SupplementEntryRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('supplement_id')) {
      context.handle(
        _supplementIdMeta,
        supplementId.isAcceptableOrUnknown(
          data['supplement_id']!,
          _supplementIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_supplementIdMeta);
    }
    if (data.containsKey('units')) {
      context.handle(
        _unitsMeta,
        units.isAcceptableOrUnknown(data['units']!, _unitsMeta),
      );
    } else if (isInserting) {
      context.missing(_unitsMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SupplementEntryRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SupplementEntryRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      supplementId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}supplement_id'],
      )!,
      units: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}units'],
      )!,
    );
  }

  @override
  $SupplementEntriesTableTable createAlias(String alias) {
    return $SupplementEntriesTableTable(attachedDatabase, alias);
  }
}

class SupplementEntryRow extends DataClass
    implements Insertable<SupplementEntryRow> {
  final int id;
  final int supplementId;
  final double units;
  const SupplementEntryRow({
    required this.id,
    required this.supplementId,
    required this.units,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['supplement_id'] = Variable<int>(supplementId);
    map['units'] = Variable<double>(units);
    return map;
  }

  SupplementEntriesTableCompanion toCompanion(bool nullToAbsent) {
    return SupplementEntriesTableCompanion(
      id: Value(id),
      supplementId: Value(supplementId),
      units: Value(units),
    );
  }

  factory SupplementEntryRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SupplementEntryRow(
      id: serializer.fromJson<int>(json['id']),
      supplementId: serializer.fromJson<int>(json['supplementId']),
      units: serializer.fromJson<double>(json['units']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'supplementId': serializer.toJson<int>(supplementId),
      'units': serializer.toJson<double>(units),
    };
  }

  SupplementEntryRow copyWith({int? id, int? supplementId, double? units}) =>
      SupplementEntryRow(
        id: id ?? this.id,
        supplementId: supplementId ?? this.supplementId,
        units: units ?? this.units,
      );
  SupplementEntryRow copyWithCompanion(SupplementEntriesTableCompanion data) {
    return SupplementEntryRow(
      id: data.id.present ? data.id.value : this.id,
      supplementId: data.supplementId.present
          ? data.supplementId.value
          : this.supplementId,
      units: data.units.present ? data.units.value : this.units,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SupplementEntryRow(')
          ..write('id: $id, ')
          ..write('supplementId: $supplementId, ')
          ..write('units: $units')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, supplementId, units);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SupplementEntryRow &&
          other.id == this.id &&
          other.supplementId == this.supplementId &&
          other.units == this.units);
}

class SupplementEntriesTableCompanion
    extends UpdateCompanion<SupplementEntryRow> {
  final Value<int> id;
  final Value<int> supplementId;
  final Value<double> units;
  const SupplementEntriesTableCompanion({
    this.id = const Value.absent(),
    this.supplementId = const Value.absent(),
    this.units = const Value.absent(),
  });
  SupplementEntriesTableCompanion.insert({
    this.id = const Value.absent(),
    required int supplementId,
    required double units,
  }) : supplementId = Value(supplementId),
       units = Value(units);
  static Insertable<SupplementEntryRow> custom({
    Expression<int>? id,
    Expression<int>? supplementId,
    Expression<double>? units,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (supplementId != null) 'supplement_id': supplementId,
      if (units != null) 'units': units,
    });
  }

  SupplementEntriesTableCompanion copyWith({
    Value<int>? id,
    Value<int>? supplementId,
    Value<double>? units,
  }) {
    return SupplementEntriesTableCompanion(
      id: id ?? this.id,
      supplementId: supplementId ?? this.supplementId,
      units: units ?? this.units,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (supplementId.present) {
      map['supplement_id'] = Variable<int>(supplementId.value);
    }
    if (units.present) {
      map['units'] = Variable<double>(units.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SupplementEntriesTableCompanion(')
          ..write('id: $id, ')
          ..write('supplementId: $supplementId, ')
          ..write('units: $units')
          ..write(')'))
        .toString();
  }
}

class $DayLogMicronutrientsTableTable extends DayLogMicronutrientsTable
    with TableInfo<$DayLogMicronutrientsTableTable, DayLogMicronutrientRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DayLogMicronutrientsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _dayLogIdMeta = const VerificationMeta(
    'dayLogId',
  );
  @override
  late final GeneratedColumn<int> dayLogId = GeneratedColumn<int>(
    'day_log_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES day_logs (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _nutrientMeta = const VerificationMeta(
    'nutrient',
  );
  @override
  late final GeneratedColumn<String> nutrient = GeneratedColumn<String>(
    'nutrient',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _foodAmountMeta = const VerificationMeta(
    'foodAmount',
  );
  @override
  late final GeneratedColumn<double> foodAmount = GeneratedColumn<double>(
    'food_amount',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _supplementAmountMeta = const VerificationMeta(
    'supplementAmount',
  );
  @override
  late final GeneratedColumn<double> supplementAmount = GeneratedColumn<double>(
    'supplement_amount',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _coverageMeta = const VerificationMeta(
    'coverage',
  );
  @override
  late final GeneratedColumn<double> coverage = GeneratedColumn<double>(
    'coverage',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    dayLogId,
    nutrient,
    foodAmount,
    supplementAmount,
    coverage,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'day_log_micronutrients';
  @override
  VerificationContext validateIntegrity(
    Insertable<DayLogMicronutrientRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('day_log_id')) {
      context.handle(
        _dayLogIdMeta,
        dayLogId.isAcceptableOrUnknown(data['day_log_id']!, _dayLogIdMeta),
      );
    } else if (isInserting) {
      context.missing(_dayLogIdMeta);
    }
    if (data.containsKey('nutrient')) {
      context.handle(
        _nutrientMeta,
        nutrient.isAcceptableOrUnknown(data['nutrient']!, _nutrientMeta),
      );
    } else if (isInserting) {
      context.missing(_nutrientMeta);
    }
    if (data.containsKey('food_amount')) {
      context.handle(
        _foodAmountMeta,
        foodAmount.isAcceptableOrUnknown(data['food_amount']!, _foodAmountMeta),
      );
    }
    if (data.containsKey('supplement_amount')) {
      context.handle(
        _supplementAmountMeta,
        supplementAmount.isAcceptableOrUnknown(
          data['supplement_amount']!,
          _supplementAmountMeta,
        ),
      );
    }
    if (data.containsKey('coverage')) {
      context.handle(
        _coverageMeta,
        coverage.isAcceptableOrUnknown(data['coverage']!, _coverageMeta),
      );
    } else if (isInserting) {
      context.missing(_coverageMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {dayLogId, nutrient};
  @override
  DayLogMicronutrientRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DayLogMicronutrientRow(
      dayLogId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}day_log_id'],
      )!,
      nutrient: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nutrient'],
      )!,
      foodAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}food_amount'],
      ),
      supplementAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}supplement_amount'],
      ),
      coverage: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}coverage'],
      )!,
    );
  }

  @override
  $DayLogMicronutrientsTableTable createAlias(String alias) {
    return $DayLogMicronutrientsTableTable(attachedDatabase, alias);
  }
}

class DayLogMicronutrientRow extends DataClass
    implements Insertable<DayLogMicronutrientRow> {
  final int dayLogId;
  final String nutrient;
  final double? foodAmount;
  final double? supplementAmount;
  final double coverage;
  const DayLogMicronutrientRow({
    required this.dayLogId,
    required this.nutrient,
    this.foodAmount,
    this.supplementAmount,
    required this.coverage,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['day_log_id'] = Variable<int>(dayLogId);
    map['nutrient'] = Variable<String>(nutrient);
    if (!nullToAbsent || foodAmount != null) {
      map['food_amount'] = Variable<double>(foodAmount);
    }
    if (!nullToAbsent || supplementAmount != null) {
      map['supplement_amount'] = Variable<double>(supplementAmount);
    }
    map['coverage'] = Variable<double>(coverage);
    return map;
  }

  DayLogMicronutrientsTableCompanion toCompanion(bool nullToAbsent) {
    return DayLogMicronutrientsTableCompanion(
      dayLogId: Value(dayLogId),
      nutrient: Value(nutrient),
      foodAmount: foodAmount == null && nullToAbsent
          ? const Value.absent()
          : Value(foodAmount),
      supplementAmount: supplementAmount == null && nullToAbsent
          ? const Value.absent()
          : Value(supplementAmount),
      coverage: Value(coverage),
    );
  }

  factory DayLogMicronutrientRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DayLogMicronutrientRow(
      dayLogId: serializer.fromJson<int>(json['dayLogId']),
      nutrient: serializer.fromJson<String>(json['nutrient']),
      foodAmount: serializer.fromJson<double?>(json['foodAmount']),
      supplementAmount: serializer.fromJson<double?>(json['supplementAmount']),
      coverage: serializer.fromJson<double>(json['coverage']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'dayLogId': serializer.toJson<int>(dayLogId),
      'nutrient': serializer.toJson<String>(nutrient),
      'foodAmount': serializer.toJson<double?>(foodAmount),
      'supplementAmount': serializer.toJson<double?>(supplementAmount),
      'coverage': serializer.toJson<double>(coverage),
    };
  }

  DayLogMicronutrientRow copyWith({
    int? dayLogId,
    String? nutrient,
    Value<double?> foodAmount = const Value.absent(),
    Value<double?> supplementAmount = const Value.absent(),
    double? coverage,
  }) => DayLogMicronutrientRow(
    dayLogId: dayLogId ?? this.dayLogId,
    nutrient: nutrient ?? this.nutrient,
    foodAmount: foodAmount.present ? foodAmount.value : this.foodAmount,
    supplementAmount: supplementAmount.present
        ? supplementAmount.value
        : this.supplementAmount,
    coverage: coverage ?? this.coverage,
  );
  DayLogMicronutrientRow copyWithCompanion(
    DayLogMicronutrientsTableCompanion data,
  ) {
    return DayLogMicronutrientRow(
      dayLogId: data.dayLogId.present ? data.dayLogId.value : this.dayLogId,
      nutrient: data.nutrient.present ? data.nutrient.value : this.nutrient,
      foodAmount: data.foodAmount.present
          ? data.foodAmount.value
          : this.foodAmount,
      supplementAmount: data.supplementAmount.present
          ? data.supplementAmount.value
          : this.supplementAmount,
      coverage: data.coverage.present ? data.coverage.value : this.coverage,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DayLogMicronutrientRow(')
          ..write('dayLogId: $dayLogId, ')
          ..write('nutrient: $nutrient, ')
          ..write('foodAmount: $foodAmount, ')
          ..write('supplementAmount: $supplementAmount, ')
          ..write('coverage: $coverage')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(dayLogId, nutrient, foodAmount, supplementAmount, coverage);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DayLogMicronutrientRow &&
          other.dayLogId == this.dayLogId &&
          other.nutrient == this.nutrient &&
          other.foodAmount == this.foodAmount &&
          other.supplementAmount == this.supplementAmount &&
          other.coverage == this.coverage);
}

class DayLogMicronutrientsTableCompanion
    extends UpdateCompanion<DayLogMicronutrientRow> {
  final Value<int> dayLogId;
  final Value<String> nutrient;
  final Value<double?> foodAmount;
  final Value<double?> supplementAmount;
  final Value<double> coverage;
  final Value<int> rowid;
  const DayLogMicronutrientsTableCompanion({
    this.dayLogId = const Value.absent(),
    this.nutrient = const Value.absent(),
    this.foodAmount = const Value.absent(),
    this.supplementAmount = const Value.absent(),
    this.coverage = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DayLogMicronutrientsTableCompanion.insert({
    required int dayLogId,
    required String nutrient,
    this.foodAmount = const Value.absent(),
    this.supplementAmount = const Value.absent(),
    required double coverage,
    this.rowid = const Value.absent(),
  }) : dayLogId = Value(dayLogId),
       nutrient = Value(nutrient),
       coverage = Value(coverage);
  static Insertable<DayLogMicronutrientRow> custom({
    Expression<int>? dayLogId,
    Expression<String>? nutrient,
    Expression<double>? foodAmount,
    Expression<double>? supplementAmount,
    Expression<double>? coverage,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (dayLogId != null) 'day_log_id': dayLogId,
      if (nutrient != null) 'nutrient': nutrient,
      if (foodAmount != null) 'food_amount': foodAmount,
      if (supplementAmount != null) 'supplement_amount': supplementAmount,
      if (coverage != null) 'coverage': coverage,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DayLogMicronutrientsTableCompanion copyWith({
    Value<int>? dayLogId,
    Value<String>? nutrient,
    Value<double?>? foodAmount,
    Value<double?>? supplementAmount,
    Value<double>? coverage,
    Value<int>? rowid,
  }) {
    return DayLogMicronutrientsTableCompanion(
      dayLogId: dayLogId ?? this.dayLogId,
      nutrient: nutrient ?? this.nutrient,
      foodAmount: foodAmount ?? this.foodAmount,
      supplementAmount: supplementAmount ?? this.supplementAmount,
      coverage: coverage ?? this.coverage,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (dayLogId.present) {
      map['day_log_id'] = Variable<int>(dayLogId.value);
    }
    if (nutrient.present) {
      map['nutrient'] = Variable<String>(nutrient.value);
    }
    if (foodAmount.present) {
      map['food_amount'] = Variable<double>(foodAmount.value);
    }
    if (supplementAmount.present) {
      map['supplement_amount'] = Variable<double>(supplementAmount.value);
    }
    if (coverage.present) {
      map['coverage'] = Variable<double>(coverage.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DayLogMicronutrientsTableCompanion(')
          ..write('dayLogId: $dayLogId, ')
          ..write('nutrient: $nutrient, ')
          ..write('foodAmount: $foodAmount, ')
          ..write('supplementAmount: $supplementAmount, ')
          ..write('coverage: $coverage, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $SettingsTable settings = $SettingsTable(this);
  late final $ProfileTableTable profileTable = $ProfileTableTable(this);
  late final $ActivitiesTableTable activitiesTable = $ActivitiesTableTable(
    this,
  );
  late final $ActivityEntriesTableTable activityEntriesTable =
      $ActivityEntriesTableTable(this);
  late final $IngredientsTableTable ingredientsTable = $IngredientsTableTable(
    this,
  );
  late final $FoodEntriesTableTable foodEntriesTable = $FoodEntriesTableTable(
    this,
  );
  late final $DayLogsTableTable dayLogsTable = $DayLogsTableTable(this);
  late final $RecipesTableTable recipesTable = $RecipesTableTable(this);
  late final $RecipeIngredientsTableTable recipeIngredientsTable =
      $RecipeIngredientsTableTable(this);
  late final $RecipeEntriesTableTable recipeEntriesTable =
      $RecipeEntriesTableTable(this);
  late final $IngredientMicronutrientsTableTable ingredientMicronutrientsTable =
      $IngredientMicronutrientsTableTable(this);
  late final $SupplementsTableTable supplementsTable = $SupplementsTableTable(
    this,
  );
  late final $SupplementMicronutrientsTableTable supplementMicronutrientsTable =
      $SupplementMicronutrientsTableTable(this);
  late final $SupplementEntriesTableTable supplementEntriesTable =
      $SupplementEntriesTableTable(this);
  late final $DayLogMicronutrientsTableTable dayLogMicronutrientsTable =
      $DayLogMicronutrientsTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    settings,
    profileTable,
    activitiesTable,
    activityEntriesTable,
    ingredientsTable,
    foodEntriesTable,
    dayLogsTable,
    recipesTable,
    recipeIngredientsTable,
    recipeEntriesTable,
    ingredientMicronutrientsTable,
    supplementsTable,
    supplementMicronutrientsTable,
    supplementEntriesTable,
    dayLogMicronutrientsTable,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'activities',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('activity_entries', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'ingredients',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('food_entries', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'recipes',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('recipe_ingredients', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'ingredients',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('recipe_ingredients', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'recipes',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('recipe_entries', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'ingredients',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [
        TableUpdate('ingredient_micronutrients', kind: UpdateKind.delete),
      ],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'supplements',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [
        TableUpdate('supplement_micronutrients', kind: UpdateKind.delete),
      ],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'supplements',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('supplement_entries', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'day_logs',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('day_log_micronutrients', kind: UpdateKind.delete)],
    ),
  ]);
  @override
  DriftDatabaseOptions get options =>
      const DriftDatabaseOptions(storeDateTimeAsText: true);
}

typedef $$SettingsTableCreateCompanionBuilder = SettingsCompanion Function({
  Value<int> id,
  Value<String?> localeCode,
  Value<bool> microcalEnabled,
});
typedef $$SettingsTableUpdateCompanionBuilder = SettingsCompanion Function({
  Value<int> id,
  Value<String?> localeCode,
  Value<bool> microcalEnabled,
});

class $$SettingsTableFilterComposer
    extends Composer<_$AppDatabase, $SettingsTable> {
  $$SettingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get localeCode => $composableBuilder(
    column: $table.localeCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get microcalEnabled => $composableBuilder(
    column: $table.microcalEnabled,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SettingsTableOrderingComposer
    extends Composer<_$AppDatabase, $SettingsTable> {
  $$SettingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get localeCode => $composableBuilder(
    column: $table.localeCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get microcalEnabled => $composableBuilder(
    column: $table.microcalEnabled,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SettingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SettingsTable> {
  $$SettingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get localeCode => $composableBuilder(
    column: $table.localeCode,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get microcalEnabled => $composableBuilder(
    column: $table.microcalEnabled,
    builder: (column) => column,
  );
}

class $$SettingsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SettingsTable,
          Setting,
          $$SettingsTableFilterComposer,
          $$SettingsTableOrderingComposer,
          $$SettingsTableAnnotationComposer,
          $$SettingsTableCreateCompanionBuilder,
          $$SettingsTableUpdateCompanionBuilder,
          (Setting, BaseReferences<_$AppDatabase, $SettingsTable, Setting>),
          Setting,
          PrefetchHooks Function()
        > {
  $$SettingsTableTableManager(_$AppDatabase db, $SettingsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SettingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SettingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SettingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> localeCode = const Value.absent(),
                Value<bool> microcalEnabled = const Value.absent(),
              }) => SettingsCompanion(
                id: id,
                localeCode: localeCode,
                microcalEnabled: microcalEnabled,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> localeCode = const Value.absent(),
                Value<bool> microcalEnabled = const Value.absent(),
              }) => SettingsCompanion.insert(
                id: id,
                localeCode: localeCode,
                microcalEnabled: microcalEnabled,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$SettingsTable, Setting>(table),
                  BaseReferences<_$AppDatabase, $SettingsTable, Setting>(
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

typedef $$SettingsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SettingsTable,
      Setting,
      $$SettingsTableFilterComposer,
      $$SettingsTableOrderingComposer,
      $$SettingsTableAnnotationComposer,
      $$SettingsTableCreateCompanionBuilder,
      $$SettingsTableUpdateCompanionBuilder,
      (Setting, BaseReferences<_$AppDatabase, $SettingsTable, Setting>),
      Setting,
      PrefetchHooks Function()
    >;
typedef $$ProfileTableTableCreateCompanionBuilder =
    ProfileTableCompanion Function({
      Value<int> id,
      required double dailyKcal,
      required double proteinG,
      required double fiberG,
      required double sugarLimitPct,
      required double saturatedLimitPct,
      required double saltLimitMg,
      required double weightKg,
      required double heightCm,
      Value<String?> sex,
      Value<int?> birthYear,
    });
typedef $$ProfileTableTableUpdateCompanionBuilder =
    ProfileTableCompanion Function({
      Value<int> id,
      Value<double> dailyKcal,
      Value<double> proteinG,
      Value<double> fiberG,
      Value<double> sugarLimitPct,
      Value<double> saturatedLimitPct,
      Value<double> saltLimitMg,
      Value<double> weightKg,
      Value<double> heightCm,
      Value<String?> sex,
      Value<int?> birthYear,
    });

class $$ProfileTableTableFilterComposer
    extends Composer<_$AppDatabase, $ProfileTableTable> {
  $$ProfileTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get dailyKcal => $composableBuilder(
    column: $table.dailyKcal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get proteinG => $composableBuilder(
    column: $table.proteinG,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get fiberG => $composableBuilder(
    column: $table.fiberG,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get sugarLimitPct => $composableBuilder(
    column: $table.sugarLimitPct,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get saturatedLimitPct => $composableBuilder(
    column: $table.saturatedLimitPct,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get saltLimitMg => $composableBuilder(
    column: $table.saltLimitMg,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get weightKg => $composableBuilder(
    column: $table.weightKg,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get heightCm => $composableBuilder(
    column: $table.heightCm,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sex => $composableBuilder(
    column: $table.sex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get birthYear => $composableBuilder(
    column: $table.birthYear,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ProfileTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ProfileTableTable> {
  $$ProfileTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get dailyKcal => $composableBuilder(
    column: $table.dailyKcal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get proteinG => $composableBuilder(
    column: $table.proteinG,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get fiberG => $composableBuilder(
    column: $table.fiberG,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get sugarLimitPct => $composableBuilder(
    column: $table.sugarLimitPct,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get saturatedLimitPct => $composableBuilder(
    column: $table.saturatedLimitPct,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get saltLimitMg => $composableBuilder(
    column: $table.saltLimitMg,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get weightKg => $composableBuilder(
    column: $table.weightKg,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get heightCm => $composableBuilder(
    column: $table.heightCm,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sex => $composableBuilder(
    column: $table.sex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get birthYear => $composableBuilder(
    column: $table.birthYear,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ProfileTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProfileTableTable> {
  $$ProfileTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get dailyKcal =>
      $composableBuilder(column: $table.dailyKcal, builder: (column) => column);

  GeneratedColumn<double> get proteinG =>
      $composableBuilder(column: $table.proteinG, builder: (column) => column);

  GeneratedColumn<double> get fiberG =>
      $composableBuilder(column: $table.fiberG, builder: (column) => column);

  GeneratedColumn<double> get sugarLimitPct => $composableBuilder(
    column: $table.sugarLimitPct,
    builder: (column) => column,
  );

  GeneratedColumn<double> get saturatedLimitPct => $composableBuilder(
    column: $table.saturatedLimitPct,
    builder: (column) => column,
  );

  GeneratedColumn<double> get saltLimitMg => $composableBuilder(
    column: $table.saltLimitMg,
    builder: (column) => column,
  );

  GeneratedColumn<double> get weightKg =>
      $composableBuilder(column: $table.weightKg, builder: (column) => column);

  GeneratedColumn<double> get heightCm =>
      $composableBuilder(column: $table.heightCm, builder: (column) => column);

  GeneratedColumn<String> get sex =>
      $composableBuilder(column: $table.sex, builder: (column) => column);

  GeneratedColumn<int> get birthYear =>
      $composableBuilder(column: $table.birthYear, builder: (column) => column);
}

class $$ProfileTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProfileTableTable,
          ProfileRow,
          $$ProfileTableTableFilterComposer,
          $$ProfileTableTableOrderingComposer,
          $$ProfileTableTableAnnotationComposer,
          $$ProfileTableTableCreateCompanionBuilder,
          $$ProfileTableTableUpdateCompanionBuilder,
          (
            ProfileRow,
            BaseReferences<_$AppDatabase, $ProfileTableTable, ProfileRow>,
          ),
          ProfileRow,
          PrefetchHooks Function()
        > {
  $$ProfileTableTableTableManager(_$AppDatabase db, $ProfileTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProfileTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProfileTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProfileTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<double> dailyKcal = const Value.absent(),
                Value<double> proteinG = const Value.absent(),
                Value<double> fiberG = const Value.absent(),
                Value<double> sugarLimitPct = const Value.absent(),
                Value<double> saturatedLimitPct = const Value.absent(),
                Value<double> saltLimitMg = const Value.absent(),
                Value<double> weightKg = const Value.absent(),
                Value<double> heightCm = const Value.absent(),
                Value<String?> sex = const Value.absent(),
                Value<int?> birthYear = const Value.absent(),
              }) => ProfileTableCompanion(
                id: id,
                dailyKcal: dailyKcal,
                proteinG: proteinG,
                fiberG: fiberG,
                sugarLimitPct: sugarLimitPct,
                saturatedLimitPct: saturatedLimitPct,
                saltLimitMg: saltLimitMg,
                weightKg: weightKg,
                heightCm: heightCm,
                sex: sex,
                birthYear: birthYear,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required double dailyKcal,
                required double proteinG,
                required double fiberG,
                required double sugarLimitPct,
                required double saturatedLimitPct,
                required double saltLimitMg,
                required double weightKg,
                required double heightCm,
                Value<String?> sex = const Value.absent(),
                Value<int?> birthYear = const Value.absent(),
              }) => ProfileTableCompanion.insert(
                id: id,
                dailyKcal: dailyKcal,
                proteinG: proteinG,
                fiberG: fiberG,
                sugarLimitPct: sugarLimitPct,
                saturatedLimitPct: saturatedLimitPct,
                saltLimitMg: saltLimitMg,
                weightKg: weightKg,
                heightCm: heightCm,
                sex: sex,
                birthYear: birthYear,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ProfileTableTable, ProfileRow>(table),
                  BaseReferences<_$AppDatabase, $ProfileTableTable, ProfileRow>(
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

typedef $$ProfileTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProfileTableTable,
      ProfileRow,
      $$ProfileTableTableFilterComposer,
      $$ProfileTableTableOrderingComposer,
      $$ProfileTableTableAnnotationComposer,
      $$ProfileTableTableCreateCompanionBuilder,
      $$ProfileTableTableUpdateCompanionBuilder,
      (
        ProfileRow,
        BaseReferences<_$AppDatabase, $ProfileTableTable, ProfileRow>,
      ),
      ProfileRow,
      PrefetchHooks Function()
    >;
typedef $$ActivitiesTableTableCreateCompanionBuilder =
    ActivitiesTableCompanion Function({
      Value<int> id,
      Value<String?> presetKey,
      required String name,
      required int kcalPerUnit,
      required String unitLabel,
      Value<bool> isDurationBased,
    });
typedef $$ActivitiesTableTableUpdateCompanionBuilder =
    ActivitiesTableCompanion Function({
      Value<int> id,
      Value<String?> presetKey,
      Value<String> name,
      Value<int> kcalPerUnit,
      Value<String> unitLabel,
      Value<bool> isDurationBased,
    });

final class $$ActivitiesTableTableReferences
    extends BaseReferences<_$AppDatabase, $ActivitiesTableTable, ActivityRow> {
  $$ActivitiesTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$ActivityEntriesTableTable, List<ActivityEntryRow>>
  _activityEntriesTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.activityEntriesTable,
        aliasName: 'activities__id__activity_entries__activity_id',
      );

  $$ActivityEntriesTableTableProcessedTableManager
  get activityEntriesTableRefs {
    final manager = $$ActivityEntriesTableTableTableManager(
      $_db,
      $_db.activityEntriesTable,
    ).filter((f) => f.activityId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _activityEntriesTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ActivitiesTableTableFilterComposer
    extends Composer<_$AppDatabase, $ActivitiesTableTable> {
  $$ActivitiesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get presetKey => $composableBuilder(
    column: $table.presetKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get kcalPerUnit => $composableBuilder(
    column: $table.kcalPerUnit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get unitLabel => $composableBuilder(
    column: $table.unitLabel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isDurationBased => $composableBuilder(
    column: $table.isDurationBased,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> activityEntriesTableRefs(
    Expression<bool> Function($$ActivityEntriesTableTableFilterComposer f) f,
  ) {
    final $$ActivityEntriesTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.activityEntriesTable,
      getReferencedColumn: (t) => t.activityId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ActivityEntriesTableTableFilterComposer(
            $db: $db,
            $table: $db.activityEntriesTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ActivitiesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ActivitiesTableTable> {
  $$ActivitiesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get presetKey => $composableBuilder(
    column: $table.presetKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get kcalPerUnit => $composableBuilder(
    column: $table.kcalPerUnit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get unitLabel => $composableBuilder(
    column: $table.unitLabel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isDurationBased => $composableBuilder(
    column: $table.isDurationBased,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ActivitiesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ActivitiesTableTable> {
  $$ActivitiesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get presetKey =>
      $composableBuilder(column: $table.presetKey, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get kcalPerUnit => $composableBuilder(
    column: $table.kcalPerUnit,
    builder: (column) => column,
  );

  GeneratedColumn<String> get unitLabel =>
      $composableBuilder(column: $table.unitLabel, builder: (column) => column);

  GeneratedColumn<bool> get isDurationBased => $composableBuilder(
    column: $table.isDurationBased,
    builder: (column) => column,
  );

  Expression<T> activityEntriesTableRefs<T extends Object>(
    Expression<T> Function($$ActivityEntriesTableTableAnnotationComposer a) f,
  ) {
    final $$ActivityEntriesTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.activityEntriesTable,
          getReferencedColumn: (t) => t.activityId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ActivityEntriesTableTableAnnotationComposer(
                $db: $db,
                $table: $db.activityEntriesTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$ActivitiesTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ActivitiesTableTable,
          ActivityRow,
          $$ActivitiesTableTableFilterComposer,
          $$ActivitiesTableTableOrderingComposer,
          $$ActivitiesTableTableAnnotationComposer,
          $$ActivitiesTableTableCreateCompanionBuilder,
          $$ActivitiesTableTableUpdateCompanionBuilder,
          (ActivityRow, $$ActivitiesTableTableReferences),
          ActivityRow,
          PrefetchHooks Function({bool activityEntriesTableRefs})
        > {
  $$ActivitiesTableTableTableManager(
    _$AppDatabase db,
    $ActivitiesTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ActivitiesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ActivitiesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ActivitiesTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> presetKey = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> kcalPerUnit = const Value.absent(),
                Value<String> unitLabel = const Value.absent(),
                Value<bool> isDurationBased = const Value.absent(),
              }) => ActivitiesTableCompanion(
                id: id,
                presetKey: presetKey,
                name: name,
                kcalPerUnit: kcalPerUnit,
                unitLabel: unitLabel,
                isDurationBased: isDurationBased,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> presetKey = const Value.absent(),
                required String name,
                required int kcalPerUnit,
                required String unitLabel,
                Value<bool> isDurationBased = const Value.absent(),
              }) => ActivitiesTableCompanion.insert(
                id: id,
                presetKey: presetKey,
                name: name,
                kcalPerUnit: kcalPerUnit,
                unitLabel: unitLabel,
                isDurationBased: isDurationBased,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ActivitiesTableTable, ActivityRow>(table),
                  $$ActivitiesTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({activityEntriesTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (activityEntriesTableRefs) db.activityEntriesTable,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (activityEntriesTableRefs)
                    await $_getPrefetchedDataByColumns<
                      ActivityRow,
                      $ActivitiesTableTable,
                      ActivityEntryRow,
                      $ActivityEntriesTableTable
                    >(
                      currentTable: table,
                      referencedTable: $$ActivitiesTableTableReferences
                          ._activityEntriesTableRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$ActivitiesTableTableReferences(
                            db,
                            table,
                            p0,
                          ).activityEntriesTableRefs,
                      currentColumn: 'id',
                      referencedColumn: 'activity_id',
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$ActivitiesTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ActivitiesTableTable,
      ActivityRow,
      $$ActivitiesTableTableFilterComposer,
      $$ActivitiesTableTableOrderingComposer,
      $$ActivitiesTableTableAnnotationComposer,
      $$ActivitiesTableTableCreateCompanionBuilder,
      $$ActivitiesTableTableUpdateCompanionBuilder,
      (ActivityRow, $$ActivitiesTableTableReferences),
      ActivityRow,
      PrefetchHooks Function({bool activityEntriesTableRefs})
    >;
typedef $$ActivityEntriesTableTableCreateCompanionBuilder =
    ActivityEntriesTableCompanion Function({
      Value<int> id,
      required int activityId,
      required int amount,
    });
typedef $$ActivityEntriesTableTableUpdateCompanionBuilder =
    ActivityEntriesTableCompanion Function({
      Value<int> id,
      Value<int> activityId,
      Value<int> amount,
    });

final class $$ActivityEntriesTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $ActivityEntriesTableTable,
          ActivityEntryRow
        > {
  $$ActivityEntriesTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ActivitiesTableTable _activityIdTable(_$AppDatabase db) => db
      .activitiesTable
      .createAlias('activity_entries__activity_id__activities__id');

  $$ActivitiesTableTableProcessedTableManager get activityId {
    final $_column = $_itemColumn<int>('activity_id')!;

    final manager = $$ActivitiesTableTableTableManager(
      $_db,
      $_db.activitiesTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_activityIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ActivityEntriesTableTableFilterComposer
    extends Composer<_$AppDatabase, $ActivityEntriesTableTable> {
  $$ActivityEntriesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  $$ActivitiesTableTableFilterComposer get activityId {
    final $$ActivitiesTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.activityId,
      referencedTable: $db.activitiesTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ActivitiesTableTableFilterComposer(
            $db: $db,
            $table: $db.activitiesTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ActivityEntriesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ActivityEntriesTableTable> {
  $$ActivityEntriesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  $$ActivitiesTableTableOrderingComposer get activityId {
    final $$ActivitiesTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.activityId,
      referencedTable: $db.activitiesTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ActivitiesTableTableOrderingComposer(
            $db: $db,
            $table: $db.activitiesTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ActivityEntriesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ActivityEntriesTableTable> {
  $$ActivityEntriesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  $$ActivitiesTableTableAnnotationComposer get activityId {
    final $$ActivitiesTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.activityId,
      referencedTable: $db.activitiesTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ActivitiesTableTableAnnotationComposer(
            $db: $db,
            $table: $db.activitiesTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ActivityEntriesTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ActivityEntriesTableTable,
          ActivityEntryRow,
          $$ActivityEntriesTableTableFilterComposer,
          $$ActivityEntriesTableTableOrderingComposer,
          $$ActivityEntriesTableTableAnnotationComposer,
          $$ActivityEntriesTableTableCreateCompanionBuilder,
          $$ActivityEntriesTableTableUpdateCompanionBuilder,
          (ActivityEntryRow, $$ActivityEntriesTableTableReferences),
          ActivityEntryRow,
          PrefetchHooks Function({bool activityId})
        > {
  $$ActivityEntriesTableTableTableManager(
    _$AppDatabase db,
    $ActivityEntriesTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ActivityEntriesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ActivityEntriesTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$ActivityEntriesTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> activityId = const Value.absent(),
                Value<int> amount = const Value.absent(),
              }) => ActivityEntriesTableCompanion(
                id: id,
                activityId: activityId,
                amount: amount,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int activityId,
                required int amount,
              }) => ActivityEntriesTableCompanion.insert(
                id: id,
                activityId: activityId,
                amount: amount,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ActivityEntriesTableTable, ActivityEntryRow>(
                    table,
                  ),
                  $$ActivityEntriesTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({activityId = false}) {
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
                    if (activityId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.activityId,
                        referencedTable: $$ActivityEntriesTableTableReferences
                            ._activityIdTable(db),
                        referencedColumn: $$ActivityEntriesTableTableReferences
                            ._activityIdTable(db)
                            .id,
                      ) as T;
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

typedef $$ActivityEntriesTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ActivityEntriesTableTable,
      ActivityEntryRow,
      $$ActivityEntriesTableTableFilterComposer,
      $$ActivityEntriesTableTableOrderingComposer,
      $$ActivityEntriesTableTableAnnotationComposer,
      $$ActivityEntriesTableTableCreateCompanionBuilder,
      $$ActivityEntriesTableTableUpdateCompanionBuilder,
      (ActivityEntryRow, $$ActivityEntriesTableTableReferences),
      ActivityEntryRow,
      PrefetchHooks Function({bool activityId})
    >;
typedef $$IngredientsTableTableCreateCompanionBuilder =
    IngredientsTableCompanion Function({
      Value<int> id,
      required String name,
      Value<String?> category,
      Value<double> referenceG,
      required double kcal,
      required double proteinG,
      required double carbsG,
      required double sugarsG,
      required double fatG,
      required double saturatedG,
      required double fiberG,
      required double saltMg,
    });
typedef $$IngredientsTableTableUpdateCompanionBuilder =
    IngredientsTableCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String?> category,
      Value<double> referenceG,
      Value<double> kcal,
      Value<double> proteinG,
      Value<double> carbsG,
      Value<double> sugarsG,
      Value<double> fatG,
      Value<double> saturatedG,
      Value<double> fiberG,
      Value<double> saltMg,
    });

final class $$IngredientsTableTableReferences
    extends
        BaseReferences<_$AppDatabase, $IngredientsTableTable, IngredientRow> {
  $$IngredientsTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$FoodEntriesTableTable, List<FoodEntryRow>>
  _foodEntriesTableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.foodEntriesTable,
    aliasName: 'ingredients__id__food_entries__ingredient_id',
  );

  $$FoodEntriesTableTableProcessedTableManager get foodEntriesTableRefs {
    final manager = $$FoodEntriesTableTableTableManager(
      $_db,
      $_db.foodEntriesTable,
    ).filter((f) => f.ingredientId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _foodEntriesTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $RecipeIngredientsTableTable,
    List<RecipeIngredientRow>
  >
  _recipeIngredientsTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.recipeIngredientsTable,
        aliasName: 'ingredients__id__recipe_ingredients__ingredient_id',
      );

  $$RecipeIngredientsTableTableProcessedTableManager
  get recipeIngredientsTableRefs {
    final manager = $$RecipeIngredientsTableTableTableManager(
      $_db,
      $_db.recipeIngredientsTable,
    ).filter((f) => f.ingredientId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _recipeIngredientsTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $IngredientMicronutrientsTableTable,
    List<IngredientMicronutrientRow>
  >
  _ingredientMicronutrientsTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.ingredientMicronutrientsTable,
        aliasName: 'ingredients__id__ingredient_micronutrients__ingredient_id',
      );

  $$IngredientMicronutrientsTableTableProcessedTableManager
  get ingredientMicronutrientsTableRefs {
    final manager = $$IngredientMicronutrientsTableTableTableManager(
      $_db,
      $_db.ingredientMicronutrientsTable,
    ).filter((f) => f.ingredientId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _ingredientMicronutrientsTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$IngredientsTableTableFilterComposer
    extends Composer<_$AppDatabase, $IngredientsTableTable> {
  $$IngredientsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get referenceG => $composableBuilder(
    column: $table.referenceG,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get kcal => $composableBuilder(
    column: $table.kcal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get proteinG => $composableBuilder(
    column: $table.proteinG,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get carbsG => $composableBuilder(
    column: $table.carbsG,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get sugarsG => $composableBuilder(
    column: $table.sugarsG,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get fatG => $composableBuilder(
    column: $table.fatG,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get saturatedG => $composableBuilder(
    column: $table.saturatedG,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get fiberG => $composableBuilder(
    column: $table.fiberG,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get saltMg => $composableBuilder(
    column: $table.saltMg,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> foodEntriesTableRefs(
    Expression<bool> Function($$FoodEntriesTableTableFilterComposer f) f,
  ) {
    final $$FoodEntriesTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.foodEntriesTable,
      getReferencedColumn: (t) => t.ingredientId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FoodEntriesTableTableFilterComposer(
            $db: $db,
            $table: $db.foodEntriesTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> recipeIngredientsTableRefs(
    Expression<bool> Function($$RecipeIngredientsTableTableFilterComposer f) f,
  ) {
    final $$RecipeIngredientsTableTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.recipeIngredientsTable,
          getReferencedColumn: (t) => t.ingredientId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$RecipeIngredientsTableTableFilterComposer(
                $db: $db,
                $table: $db.recipeIngredientsTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<bool> ingredientMicronutrientsTableRefs(
    Expression<bool> Function(
      $$IngredientMicronutrientsTableTableFilterComposer f,
    )
    f,
  ) {
    final $$IngredientMicronutrientsTableTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.ingredientMicronutrientsTable,
          getReferencedColumn: (t) => t.ingredientId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$IngredientMicronutrientsTableTableFilterComposer(
                $db: $db,
                $table: $db.ingredientMicronutrientsTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$IngredientsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $IngredientsTableTable> {
  $$IngredientsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get referenceG => $composableBuilder(
    column: $table.referenceG,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get kcal => $composableBuilder(
    column: $table.kcal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get proteinG => $composableBuilder(
    column: $table.proteinG,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get carbsG => $composableBuilder(
    column: $table.carbsG,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get sugarsG => $composableBuilder(
    column: $table.sugarsG,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get fatG => $composableBuilder(
    column: $table.fatG,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get saturatedG => $composableBuilder(
    column: $table.saturatedG,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get fiberG => $composableBuilder(
    column: $table.fiberG,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get saltMg => $composableBuilder(
    column: $table.saltMg,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$IngredientsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $IngredientsTableTable> {
  $$IngredientsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<double> get referenceG => $composableBuilder(
    column: $table.referenceG,
    builder: (column) => column,
  );

  GeneratedColumn<double> get kcal =>
      $composableBuilder(column: $table.kcal, builder: (column) => column);

  GeneratedColumn<double> get proteinG =>
      $composableBuilder(column: $table.proteinG, builder: (column) => column);

  GeneratedColumn<double> get carbsG =>
      $composableBuilder(column: $table.carbsG, builder: (column) => column);

  GeneratedColumn<double> get sugarsG =>
      $composableBuilder(column: $table.sugarsG, builder: (column) => column);

  GeneratedColumn<double> get fatG =>
      $composableBuilder(column: $table.fatG, builder: (column) => column);

  GeneratedColumn<double> get saturatedG => $composableBuilder(
    column: $table.saturatedG,
    builder: (column) => column,
  );

  GeneratedColumn<double> get fiberG =>
      $composableBuilder(column: $table.fiberG, builder: (column) => column);

  GeneratedColumn<double> get saltMg =>
      $composableBuilder(column: $table.saltMg, builder: (column) => column);

  Expression<T> foodEntriesTableRefs<T extends Object>(
    Expression<T> Function($$FoodEntriesTableTableAnnotationComposer a) f,
  ) {
    final $$FoodEntriesTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.foodEntriesTable,
      getReferencedColumn: (t) => t.ingredientId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FoodEntriesTableTableAnnotationComposer(
            $db: $db,
            $table: $db.foodEntriesTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> recipeIngredientsTableRefs<T extends Object>(
    Expression<T> Function($$RecipeIngredientsTableTableAnnotationComposer a) f,
  ) {
    final $$RecipeIngredientsTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.recipeIngredientsTable,
          getReferencedColumn: (t) => t.ingredientId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$RecipeIngredientsTableTableAnnotationComposer(
                $db: $db,
                $table: $db.recipeIngredientsTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> ingredientMicronutrientsTableRefs<T extends Object>(
    Expression<T> Function(
      $$IngredientMicronutrientsTableTableAnnotationComposer a,
    )
    f,
  ) {
    final $$IngredientMicronutrientsTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.ingredientMicronutrientsTable,
          getReferencedColumn: (t) => t.ingredientId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$IngredientMicronutrientsTableTableAnnotationComposer(
                $db: $db,
                $table: $db.ingredientMicronutrientsTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$IngredientsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $IngredientsTableTable,
          IngredientRow,
          $$IngredientsTableTableFilterComposer,
          $$IngredientsTableTableOrderingComposer,
          $$IngredientsTableTableAnnotationComposer,
          $$IngredientsTableTableCreateCompanionBuilder,
          $$IngredientsTableTableUpdateCompanionBuilder,
          (IngredientRow, $$IngredientsTableTableReferences),
          IngredientRow,
          PrefetchHooks Function({
            bool foodEntriesTableRefs,
            bool recipeIngredientsTableRefs,
            bool ingredientMicronutrientsTableRefs,
          })
        > {
  $$IngredientsTableTableTableManager(
    _$AppDatabase db,
    $IngredientsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$IngredientsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$IngredientsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$IngredientsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> category = const Value.absent(),
                Value<double> referenceG = const Value.absent(),
                Value<double> kcal = const Value.absent(),
                Value<double> proteinG = const Value.absent(),
                Value<double> carbsG = const Value.absent(),
                Value<double> sugarsG = const Value.absent(),
                Value<double> fatG = const Value.absent(),
                Value<double> saturatedG = const Value.absent(),
                Value<double> fiberG = const Value.absent(),
                Value<double> saltMg = const Value.absent(),
              }) => IngredientsTableCompanion(
                id: id,
                name: name,
                category: category,
                referenceG: referenceG,
                kcal: kcal,
                proteinG: proteinG,
                carbsG: carbsG,
                sugarsG: sugarsG,
                fatG: fatG,
                saturatedG: saturatedG,
                fiberG: fiberG,
                saltMg: saltMg,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<String?> category = const Value.absent(),
                Value<double> referenceG = const Value.absent(),
                required double kcal,
                required double proteinG,
                required double carbsG,
                required double sugarsG,
                required double fatG,
                required double saturatedG,
                required double fiberG,
                required double saltMg,
              }) => IngredientsTableCompanion.insert(
                id: id,
                name: name,
                category: category,
                referenceG: referenceG,
                kcal: kcal,
                proteinG: proteinG,
                carbsG: carbsG,
                sugarsG: sugarsG,
                fatG: fatG,
                saturatedG: saturatedG,
                fiberG: fiberG,
                saltMg: saltMg,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$IngredientsTableTable, IngredientRow>(table),
                  $$IngredientsTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                foodEntriesTableRefs = false,
                recipeIngredientsTableRefs = false,
                ingredientMicronutrientsTableRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (foodEntriesTableRefs) db.foodEntriesTable,
                    if (recipeIngredientsTableRefs) db.recipeIngredientsTable,
                    if (ingredientMicronutrientsTableRefs)
                      db.ingredientMicronutrientsTable,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (foodEntriesTableRefs)
                        await $_getPrefetchedDataByColumns<
                          IngredientRow,
                          $IngredientsTableTable,
                          FoodEntryRow,
                          $FoodEntriesTableTable
                        >(
                          currentTable: table,
                          referencedTable: $$IngredientsTableTableReferences
                              ._foodEntriesTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$IngredientsTableTableReferences(
                                db,
                                table,
                                p0,
                              ).foodEntriesTableRefs,
                          currentColumn: 'id',
                          referencedColumn: 'ingredient_id',
                          typedResults: items,
                        ),
                      if (recipeIngredientsTableRefs)
                        await $_getPrefetchedDataByColumns<
                          IngredientRow,
                          $IngredientsTableTable,
                          RecipeIngredientRow,
                          $RecipeIngredientsTableTable
                        >(
                          currentTable: table,
                          referencedTable: $$IngredientsTableTableReferences
                              ._recipeIngredientsTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$IngredientsTableTableReferences(
                                db,
                                table,
                                p0,
                              ).recipeIngredientsTableRefs,
                          currentColumn: 'id',
                          referencedColumn: 'ingredient_id',
                          typedResults: items,
                        ),
                      if (ingredientMicronutrientsTableRefs)
                        await $_getPrefetchedDataByColumns<
                          IngredientRow,
                          $IngredientsTableTable,
                          IngredientMicronutrientRow,
                          $IngredientMicronutrientsTableTable
                        >(
                          currentTable: table,
                          referencedTable: $$IngredientsTableTableReferences
                              ._ingredientMicronutrientsTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$IngredientsTableTableReferences(
                                db,
                                table,
                                p0,
                              ).ingredientMicronutrientsTableRefs,
                          currentColumn: 'id',
                          referencedColumn: 'ingredient_id',
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$IngredientsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $IngredientsTableTable,
      IngredientRow,
      $$IngredientsTableTableFilterComposer,
      $$IngredientsTableTableOrderingComposer,
      $$IngredientsTableTableAnnotationComposer,
      $$IngredientsTableTableCreateCompanionBuilder,
      $$IngredientsTableTableUpdateCompanionBuilder,
      (IngredientRow, $$IngredientsTableTableReferences),
      IngredientRow,
      PrefetchHooks Function({
        bool foodEntriesTableRefs,
        bool recipeIngredientsTableRefs,
        bool ingredientMicronutrientsTableRefs,
      })
    >;
typedef $$FoodEntriesTableTableCreateCompanionBuilder =
    FoodEntriesTableCompanion Function({
      Value<int> id,
      required int ingredientId,
      required int grams,
    });
typedef $$FoodEntriesTableTableUpdateCompanionBuilder =
    FoodEntriesTableCompanion Function({
      Value<int> id,
      Value<int> ingredientId,
      Value<int> grams,
    });

final class $$FoodEntriesTableTableReferences
    extends
        BaseReferences<_$AppDatabase, $FoodEntriesTableTable, FoodEntryRow> {
  $$FoodEntriesTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $IngredientsTableTable _ingredientIdTable(_$AppDatabase db) => db
      .ingredientsTable
      .createAlias('food_entries__ingredient_id__ingredients__id');

  $$IngredientsTableTableProcessedTableManager get ingredientId {
    final $_column = $_itemColumn<int>('ingredient_id')!;

    final manager = $$IngredientsTableTableTableManager(
      $_db,
      $_db.ingredientsTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_ingredientIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$FoodEntriesTableTableFilterComposer
    extends Composer<_$AppDatabase, $FoodEntriesTableTable> {
  $$FoodEntriesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get grams => $composableBuilder(
    column: $table.grams,
    builder: (column) => ColumnFilters(column),
  );

  $$IngredientsTableTableFilterComposer get ingredientId {
    final $$IngredientsTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ingredientId,
      referencedTable: $db.ingredientsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IngredientsTableTableFilterComposer(
            $db: $db,
            $table: $db.ingredientsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FoodEntriesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $FoodEntriesTableTable> {
  $$FoodEntriesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get grams => $composableBuilder(
    column: $table.grams,
    builder: (column) => ColumnOrderings(column),
  );

  $$IngredientsTableTableOrderingComposer get ingredientId {
    final $$IngredientsTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ingredientId,
      referencedTable: $db.ingredientsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IngredientsTableTableOrderingComposer(
            $db: $db,
            $table: $db.ingredientsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FoodEntriesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $FoodEntriesTableTable> {
  $$FoodEntriesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get grams =>
      $composableBuilder(column: $table.grams, builder: (column) => column);

  $$IngredientsTableTableAnnotationComposer get ingredientId {
    final $$IngredientsTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ingredientId,
      referencedTable: $db.ingredientsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IngredientsTableTableAnnotationComposer(
            $db: $db,
            $table: $db.ingredientsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FoodEntriesTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FoodEntriesTableTable,
          FoodEntryRow,
          $$FoodEntriesTableTableFilterComposer,
          $$FoodEntriesTableTableOrderingComposer,
          $$FoodEntriesTableTableAnnotationComposer,
          $$FoodEntriesTableTableCreateCompanionBuilder,
          $$FoodEntriesTableTableUpdateCompanionBuilder,
          (FoodEntryRow, $$FoodEntriesTableTableReferences),
          FoodEntryRow,
          PrefetchHooks Function({bool ingredientId})
        > {
  $$FoodEntriesTableTableTableManager(
    _$AppDatabase db,
    $FoodEntriesTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FoodEntriesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FoodEntriesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FoodEntriesTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> ingredientId = const Value.absent(),
                Value<int> grams = const Value.absent(),
              }) => FoodEntriesTableCompanion(
                id: id,
                ingredientId: ingredientId,
                grams: grams,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int ingredientId,
                required int grams,
              }) => FoodEntriesTableCompanion.insert(
                id: id,
                ingredientId: ingredientId,
                grams: grams,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$FoodEntriesTableTable, FoodEntryRow>(table),
                  $$FoodEntriesTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({ingredientId = false}) {
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
                    if (ingredientId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.ingredientId,
                        referencedTable: $$FoodEntriesTableTableReferences
                            ._ingredientIdTable(db),
                        referencedColumn: $$FoodEntriesTableTableReferences
                            ._ingredientIdTable(db)
                            .id,
                      ) as T;
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

typedef $$FoodEntriesTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FoodEntriesTableTable,
      FoodEntryRow,
      $$FoodEntriesTableTableFilterComposer,
      $$FoodEntriesTableTableOrderingComposer,
      $$FoodEntriesTableTableAnnotationComposer,
      $$FoodEntriesTableTableCreateCompanionBuilder,
      $$FoodEntriesTableTableUpdateCompanionBuilder,
      (FoodEntryRow, $$FoodEntriesTableTableReferences),
      FoodEntryRow,
      PrefetchHooks Function({bool ingredientId})
    >;
typedef $$DayLogsTableTableCreateCompanionBuilder =
    DayLogsTableCompanion Function({
      Value<int> id,
      required String day,
      required double dailyKcal,
      required double proteinGoalG,
      required double fiberGoalG,
      required double sugarLimitPct,
      required double saturatedLimitPct,
      required double saltLimitMg,
      required double burnedKcal,
      required double adjustedKcal,
      required double sugarLimitG,
      required double saturatedLimitG,
      required double kcal,
      required double proteinG,
      required double carbsG,
      required double sugarsG,
      required double fatG,
      required double saturatedG,
      required double fiberG,
      required double saltMg,
      Value<String?> sex,
      Value<int?> age,
    });
typedef $$DayLogsTableTableUpdateCompanionBuilder =
    DayLogsTableCompanion Function({
      Value<int> id,
      Value<String> day,
      Value<double> dailyKcal,
      Value<double> proteinGoalG,
      Value<double> fiberGoalG,
      Value<double> sugarLimitPct,
      Value<double> saturatedLimitPct,
      Value<double> saltLimitMg,
      Value<double> burnedKcal,
      Value<double> adjustedKcal,
      Value<double> sugarLimitG,
      Value<double> saturatedLimitG,
      Value<double> kcal,
      Value<double> proteinG,
      Value<double> carbsG,
      Value<double> sugarsG,
      Value<double> fatG,
      Value<double> saturatedG,
      Value<double> fiberG,
      Value<double> saltMg,
      Value<String?> sex,
      Value<int?> age,
    });

final class $$DayLogsTableTableReferences
    extends BaseReferences<_$AppDatabase, $DayLogsTableTable, DayLogRow> {
  $$DayLogsTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<
    $DayLogMicronutrientsTableTable,
    List<DayLogMicronutrientRow>
  >
  _dayLogMicronutrientsTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.dayLogMicronutrientsTable,
        aliasName: 'day_logs__id__day_log_micronutrients__day_log_id',
      );

  $$DayLogMicronutrientsTableTableProcessedTableManager
  get dayLogMicronutrientsTableRefs {
    final manager = $$DayLogMicronutrientsTableTableTableManager(
      $_db,
      $_db.dayLogMicronutrientsTable,
    ).filter((f) => f.dayLogId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _dayLogMicronutrientsTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$DayLogsTableTableFilterComposer
    extends Composer<_$AppDatabase, $DayLogsTableTable> {
  $$DayLogsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get day => $composableBuilder(
    column: $table.day,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get dailyKcal => $composableBuilder(
    column: $table.dailyKcal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get proteinGoalG => $composableBuilder(
    column: $table.proteinGoalG,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get fiberGoalG => $composableBuilder(
    column: $table.fiberGoalG,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get sugarLimitPct => $composableBuilder(
    column: $table.sugarLimitPct,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get saturatedLimitPct => $composableBuilder(
    column: $table.saturatedLimitPct,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get saltLimitMg => $composableBuilder(
    column: $table.saltLimitMg,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get burnedKcal => $composableBuilder(
    column: $table.burnedKcal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get adjustedKcal => $composableBuilder(
    column: $table.adjustedKcal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get sugarLimitG => $composableBuilder(
    column: $table.sugarLimitG,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get saturatedLimitG => $composableBuilder(
    column: $table.saturatedLimitG,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get kcal => $composableBuilder(
    column: $table.kcal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get proteinG => $composableBuilder(
    column: $table.proteinG,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get carbsG => $composableBuilder(
    column: $table.carbsG,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get sugarsG => $composableBuilder(
    column: $table.sugarsG,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get fatG => $composableBuilder(
    column: $table.fatG,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get saturatedG => $composableBuilder(
    column: $table.saturatedG,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get fiberG => $composableBuilder(
    column: $table.fiberG,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get saltMg => $composableBuilder(
    column: $table.saltMg,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sex => $composableBuilder(
    column: $table.sex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get age => $composableBuilder(
    column: $table.age,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> dayLogMicronutrientsTableRefs(
    Expression<bool> Function($$DayLogMicronutrientsTableTableFilterComposer f)
    f,
  ) {
    final $$DayLogMicronutrientsTableTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.dayLogMicronutrientsTable,
          getReferencedColumn: (t) => t.dayLogId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$DayLogMicronutrientsTableTableFilterComposer(
                $db: $db,
                $table: $db.dayLogMicronutrientsTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$DayLogsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $DayLogsTableTable> {
  $$DayLogsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get day => $composableBuilder(
    column: $table.day,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get dailyKcal => $composableBuilder(
    column: $table.dailyKcal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get proteinGoalG => $composableBuilder(
    column: $table.proteinGoalG,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get fiberGoalG => $composableBuilder(
    column: $table.fiberGoalG,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get sugarLimitPct => $composableBuilder(
    column: $table.sugarLimitPct,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get saturatedLimitPct => $composableBuilder(
    column: $table.saturatedLimitPct,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get saltLimitMg => $composableBuilder(
    column: $table.saltLimitMg,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get burnedKcal => $composableBuilder(
    column: $table.burnedKcal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get adjustedKcal => $composableBuilder(
    column: $table.adjustedKcal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get sugarLimitG => $composableBuilder(
    column: $table.sugarLimitG,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get saturatedLimitG => $composableBuilder(
    column: $table.saturatedLimitG,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get kcal => $composableBuilder(
    column: $table.kcal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get proteinG => $composableBuilder(
    column: $table.proteinG,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get carbsG => $composableBuilder(
    column: $table.carbsG,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get sugarsG => $composableBuilder(
    column: $table.sugarsG,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get fatG => $composableBuilder(
    column: $table.fatG,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get saturatedG => $composableBuilder(
    column: $table.saturatedG,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get fiberG => $composableBuilder(
    column: $table.fiberG,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get saltMg => $composableBuilder(
    column: $table.saltMg,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sex => $composableBuilder(
    column: $table.sex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get age => $composableBuilder(
    column: $table.age,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DayLogsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $DayLogsTableTable> {
  $$DayLogsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get day =>
      $composableBuilder(column: $table.day, builder: (column) => column);

  GeneratedColumn<double> get dailyKcal =>
      $composableBuilder(column: $table.dailyKcal, builder: (column) => column);

  GeneratedColumn<double> get proteinGoalG => $composableBuilder(
    column: $table.proteinGoalG,
    builder: (column) => column,
  );

  GeneratedColumn<double> get fiberGoalG => $composableBuilder(
    column: $table.fiberGoalG,
    builder: (column) => column,
  );

  GeneratedColumn<double> get sugarLimitPct => $composableBuilder(
    column: $table.sugarLimitPct,
    builder: (column) => column,
  );

  GeneratedColumn<double> get saturatedLimitPct => $composableBuilder(
    column: $table.saturatedLimitPct,
    builder: (column) => column,
  );

  GeneratedColumn<double> get saltLimitMg => $composableBuilder(
    column: $table.saltLimitMg,
    builder: (column) => column,
  );

  GeneratedColumn<double> get burnedKcal => $composableBuilder(
    column: $table.burnedKcal,
    builder: (column) => column,
  );

  GeneratedColumn<double> get adjustedKcal => $composableBuilder(
    column: $table.adjustedKcal,
    builder: (column) => column,
  );

  GeneratedColumn<double> get sugarLimitG => $composableBuilder(
    column: $table.sugarLimitG,
    builder: (column) => column,
  );

  GeneratedColumn<double> get saturatedLimitG => $composableBuilder(
    column: $table.saturatedLimitG,
    builder: (column) => column,
  );

  GeneratedColumn<double> get kcal =>
      $composableBuilder(column: $table.kcal, builder: (column) => column);

  GeneratedColumn<double> get proteinG =>
      $composableBuilder(column: $table.proteinG, builder: (column) => column);

  GeneratedColumn<double> get carbsG =>
      $composableBuilder(column: $table.carbsG, builder: (column) => column);

  GeneratedColumn<double> get sugarsG =>
      $composableBuilder(column: $table.sugarsG, builder: (column) => column);

  GeneratedColumn<double> get fatG =>
      $composableBuilder(column: $table.fatG, builder: (column) => column);

  GeneratedColumn<double> get saturatedG => $composableBuilder(
    column: $table.saturatedG,
    builder: (column) => column,
  );

  GeneratedColumn<double> get fiberG =>
      $composableBuilder(column: $table.fiberG, builder: (column) => column);

  GeneratedColumn<double> get saltMg =>
      $composableBuilder(column: $table.saltMg, builder: (column) => column);

  GeneratedColumn<String> get sex =>
      $composableBuilder(column: $table.sex, builder: (column) => column);

  GeneratedColumn<int> get age =>
      $composableBuilder(column: $table.age, builder: (column) => column);

  Expression<T> dayLogMicronutrientsTableRefs<T extends Object>(
    Expression<T> Function($$DayLogMicronutrientsTableTableAnnotationComposer a)
    f,
  ) {
    final $$DayLogMicronutrientsTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.dayLogMicronutrientsTable,
          getReferencedColumn: (t) => t.dayLogId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$DayLogMicronutrientsTableTableAnnotationComposer(
                $db: $db,
                $table: $db.dayLogMicronutrientsTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$DayLogsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DayLogsTableTable,
          DayLogRow,
          $$DayLogsTableTableFilterComposer,
          $$DayLogsTableTableOrderingComposer,
          $$DayLogsTableTableAnnotationComposer,
          $$DayLogsTableTableCreateCompanionBuilder,
          $$DayLogsTableTableUpdateCompanionBuilder,
          (DayLogRow, $$DayLogsTableTableReferences),
          DayLogRow,
          PrefetchHooks Function({bool dayLogMicronutrientsTableRefs})
        > {
  $$DayLogsTableTableTableManager(_$AppDatabase db, $DayLogsTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DayLogsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DayLogsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DayLogsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> day = const Value.absent(),
                Value<double> dailyKcal = const Value.absent(),
                Value<double> proteinGoalG = const Value.absent(),
                Value<double> fiberGoalG = const Value.absent(),
                Value<double> sugarLimitPct = const Value.absent(),
                Value<double> saturatedLimitPct = const Value.absent(),
                Value<double> saltLimitMg = const Value.absent(),
                Value<double> burnedKcal = const Value.absent(),
                Value<double> adjustedKcal = const Value.absent(),
                Value<double> sugarLimitG = const Value.absent(),
                Value<double> saturatedLimitG = const Value.absent(),
                Value<double> kcal = const Value.absent(),
                Value<double> proteinG = const Value.absent(),
                Value<double> carbsG = const Value.absent(),
                Value<double> sugarsG = const Value.absent(),
                Value<double> fatG = const Value.absent(),
                Value<double> saturatedG = const Value.absent(),
                Value<double> fiberG = const Value.absent(),
                Value<double> saltMg = const Value.absent(),
                Value<String?> sex = const Value.absent(),
                Value<int?> age = const Value.absent(),
              }) => DayLogsTableCompanion(
                id: id,
                day: day,
                dailyKcal: dailyKcal,
                proteinGoalG: proteinGoalG,
                fiberGoalG: fiberGoalG,
                sugarLimitPct: sugarLimitPct,
                saturatedLimitPct: saturatedLimitPct,
                saltLimitMg: saltLimitMg,
                burnedKcal: burnedKcal,
                adjustedKcal: adjustedKcal,
                sugarLimitG: sugarLimitG,
                saturatedLimitG: saturatedLimitG,
                kcal: kcal,
                proteinG: proteinG,
                carbsG: carbsG,
                sugarsG: sugarsG,
                fatG: fatG,
                saturatedG: saturatedG,
                fiberG: fiberG,
                saltMg: saltMg,
                sex: sex,
                age: age,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String day,
                required double dailyKcal,
                required double proteinGoalG,
                required double fiberGoalG,
                required double sugarLimitPct,
                required double saturatedLimitPct,
                required double saltLimitMg,
                required double burnedKcal,
                required double adjustedKcal,
                required double sugarLimitG,
                required double saturatedLimitG,
                required double kcal,
                required double proteinG,
                required double carbsG,
                required double sugarsG,
                required double fatG,
                required double saturatedG,
                required double fiberG,
                required double saltMg,
                Value<String?> sex = const Value.absent(),
                Value<int?> age = const Value.absent(),
              }) => DayLogsTableCompanion.insert(
                id: id,
                day: day,
                dailyKcal: dailyKcal,
                proteinGoalG: proteinGoalG,
                fiberGoalG: fiberGoalG,
                sugarLimitPct: sugarLimitPct,
                saturatedLimitPct: saturatedLimitPct,
                saltLimitMg: saltLimitMg,
                burnedKcal: burnedKcal,
                adjustedKcal: adjustedKcal,
                sugarLimitG: sugarLimitG,
                saturatedLimitG: saturatedLimitG,
                kcal: kcal,
                proteinG: proteinG,
                carbsG: carbsG,
                sugarsG: sugarsG,
                fatG: fatG,
                saturatedG: saturatedG,
                fiberG: fiberG,
                saltMg: saltMg,
                sex: sex,
                age: age,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$DayLogsTableTable, DayLogRow>(table),
                  $$DayLogsTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({dayLogMicronutrientsTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (dayLogMicronutrientsTableRefs) db.dayLogMicronutrientsTable,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (dayLogMicronutrientsTableRefs)
                    await $_getPrefetchedDataByColumns<
                      DayLogRow,
                      $DayLogsTableTable,
                      DayLogMicronutrientRow,
                      $DayLogMicronutrientsTableTable
                    >(
                      currentTable: table,
                      referencedTable: $$DayLogsTableTableReferences
                          ._dayLogMicronutrientsTableRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$DayLogsTableTableReferences(
                            db,
                            table,
                            p0,
                          ).dayLogMicronutrientsTableRefs,
                      currentColumn: 'id',
                      referencedColumn: 'day_log_id',
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$DayLogsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DayLogsTableTable,
      DayLogRow,
      $$DayLogsTableTableFilterComposer,
      $$DayLogsTableTableOrderingComposer,
      $$DayLogsTableTableAnnotationComposer,
      $$DayLogsTableTableCreateCompanionBuilder,
      $$DayLogsTableTableUpdateCompanionBuilder,
      (DayLogRow, $$DayLogsTableTableReferences),
      DayLogRow,
      PrefetchHooks Function({bool dayLogMicronutrientsTableRefs})
    >;
typedef $$RecipesTableTableCreateCompanionBuilder =
    RecipesTableCompanion Function({
      Value<int> id,
      required String name,
      Value<int?> finalWeightG,
    });
typedef $$RecipesTableTableUpdateCompanionBuilder =
    RecipesTableCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<int?> finalWeightG,
    });

final class $$RecipesTableTableReferences
    extends BaseReferences<_$AppDatabase, $RecipesTableTable, RecipeRow> {
  $$RecipesTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<
    $RecipeIngredientsTableTable,
    List<RecipeIngredientRow>
  >
  _recipeIngredientsTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.recipeIngredientsTable,
        aliasName: 'recipes__id__recipe_ingredients__recipe_id',
      );

  $$RecipeIngredientsTableTableProcessedTableManager
  get recipeIngredientsTableRefs {
    final manager = $$RecipeIngredientsTableTableTableManager(
      $_db,
      $_db.recipeIngredientsTable,
    ).filter((f) => f.recipeId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _recipeIngredientsTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$RecipeEntriesTableTable, List<RecipeEntryRow>>
  _recipeEntriesTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.recipeEntriesTable,
        aliasName: 'recipes__id__recipe_entries__recipe_id',
      );

  $$RecipeEntriesTableTableProcessedTableManager get recipeEntriesTableRefs {
    final manager = $$RecipeEntriesTableTableTableManager(
      $_db,
      $_db.recipeEntriesTable,
    ).filter((f) => f.recipeId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _recipeEntriesTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$RecipesTableTableFilterComposer
    extends Composer<_$AppDatabase, $RecipesTableTable> {
  $$RecipesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get finalWeightG => $composableBuilder(
    column: $table.finalWeightG,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> recipeIngredientsTableRefs(
    Expression<bool> Function($$RecipeIngredientsTableTableFilterComposer f) f,
  ) {
    final $$RecipeIngredientsTableTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.recipeIngredientsTable,
          getReferencedColumn: (t) => t.recipeId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$RecipeIngredientsTableTableFilterComposer(
                $db: $db,
                $table: $db.recipeIngredientsTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<bool> recipeEntriesTableRefs(
    Expression<bool> Function($$RecipeEntriesTableTableFilterComposer f) f,
  ) {
    final $$RecipeEntriesTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.recipeEntriesTable,
      getReferencedColumn: (t) => t.recipeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipeEntriesTableTableFilterComposer(
            $db: $db,
            $table: $db.recipeEntriesTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RecipesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $RecipesTableTable> {
  $$RecipesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get finalWeightG => $composableBuilder(
    column: $table.finalWeightG,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RecipesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $RecipesTableTable> {
  $$RecipesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get finalWeightG => $composableBuilder(
    column: $table.finalWeightG,
    builder: (column) => column,
  );

  Expression<T> recipeIngredientsTableRefs<T extends Object>(
    Expression<T> Function($$RecipeIngredientsTableTableAnnotationComposer a) f,
  ) {
    final $$RecipeIngredientsTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.recipeIngredientsTable,
          getReferencedColumn: (t) => t.recipeId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$RecipeIngredientsTableTableAnnotationComposer(
                $db: $db,
                $table: $db.recipeIngredientsTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> recipeEntriesTableRefs<T extends Object>(
    Expression<T> Function($$RecipeEntriesTableTableAnnotationComposer a) f,
  ) {
    final $$RecipeEntriesTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.recipeEntriesTable,
          getReferencedColumn: (t) => t.recipeId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$RecipeEntriesTableTableAnnotationComposer(
                $db: $db,
                $table: $db.recipeEntriesTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$RecipesTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RecipesTableTable,
          RecipeRow,
          $$RecipesTableTableFilterComposer,
          $$RecipesTableTableOrderingComposer,
          $$RecipesTableTableAnnotationComposer,
          $$RecipesTableTableCreateCompanionBuilder,
          $$RecipesTableTableUpdateCompanionBuilder,
          (RecipeRow, $$RecipesTableTableReferences),
          RecipeRow,
          PrefetchHooks Function({
            bool recipeIngredientsTableRefs,
            bool recipeEntriesTableRefs,
          })
        > {
  $$RecipesTableTableTableManager(_$AppDatabase db, $RecipesTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RecipesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RecipesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RecipesTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int?> finalWeightG = const Value.absent(),
              }) => RecipesTableCompanion(
                id: id,
                name: name,
                finalWeightG: finalWeightG,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<int?> finalWeightG = const Value.absent(),
              }) => RecipesTableCompanion.insert(
                id: id,
                name: name,
                finalWeightG: finalWeightG,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$RecipesTableTable, RecipeRow>(table),
                  $$RecipesTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                recipeIngredientsTableRefs = false,
                recipeEntriesTableRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (recipeIngredientsTableRefs) db.recipeIngredientsTable,
                    if (recipeEntriesTableRefs) db.recipeEntriesTable,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (recipeIngredientsTableRefs)
                        await $_getPrefetchedDataByColumns<
                          RecipeRow,
                          $RecipesTableTable,
                          RecipeIngredientRow,
                          $RecipeIngredientsTableTable
                        >(
                          currentTable: table,
                          referencedTable: $$RecipesTableTableReferences
                              ._recipeIngredientsTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$RecipesTableTableReferences(
                                db,
                                table,
                                p0,
                              ).recipeIngredientsTableRefs,
                          currentColumn: 'id',
                          referencedColumn: 'recipe_id',
                          typedResults: items,
                        ),
                      if (recipeEntriesTableRefs)
                        await $_getPrefetchedDataByColumns<
                          RecipeRow,
                          $RecipesTableTable,
                          RecipeEntryRow,
                          $RecipeEntriesTableTable
                        >(
                          currentTable: table,
                          referencedTable: $$RecipesTableTableReferences
                              ._recipeEntriesTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$RecipesTableTableReferences(
                                db,
                                table,
                                p0,
                              ).recipeEntriesTableRefs,
                          currentColumn: 'id',
                          referencedColumn: 'recipe_id',
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$RecipesTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RecipesTableTable,
      RecipeRow,
      $$RecipesTableTableFilterComposer,
      $$RecipesTableTableOrderingComposer,
      $$RecipesTableTableAnnotationComposer,
      $$RecipesTableTableCreateCompanionBuilder,
      $$RecipesTableTableUpdateCompanionBuilder,
      (RecipeRow, $$RecipesTableTableReferences),
      RecipeRow,
      PrefetchHooks Function({
        bool recipeIngredientsTableRefs,
        bool recipeEntriesTableRefs,
      })
    >;
typedef $$RecipeIngredientsTableTableCreateCompanionBuilder =
    RecipeIngredientsTableCompanion Function({
      Value<int> id,
      required int recipeId,
      required int ingredientId,
      required int grams,
    });
typedef $$RecipeIngredientsTableTableUpdateCompanionBuilder =
    RecipeIngredientsTableCompanion Function({
      Value<int> id,
      Value<int> recipeId,
      Value<int> ingredientId,
      Value<int> grams,
    });

final class $$RecipeIngredientsTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $RecipeIngredientsTableTable,
          RecipeIngredientRow
        > {
  $$RecipeIngredientsTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $RecipesTableTable _recipeIdTable(_$AppDatabase db) =>
      db.recipesTable.createAlias('recipe_ingredients__recipe_id__recipes__id');

  $$RecipesTableTableProcessedTableManager get recipeId {
    final $_column = $_itemColumn<int>('recipe_id')!;

    final manager = $$RecipesTableTableTableManager(
      $_db,
      $_db.recipesTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_recipeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $IngredientsTableTable _ingredientIdTable(_$AppDatabase db) => db
      .ingredientsTable
      .createAlias('recipe_ingredients__ingredient_id__ingredients__id');

  $$IngredientsTableTableProcessedTableManager get ingredientId {
    final $_column = $_itemColumn<int>('ingredient_id')!;

    final manager = $$IngredientsTableTableTableManager(
      $_db,
      $_db.ingredientsTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_ingredientIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$RecipeIngredientsTableTableFilterComposer
    extends Composer<_$AppDatabase, $RecipeIngredientsTableTable> {
  $$RecipeIngredientsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get grams => $composableBuilder(
    column: $table.grams,
    builder: (column) => ColumnFilters(column),
  );

  $$RecipesTableTableFilterComposer get recipeId {
    final $$RecipesTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recipeId,
      referencedTable: $db.recipesTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipesTableTableFilterComposer(
            $db: $db,
            $table: $db.recipesTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$IngredientsTableTableFilterComposer get ingredientId {
    final $$IngredientsTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ingredientId,
      referencedTable: $db.ingredientsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IngredientsTableTableFilterComposer(
            $db: $db,
            $table: $db.ingredientsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RecipeIngredientsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $RecipeIngredientsTableTable> {
  $$RecipeIngredientsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get grams => $composableBuilder(
    column: $table.grams,
    builder: (column) => ColumnOrderings(column),
  );

  $$RecipesTableTableOrderingComposer get recipeId {
    final $$RecipesTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recipeId,
      referencedTable: $db.recipesTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipesTableTableOrderingComposer(
            $db: $db,
            $table: $db.recipesTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$IngredientsTableTableOrderingComposer get ingredientId {
    final $$IngredientsTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ingredientId,
      referencedTable: $db.ingredientsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IngredientsTableTableOrderingComposer(
            $db: $db,
            $table: $db.ingredientsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RecipeIngredientsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $RecipeIngredientsTableTable> {
  $$RecipeIngredientsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get grams =>
      $composableBuilder(column: $table.grams, builder: (column) => column);

  $$RecipesTableTableAnnotationComposer get recipeId {
    final $$RecipesTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recipeId,
      referencedTable: $db.recipesTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipesTableTableAnnotationComposer(
            $db: $db,
            $table: $db.recipesTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$IngredientsTableTableAnnotationComposer get ingredientId {
    final $$IngredientsTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ingredientId,
      referencedTable: $db.ingredientsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IngredientsTableTableAnnotationComposer(
            $db: $db,
            $table: $db.ingredientsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RecipeIngredientsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RecipeIngredientsTableTable,
          RecipeIngredientRow,
          $$RecipeIngredientsTableTableFilterComposer,
          $$RecipeIngredientsTableTableOrderingComposer,
          $$RecipeIngredientsTableTableAnnotationComposer,
          $$RecipeIngredientsTableTableCreateCompanionBuilder,
          $$RecipeIngredientsTableTableUpdateCompanionBuilder,
          (RecipeIngredientRow, $$RecipeIngredientsTableTableReferences),
          RecipeIngredientRow,
          PrefetchHooks Function({bool recipeId, bool ingredientId})
        > {
  $$RecipeIngredientsTableTableTableManager(
    _$AppDatabase db,
    $RecipeIngredientsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RecipeIngredientsTableTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$RecipeIngredientsTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$RecipeIngredientsTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> recipeId = const Value.absent(),
                Value<int> ingredientId = const Value.absent(),
                Value<int> grams = const Value.absent(),
              }) => RecipeIngredientsTableCompanion(
                id: id,
                recipeId: recipeId,
                ingredientId: ingredientId,
                grams: grams,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int recipeId,
                required int ingredientId,
                required int grams,
              }) => RecipeIngredientsTableCompanion.insert(
                id: id,
                recipeId: recipeId,
                ingredientId: ingredientId,
                grams: grams,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<
                    $RecipeIngredientsTableTable,
                    RecipeIngredientRow
                  >(table),
                  $$RecipeIngredientsTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({recipeId = false, ingredientId = false}) {
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
                    if (recipeId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.recipeId,
                        referencedTable: $$RecipeIngredientsTableTableReferences
                            ._recipeIdTable(db),
                        referencedColumn:
                            $$RecipeIngredientsTableTableReferences
                                ._recipeIdTable(db)
                                .id,
                      ) as T;
                    }
                    if (ingredientId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.ingredientId,
                        referencedTable: $$RecipeIngredientsTableTableReferences
                            ._ingredientIdTable(db),
                        referencedColumn:
                            $$RecipeIngredientsTableTableReferences
                                ._ingredientIdTable(db)
                                .id,
                      ) as T;
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

typedef $$RecipeIngredientsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RecipeIngredientsTableTable,
      RecipeIngredientRow,
      $$RecipeIngredientsTableTableFilterComposer,
      $$RecipeIngredientsTableTableOrderingComposer,
      $$RecipeIngredientsTableTableAnnotationComposer,
      $$RecipeIngredientsTableTableCreateCompanionBuilder,
      $$RecipeIngredientsTableTableUpdateCompanionBuilder,
      (RecipeIngredientRow, $$RecipeIngredientsTableTableReferences),
      RecipeIngredientRow,
      PrefetchHooks Function({bool recipeId, bool ingredientId})
    >;
typedef $$RecipeEntriesTableTableCreateCompanionBuilder =
    RecipeEntriesTableCompanion Function({
      Value<int> id,
      required int recipeId,
      required int grams,
    });
typedef $$RecipeEntriesTableTableUpdateCompanionBuilder =
    RecipeEntriesTableCompanion Function({
      Value<int> id,
      Value<int> recipeId,
      Value<int> grams,
    });

final class $$RecipeEntriesTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $RecipeEntriesTableTable,
          RecipeEntryRow
        > {
  $$RecipeEntriesTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $RecipesTableTable _recipeIdTable(_$AppDatabase db) =>
      db.recipesTable.createAlias('recipe_entries__recipe_id__recipes__id');

  $$RecipesTableTableProcessedTableManager get recipeId {
    final $_column = $_itemColumn<int>('recipe_id')!;

    final manager = $$RecipesTableTableTableManager(
      $_db,
      $_db.recipesTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_recipeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$RecipeEntriesTableTableFilterComposer
    extends Composer<_$AppDatabase, $RecipeEntriesTableTable> {
  $$RecipeEntriesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get grams => $composableBuilder(
    column: $table.grams,
    builder: (column) => ColumnFilters(column),
  );

  $$RecipesTableTableFilterComposer get recipeId {
    final $$RecipesTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recipeId,
      referencedTable: $db.recipesTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipesTableTableFilterComposer(
            $db: $db,
            $table: $db.recipesTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RecipeEntriesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $RecipeEntriesTableTable> {
  $$RecipeEntriesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get grams => $composableBuilder(
    column: $table.grams,
    builder: (column) => ColumnOrderings(column),
  );

  $$RecipesTableTableOrderingComposer get recipeId {
    final $$RecipesTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recipeId,
      referencedTable: $db.recipesTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipesTableTableOrderingComposer(
            $db: $db,
            $table: $db.recipesTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RecipeEntriesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $RecipeEntriesTableTable> {
  $$RecipeEntriesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get grams =>
      $composableBuilder(column: $table.grams, builder: (column) => column);

  $$RecipesTableTableAnnotationComposer get recipeId {
    final $$RecipesTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recipeId,
      referencedTable: $db.recipesTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipesTableTableAnnotationComposer(
            $db: $db,
            $table: $db.recipesTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RecipeEntriesTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RecipeEntriesTableTable,
          RecipeEntryRow,
          $$RecipeEntriesTableTableFilterComposer,
          $$RecipeEntriesTableTableOrderingComposer,
          $$RecipeEntriesTableTableAnnotationComposer,
          $$RecipeEntriesTableTableCreateCompanionBuilder,
          $$RecipeEntriesTableTableUpdateCompanionBuilder,
          (RecipeEntryRow, $$RecipeEntriesTableTableReferences),
          RecipeEntryRow,
          PrefetchHooks Function({bool recipeId})
        > {
  $$RecipeEntriesTableTableTableManager(
    _$AppDatabase db,
    $RecipeEntriesTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RecipeEntriesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RecipeEntriesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RecipeEntriesTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> recipeId = const Value.absent(),
                Value<int> grams = const Value.absent(),
              }) => RecipeEntriesTableCompanion(
                id: id,
                recipeId: recipeId,
                grams: grams,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int recipeId,
                required int grams,
              }) => RecipeEntriesTableCompanion.insert(
                id: id,
                recipeId: recipeId,
                grams: grams,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$RecipeEntriesTableTable, RecipeEntryRow>(table),
                  $$RecipeEntriesTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({recipeId = false}) {
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
                    if (recipeId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.recipeId,
                        referencedTable: $$RecipeEntriesTableTableReferences
                            ._recipeIdTable(db),
                        referencedColumn: $$RecipeEntriesTableTableReferences
                            ._recipeIdTable(db)
                            .id,
                      ) as T;
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

typedef $$RecipeEntriesTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RecipeEntriesTableTable,
      RecipeEntryRow,
      $$RecipeEntriesTableTableFilterComposer,
      $$RecipeEntriesTableTableOrderingComposer,
      $$RecipeEntriesTableTableAnnotationComposer,
      $$RecipeEntriesTableTableCreateCompanionBuilder,
      $$RecipeEntriesTableTableUpdateCompanionBuilder,
      (RecipeEntryRow, $$RecipeEntriesTableTableReferences),
      RecipeEntryRow,
      PrefetchHooks Function({bool recipeId})
    >;
typedef $$IngredientMicronutrientsTableTableCreateCompanionBuilder =
    IngredientMicronutrientsTableCompanion Function({
      required int ingredientId,
      required String nutrient,
      required double amount,
      Value<int> rowid,
    });
typedef $$IngredientMicronutrientsTableTableUpdateCompanionBuilder =
    IngredientMicronutrientsTableCompanion Function({
      Value<int> ingredientId,
      Value<String> nutrient,
      Value<double> amount,
      Value<int> rowid,
    });

final class $$IngredientMicronutrientsTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $IngredientMicronutrientsTableTable,
          IngredientMicronutrientRow
        > {
  $$IngredientMicronutrientsTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $IngredientsTableTable _ingredientIdTable(_$AppDatabase db) => db
      .ingredientsTable
      .createAlias('ingredient_micronutrients__ingredient_id__ingredients__id');

  $$IngredientsTableTableProcessedTableManager get ingredientId {
    final $_column = $_itemColumn<int>('ingredient_id')!;

    final manager = $$IngredientsTableTableTableManager(
      $_db,
      $_db.ingredientsTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_ingredientIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$IngredientMicronutrientsTableTableFilterComposer
    extends Composer<_$AppDatabase, $IngredientMicronutrientsTableTable> {
  $$IngredientMicronutrientsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get nutrient => $composableBuilder(
    column: $table.nutrient,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  $$IngredientsTableTableFilterComposer get ingredientId {
    final $$IngredientsTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ingredientId,
      referencedTable: $db.ingredientsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IngredientsTableTableFilterComposer(
            $db: $db,
            $table: $db.ingredientsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$IngredientMicronutrientsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $IngredientMicronutrientsTableTable> {
  $$IngredientMicronutrientsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get nutrient => $composableBuilder(
    column: $table.nutrient,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  $$IngredientsTableTableOrderingComposer get ingredientId {
    final $$IngredientsTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ingredientId,
      referencedTable: $db.ingredientsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IngredientsTableTableOrderingComposer(
            $db: $db,
            $table: $db.ingredientsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$IngredientMicronutrientsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $IngredientMicronutrientsTableTable> {
  $$IngredientMicronutrientsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get nutrient =>
      $composableBuilder(column: $table.nutrient, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  $$IngredientsTableTableAnnotationComposer get ingredientId {
    final $$IngredientsTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ingredientId,
      referencedTable: $db.ingredientsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IngredientsTableTableAnnotationComposer(
            $db: $db,
            $table: $db.ingredientsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$IngredientMicronutrientsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $IngredientMicronutrientsTableTable,
          IngredientMicronutrientRow,
          $$IngredientMicronutrientsTableTableFilterComposer,
          $$IngredientMicronutrientsTableTableOrderingComposer,
          $$IngredientMicronutrientsTableTableAnnotationComposer,
          $$IngredientMicronutrientsTableTableCreateCompanionBuilder,
          $$IngredientMicronutrientsTableTableUpdateCompanionBuilder,
          (
            IngredientMicronutrientRow,
            $$IngredientMicronutrientsTableTableReferences,
          ),
          IngredientMicronutrientRow,
          PrefetchHooks Function({bool ingredientId})
        > {
  $$IngredientMicronutrientsTableTableTableManager(
    _$AppDatabase db,
    $IngredientMicronutrientsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$IngredientMicronutrientsTableTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$IngredientMicronutrientsTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$IngredientMicronutrientsTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> ingredientId = const Value.absent(),
                Value<String> nutrient = const Value.absent(),
                Value<double> amount = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => IngredientMicronutrientsTableCompanion(
                ingredientId: ingredientId,
                nutrient: nutrient,
                amount: amount,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int ingredientId,
                required String nutrient,
                required double amount,
                Value<int> rowid = const Value.absent(),
              }) => IngredientMicronutrientsTableCompanion.insert(
                ingredientId: ingredientId,
                nutrient: nutrient,
                amount: amount,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<
                    $IngredientMicronutrientsTableTable,
                    IngredientMicronutrientRow
                  >(table),
                  $$IngredientMicronutrientsTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({ingredientId = false}) {
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
                    if (ingredientId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.ingredientId,
                        referencedTable:
                            $$IngredientMicronutrientsTableTableReferences
                                ._ingredientIdTable(db),
                        referencedColumn:
                            $$IngredientMicronutrientsTableTableReferences
                                ._ingredientIdTable(db)
                                .id,
                      ) as T;
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

typedef $$IngredientMicronutrientsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $IngredientMicronutrientsTableTable,
      IngredientMicronutrientRow,
      $$IngredientMicronutrientsTableTableFilterComposer,
      $$IngredientMicronutrientsTableTableOrderingComposer,
      $$IngredientMicronutrientsTableTableAnnotationComposer,
      $$IngredientMicronutrientsTableTableCreateCompanionBuilder,
      $$IngredientMicronutrientsTableTableUpdateCompanionBuilder,
      (
        IngredientMicronutrientRow,
        $$IngredientMicronutrientsTableTableReferences,
      ),
      IngredientMicronutrientRow,
      PrefetchHooks Function({bool ingredientId})
    >;
typedef $$SupplementsTableTableCreateCompanionBuilder =
    SupplementsTableCompanion Function({
      Value<int> id,
      required String name,
      required String unit,
    });
typedef $$SupplementsTableTableUpdateCompanionBuilder =
    SupplementsTableCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> unit,
    });

final class $$SupplementsTableTableReferences
    extends
        BaseReferences<_$AppDatabase, $SupplementsTableTable, SupplementRow> {
  $$SupplementsTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<
    $SupplementMicronutrientsTableTable,
    List<SupplementMicronutrientRow>
  >
  _supplementMicronutrientsTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.supplementMicronutrientsTable,
        aliasName: 'supplements__id__supplement_micronutrients__supplement_id',
      );

  $$SupplementMicronutrientsTableTableProcessedTableManager
  get supplementMicronutrientsTableRefs {
    final manager = $$SupplementMicronutrientsTableTableTableManager(
      $_db,
      $_db.supplementMicronutrientsTable,
    ).filter((f) => f.supplementId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _supplementMicronutrientsTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $SupplementEntriesTableTable,
    List<SupplementEntryRow>
  >
  _supplementEntriesTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.supplementEntriesTable,
        aliasName: 'supplements__id__supplement_entries__supplement_id',
      );

  $$SupplementEntriesTableTableProcessedTableManager
  get supplementEntriesTableRefs {
    final manager = $$SupplementEntriesTableTableTableManager(
      $_db,
      $_db.supplementEntriesTable,
    ).filter((f) => f.supplementId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _supplementEntriesTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$SupplementsTableTableFilterComposer
    extends Composer<_$AppDatabase, $SupplementsTableTable> {
  $$SupplementsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get unit => $composableBuilder(
    column: $table.unit,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> supplementMicronutrientsTableRefs(
    Expression<bool> Function(
      $$SupplementMicronutrientsTableTableFilterComposer f,
    )
    f,
  ) {
    final $$SupplementMicronutrientsTableTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.supplementMicronutrientsTable,
          getReferencedColumn: (t) => t.supplementId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$SupplementMicronutrientsTableTableFilterComposer(
                $db: $db,
                $table: $db.supplementMicronutrientsTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<bool> supplementEntriesTableRefs(
    Expression<bool> Function($$SupplementEntriesTableTableFilterComposer f) f,
  ) {
    final $$SupplementEntriesTableTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.supplementEntriesTable,
          getReferencedColumn: (t) => t.supplementId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$SupplementEntriesTableTableFilterComposer(
                $db: $db,
                $table: $db.supplementEntriesTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$SupplementsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $SupplementsTableTable> {
  $$SupplementsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get unit => $composableBuilder(
    column: $table.unit,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SupplementsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $SupplementsTableTable> {
  $$SupplementsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get unit =>
      $composableBuilder(column: $table.unit, builder: (column) => column);

  Expression<T> supplementMicronutrientsTableRefs<T extends Object>(
    Expression<T> Function(
      $$SupplementMicronutrientsTableTableAnnotationComposer a,
    )
    f,
  ) {
    final $$SupplementMicronutrientsTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.supplementMicronutrientsTable,
          getReferencedColumn: (t) => t.supplementId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$SupplementMicronutrientsTableTableAnnotationComposer(
                $db: $db,
                $table: $db.supplementMicronutrientsTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> supplementEntriesTableRefs<T extends Object>(
    Expression<T> Function($$SupplementEntriesTableTableAnnotationComposer a) f,
  ) {
    final $$SupplementEntriesTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.supplementEntriesTable,
          getReferencedColumn: (t) => t.supplementId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$SupplementEntriesTableTableAnnotationComposer(
                $db: $db,
                $table: $db.supplementEntriesTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$SupplementsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SupplementsTableTable,
          SupplementRow,
          $$SupplementsTableTableFilterComposer,
          $$SupplementsTableTableOrderingComposer,
          $$SupplementsTableTableAnnotationComposer,
          $$SupplementsTableTableCreateCompanionBuilder,
          $$SupplementsTableTableUpdateCompanionBuilder,
          (SupplementRow, $$SupplementsTableTableReferences),
          SupplementRow,
          PrefetchHooks Function({
            bool supplementMicronutrientsTableRefs,
            bool supplementEntriesTableRefs,
          })
        > {
  $$SupplementsTableTableTableManager(
    _$AppDatabase db,
    $SupplementsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SupplementsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SupplementsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SupplementsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> unit = const Value.absent(),
          }) => SupplementsTableCompanion(id: id, name: name, unit: unit),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String unit,
              }) => SupplementsTableCompanion.insert(
                id: id,
                name: name,
                unit: unit,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$SupplementsTableTable, SupplementRow>(table),
                  $$SupplementsTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                supplementMicronutrientsTableRefs = false,
                supplementEntriesTableRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (supplementMicronutrientsTableRefs)
                      db.supplementMicronutrientsTable,
                    if (supplementEntriesTableRefs) db.supplementEntriesTable,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (supplementMicronutrientsTableRefs)
                        await $_getPrefetchedDataByColumns<
                          SupplementRow,
                          $SupplementsTableTable,
                          SupplementMicronutrientRow,
                          $SupplementMicronutrientsTableTable
                        >(
                          currentTable: table,
                          referencedTable: $$SupplementsTableTableReferences
                              ._supplementMicronutrientsTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$SupplementsTableTableReferences(
                                db,
                                table,
                                p0,
                              ).supplementMicronutrientsTableRefs,
                          currentColumn: 'id',
                          referencedColumn: 'supplement_id',
                          typedResults: items,
                        ),
                      if (supplementEntriesTableRefs)
                        await $_getPrefetchedDataByColumns<
                          SupplementRow,
                          $SupplementsTableTable,
                          SupplementEntryRow,
                          $SupplementEntriesTableTable
                        >(
                          currentTable: table,
                          referencedTable: $$SupplementsTableTableReferences
                              ._supplementEntriesTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$SupplementsTableTableReferences(
                                db,
                                table,
                                p0,
                              ).supplementEntriesTableRefs,
                          currentColumn: 'id',
                          referencedColumn: 'supplement_id',
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$SupplementsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SupplementsTableTable,
      SupplementRow,
      $$SupplementsTableTableFilterComposer,
      $$SupplementsTableTableOrderingComposer,
      $$SupplementsTableTableAnnotationComposer,
      $$SupplementsTableTableCreateCompanionBuilder,
      $$SupplementsTableTableUpdateCompanionBuilder,
      (SupplementRow, $$SupplementsTableTableReferences),
      SupplementRow,
      PrefetchHooks Function({
        bool supplementMicronutrientsTableRefs,
        bool supplementEntriesTableRefs,
      })
    >;
typedef $$SupplementMicronutrientsTableTableCreateCompanionBuilder =
    SupplementMicronutrientsTableCompanion Function({
      required int supplementId,
      required String nutrient,
      required double amount,
      Value<int> rowid,
    });
typedef $$SupplementMicronutrientsTableTableUpdateCompanionBuilder =
    SupplementMicronutrientsTableCompanion Function({
      Value<int> supplementId,
      Value<String> nutrient,
      Value<double> amount,
      Value<int> rowid,
    });

final class $$SupplementMicronutrientsTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $SupplementMicronutrientsTableTable,
          SupplementMicronutrientRow
        > {
  $$SupplementMicronutrientsTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $SupplementsTableTable _supplementIdTable(_$AppDatabase db) => db
      .supplementsTable
      .createAlias('supplement_micronutrients__supplement_id__supplements__id');

  $$SupplementsTableTableProcessedTableManager get supplementId {
    final $_column = $_itemColumn<int>('supplement_id')!;

    final manager = $$SupplementsTableTableTableManager(
      $_db,
      $_db.supplementsTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_supplementIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$SupplementMicronutrientsTableTableFilterComposer
    extends Composer<_$AppDatabase, $SupplementMicronutrientsTableTable> {
  $$SupplementMicronutrientsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get nutrient => $composableBuilder(
    column: $table.nutrient,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  $$SupplementsTableTableFilterComposer get supplementId {
    final $$SupplementsTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.supplementId,
      referencedTable: $db.supplementsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SupplementsTableTableFilterComposer(
            $db: $db,
            $table: $db.supplementsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SupplementMicronutrientsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $SupplementMicronutrientsTableTable> {
  $$SupplementMicronutrientsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get nutrient => $composableBuilder(
    column: $table.nutrient,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  $$SupplementsTableTableOrderingComposer get supplementId {
    final $$SupplementsTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.supplementId,
      referencedTable: $db.supplementsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SupplementsTableTableOrderingComposer(
            $db: $db,
            $table: $db.supplementsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SupplementMicronutrientsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $SupplementMicronutrientsTableTable> {
  $$SupplementMicronutrientsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get nutrient =>
      $composableBuilder(column: $table.nutrient, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  $$SupplementsTableTableAnnotationComposer get supplementId {
    final $$SupplementsTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.supplementId,
      referencedTable: $db.supplementsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SupplementsTableTableAnnotationComposer(
            $db: $db,
            $table: $db.supplementsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SupplementMicronutrientsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SupplementMicronutrientsTableTable,
          SupplementMicronutrientRow,
          $$SupplementMicronutrientsTableTableFilterComposer,
          $$SupplementMicronutrientsTableTableOrderingComposer,
          $$SupplementMicronutrientsTableTableAnnotationComposer,
          $$SupplementMicronutrientsTableTableCreateCompanionBuilder,
          $$SupplementMicronutrientsTableTableUpdateCompanionBuilder,
          (
            SupplementMicronutrientRow,
            $$SupplementMicronutrientsTableTableReferences,
          ),
          SupplementMicronutrientRow,
          PrefetchHooks Function({bool supplementId})
        > {
  $$SupplementMicronutrientsTableTableTableManager(
    _$AppDatabase db,
    $SupplementMicronutrientsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SupplementMicronutrientsTableTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$SupplementMicronutrientsTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$SupplementMicronutrientsTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> supplementId = const Value.absent(),
                Value<String> nutrient = const Value.absent(),
                Value<double> amount = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SupplementMicronutrientsTableCompanion(
                supplementId: supplementId,
                nutrient: nutrient,
                amount: amount,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int supplementId,
                required String nutrient,
                required double amount,
                Value<int> rowid = const Value.absent(),
              }) => SupplementMicronutrientsTableCompanion.insert(
                supplementId: supplementId,
                nutrient: nutrient,
                amount: amount,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<
                    $SupplementMicronutrientsTableTable,
                    SupplementMicronutrientRow
                  >(table),
                  $$SupplementMicronutrientsTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({supplementId = false}) {
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
                    if (supplementId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.supplementId,
                        referencedTable:
                            $$SupplementMicronutrientsTableTableReferences
                                ._supplementIdTable(db),
                        referencedColumn:
                            $$SupplementMicronutrientsTableTableReferences
                                ._supplementIdTable(db)
                                .id,
                      ) as T;
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

typedef $$SupplementMicronutrientsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SupplementMicronutrientsTableTable,
      SupplementMicronutrientRow,
      $$SupplementMicronutrientsTableTableFilterComposer,
      $$SupplementMicronutrientsTableTableOrderingComposer,
      $$SupplementMicronutrientsTableTableAnnotationComposer,
      $$SupplementMicronutrientsTableTableCreateCompanionBuilder,
      $$SupplementMicronutrientsTableTableUpdateCompanionBuilder,
      (
        SupplementMicronutrientRow,
        $$SupplementMicronutrientsTableTableReferences,
      ),
      SupplementMicronutrientRow,
      PrefetchHooks Function({bool supplementId})
    >;
typedef $$SupplementEntriesTableTableCreateCompanionBuilder =
    SupplementEntriesTableCompanion Function({
      Value<int> id,
      required int supplementId,
      required double units,
    });
typedef $$SupplementEntriesTableTableUpdateCompanionBuilder =
    SupplementEntriesTableCompanion Function({
      Value<int> id,
      Value<int> supplementId,
      Value<double> units,
    });

final class $$SupplementEntriesTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $SupplementEntriesTableTable,
          SupplementEntryRow
        > {
  $$SupplementEntriesTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $SupplementsTableTable _supplementIdTable(_$AppDatabase db) => db
      .supplementsTable
      .createAlias('supplement_entries__supplement_id__supplements__id');

  $$SupplementsTableTableProcessedTableManager get supplementId {
    final $_column = $_itemColumn<int>('supplement_id')!;

    final manager = $$SupplementsTableTableTableManager(
      $_db,
      $_db.supplementsTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_supplementIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$SupplementEntriesTableTableFilterComposer
    extends Composer<_$AppDatabase, $SupplementEntriesTableTable> {
  $$SupplementEntriesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get units => $composableBuilder(
    column: $table.units,
    builder: (column) => ColumnFilters(column),
  );

  $$SupplementsTableTableFilterComposer get supplementId {
    final $$SupplementsTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.supplementId,
      referencedTable: $db.supplementsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SupplementsTableTableFilterComposer(
            $db: $db,
            $table: $db.supplementsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SupplementEntriesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $SupplementEntriesTableTable> {
  $$SupplementEntriesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get units => $composableBuilder(
    column: $table.units,
    builder: (column) => ColumnOrderings(column),
  );

  $$SupplementsTableTableOrderingComposer get supplementId {
    final $$SupplementsTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.supplementId,
      referencedTable: $db.supplementsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SupplementsTableTableOrderingComposer(
            $db: $db,
            $table: $db.supplementsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SupplementEntriesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $SupplementEntriesTableTable> {
  $$SupplementEntriesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get units =>
      $composableBuilder(column: $table.units, builder: (column) => column);

  $$SupplementsTableTableAnnotationComposer get supplementId {
    final $$SupplementsTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.supplementId,
      referencedTable: $db.supplementsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SupplementsTableTableAnnotationComposer(
            $db: $db,
            $table: $db.supplementsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SupplementEntriesTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SupplementEntriesTableTable,
          SupplementEntryRow,
          $$SupplementEntriesTableTableFilterComposer,
          $$SupplementEntriesTableTableOrderingComposer,
          $$SupplementEntriesTableTableAnnotationComposer,
          $$SupplementEntriesTableTableCreateCompanionBuilder,
          $$SupplementEntriesTableTableUpdateCompanionBuilder,
          (SupplementEntryRow, $$SupplementEntriesTableTableReferences),
          SupplementEntryRow,
          PrefetchHooks Function({bool supplementId})
        > {
  $$SupplementEntriesTableTableTableManager(
    _$AppDatabase db,
    $SupplementEntriesTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SupplementEntriesTableTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$SupplementEntriesTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$SupplementEntriesTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> supplementId = const Value.absent(),
                Value<double> units = const Value.absent(),
              }) => SupplementEntriesTableCompanion(
                id: id,
                supplementId: supplementId,
                units: units,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int supplementId,
                required double units,
              }) => SupplementEntriesTableCompanion.insert(
                id: id,
                supplementId: supplementId,
                units: units,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$SupplementEntriesTableTable, SupplementEntryRow>(
                    table,
                  ),
                  $$SupplementEntriesTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({supplementId = false}) {
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
                    if (supplementId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.supplementId,
                        referencedTable: $$SupplementEntriesTableTableReferences
                            ._supplementIdTable(db),
                        referencedColumn:
                            $$SupplementEntriesTableTableReferences
                                ._supplementIdTable(db)
                                .id,
                      ) as T;
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

typedef $$SupplementEntriesTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SupplementEntriesTableTable,
      SupplementEntryRow,
      $$SupplementEntriesTableTableFilterComposer,
      $$SupplementEntriesTableTableOrderingComposer,
      $$SupplementEntriesTableTableAnnotationComposer,
      $$SupplementEntriesTableTableCreateCompanionBuilder,
      $$SupplementEntriesTableTableUpdateCompanionBuilder,
      (SupplementEntryRow, $$SupplementEntriesTableTableReferences),
      SupplementEntryRow,
      PrefetchHooks Function({bool supplementId})
    >;
typedef $$DayLogMicronutrientsTableTableCreateCompanionBuilder =
    DayLogMicronutrientsTableCompanion Function({
      required int dayLogId,
      required String nutrient,
      Value<double?> foodAmount,
      Value<double?> supplementAmount,
      required double coverage,
      Value<int> rowid,
    });
typedef $$DayLogMicronutrientsTableTableUpdateCompanionBuilder =
    DayLogMicronutrientsTableCompanion Function({
      Value<int> dayLogId,
      Value<String> nutrient,
      Value<double?> foodAmount,
      Value<double?> supplementAmount,
      Value<double> coverage,
      Value<int> rowid,
    });

final class $$DayLogMicronutrientsTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $DayLogMicronutrientsTableTable,
          DayLogMicronutrientRow
        > {
  $$DayLogMicronutrientsTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $DayLogsTableTable _dayLogIdTable(_$AppDatabase db) => db.dayLogsTable
      .createAlias('day_log_micronutrients__day_log_id__day_logs__id');

  $$DayLogsTableTableProcessedTableManager get dayLogId {
    final $_column = $_itemColumn<int>('day_log_id')!;

    final manager = $$DayLogsTableTableTableManager(
      $_db,
      $_db.dayLogsTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_dayLogIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$DayLogMicronutrientsTableTableFilterComposer
    extends Composer<_$AppDatabase, $DayLogMicronutrientsTableTable> {
  $$DayLogMicronutrientsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get nutrient => $composableBuilder(
    column: $table.nutrient,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get foodAmount => $composableBuilder(
    column: $table.foodAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get supplementAmount => $composableBuilder(
    column: $table.supplementAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get coverage => $composableBuilder(
    column: $table.coverage,
    builder: (column) => ColumnFilters(column),
  );

  $$DayLogsTableTableFilterComposer get dayLogId {
    final $$DayLogsTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dayLogId,
      referencedTable: $db.dayLogsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DayLogsTableTableFilterComposer(
            $db: $db,
            $table: $db.dayLogsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DayLogMicronutrientsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $DayLogMicronutrientsTableTable> {
  $$DayLogMicronutrientsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get nutrient => $composableBuilder(
    column: $table.nutrient,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get foodAmount => $composableBuilder(
    column: $table.foodAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get supplementAmount => $composableBuilder(
    column: $table.supplementAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get coverage => $composableBuilder(
    column: $table.coverage,
    builder: (column) => ColumnOrderings(column),
  );

  $$DayLogsTableTableOrderingComposer get dayLogId {
    final $$DayLogsTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dayLogId,
      referencedTable: $db.dayLogsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DayLogsTableTableOrderingComposer(
            $db: $db,
            $table: $db.dayLogsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DayLogMicronutrientsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $DayLogMicronutrientsTableTable> {
  $$DayLogMicronutrientsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get nutrient =>
      $composableBuilder(column: $table.nutrient, builder: (column) => column);

  GeneratedColumn<double> get foodAmount => $composableBuilder(
    column: $table.foodAmount,
    builder: (column) => column,
  );

  GeneratedColumn<double> get supplementAmount => $composableBuilder(
    column: $table.supplementAmount,
    builder: (column) => column,
  );

  GeneratedColumn<double> get coverage =>
      $composableBuilder(column: $table.coverage, builder: (column) => column);

  $$DayLogsTableTableAnnotationComposer get dayLogId {
    final $$DayLogsTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dayLogId,
      referencedTable: $db.dayLogsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DayLogsTableTableAnnotationComposer(
            $db: $db,
            $table: $db.dayLogsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DayLogMicronutrientsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DayLogMicronutrientsTableTable,
          DayLogMicronutrientRow,
          $$DayLogMicronutrientsTableTableFilterComposer,
          $$DayLogMicronutrientsTableTableOrderingComposer,
          $$DayLogMicronutrientsTableTableAnnotationComposer,
          $$DayLogMicronutrientsTableTableCreateCompanionBuilder,
          $$DayLogMicronutrientsTableTableUpdateCompanionBuilder,
          (DayLogMicronutrientRow, $$DayLogMicronutrientsTableTableReferences),
          DayLogMicronutrientRow,
          PrefetchHooks Function({bool dayLogId})
        > {
  $$DayLogMicronutrientsTableTableTableManager(
    _$AppDatabase db,
    $DayLogMicronutrientsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DayLogMicronutrientsTableTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$DayLogMicronutrientsTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$DayLogMicronutrientsTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> dayLogId = const Value.absent(),
                Value<String> nutrient = const Value.absent(),
                Value<double?> foodAmount = const Value.absent(),
                Value<double?> supplementAmount = const Value.absent(),
                Value<double> coverage = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DayLogMicronutrientsTableCompanion(
                dayLogId: dayLogId,
                nutrient: nutrient,
                foodAmount: foodAmount,
                supplementAmount: supplementAmount,
                coverage: coverage,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int dayLogId,
                required String nutrient,
                Value<double?> foodAmount = const Value.absent(),
                Value<double?> supplementAmount = const Value.absent(),
                required double coverage,
                Value<int> rowid = const Value.absent(),
              }) => DayLogMicronutrientsTableCompanion.insert(
                dayLogId: dayLogId,
                nutrient: nutrient,
                foodAmount: foodAmount,
                supplementAmount: supplementAmount,
                coverage: coverage,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<
                    $DayLogMicronutrientsTableTable,
                    DayLogMicronutrientRow
                  >(table),
                  $$DayLogMicronutrientsTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({dayLogId = false}) {
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
                    if (dayLogId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.dayLogId,
                        referencedTable:
                            $$DayLogMicronutrientsTableTableReferences
                                ._dayLogIdTable(db),
                        referencedColumn:
                            $$DayLogMicronutrientsTableTableReferences
                                ._dayLogIdTable(db)
                                .id,
                      ) as T;
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

typedef $$DayLogMicronutrientsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DayLogMicronutrientsTableTable,
      DayLogMicronutrientRow,
      $$DayLogMicronutrientsTableTableFilterComposer,
      $$DayLogMicronutrientsTableTableOrderingComposer,
      $$DayLogMicronutrientsTableTableAnnotationComposer,
      $$DayLogMicronutrientsTableTableCreateCompanionBuilder,
      $$DayLogMicronutrientsTableTableUpdateCompanionBuilder,
      (DayLogMicronutrientRow, $$DayLogMicronutrientsTableTableReferences),
      DayLogMicronutrientRow,
      PrefetchHooks Function({bool dayLogId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$SettingsTableTableManager get settings =>
      $$SettingsTableTableManager(_db, _db.settings);
  $$ProfileTableTableTableManager get profileTable =>
      $$ProfileTableTableTableManager(_db, _db.profileTable);
  $$ActivitiesTableTableTableManager get activitiesTable =>
      $$ActivitiesTableTableTableManager(_db, _db.activitiesTable);
  $$ActivityEntriesTableTableTableManager get activityEntriesTable =>
      $$ActivityEntriesTableTableTableManager(_db, _db.activityEntriesTable);
  $$IngredientsTableTableTableManager get ingredientsTable =>
      $$IngredientsTableTableTableManager(_db, _db.ingredientsTable);
  $$FoodEntriesTableTableTableManager get foodEntriesTable =>
      $$FoodEntriesTableTableTableManager(_db, _db.foodEntriesTable);
  $$DayLogsTableTableTableManager get dayLogsTable =>
      $$DayLogsTableTableTableManager(_db, _db.dayLogsTable);
  $$RecipesTableTableTableManager get recipesTable =>
      $$RecipesTableTableTableManager(_db, _db.recipesTable);
  $$RecipeIngredientsTableTableTableManager get recipeIngredientsTable =>
      $$RecipeIngredientsTableTableTableManager(
        _db,
        _db.recipeIngredientsTable,
      );
  $$RecipeEntriesTableTableTableManager get recipeEntriesTable =>
      $$RecipeEntriesTableTableTableManager(_db, _db.recipeEntriesTable);
  $$IngredientMicronutrientsTableTableTableManager
  get ingredientMicronutrientsTable =>
      $$IngredientMicronutrientsTableTableTableManager(
        _db,
        _db.ingredientMicronutrientsTable,
      );
  $$SupplementsTableTableTableManager get supplementsTable =>
      $$SupplementsTableTableTableManager(_db, _db.supplementsTable);
  $$SupplementMicronutrientsTableTableTableManager
  get supplementMicronutrientsTable =>
      $$SupplementMicronutrientsTableTableTableManager(
        _db,
        _db.supplementMicronutrientsTable,
      );
  $$SupplementEntriesTableTableTableManager get supplementEntriesTable =>
      $$SupplementEntriesTableTableTableManager(
        _db,
        _db.supplementEntriesTable,
      );
  $$DayLogMicronutrientsTableTableTableManager get dayLogMicronutrientsTable =>
      $$DayLogMicronutrientsTableTableTableManager(
        _db,
        _db.dayLogMicronutrientsTable,
      );
}
