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
  @override
  List<GeneratedColumn> get $columns => [id, localeCode];
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
  const Setting({required this.id, this.localeCode});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || localeCode != null) {
      map['locale_code'] = Variable<String>(localeCode);
    }
    return map;
  }

  SettingsCompanion toCompanion(bool nullToAbsent) {
    return SettingsCompanion(
      id: Value(id),
      localeCode: localeCode == null && nullToAbsent
          ? const Value.absent()
          : Value(localeCode),
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
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'localeCode': serializer.toJson<String?>(localeCode),
    };
  }

  Setting copyWith({
    int? id,
    Value<String?> localeCode = const Value.absent(),
  }) => Setting(
    id: id ?? this.id,
    localeCode: localeCode.present ? localeCode.value : this.localeCode,
  );
  Setting copyWithCompanion(SettingsCompanion data) {
    return Setting(
      id: data.id.present ? data.id.value : this.id,
      localeCode: data.localeCode.present
          ? data.localeCode.value
          : this.localeCode,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Setting(')
          ..write('id: $id, ')
          ..write('localeCode: $localeCode')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, localeCode);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Setting &&
          other.id == this.id &&
          other.localeCode == this.localeCode);
}

class SettingsCompanion extends UpdateCompanion<Setting> {
  final Value<int> id;
  final Value<String?> localeCode;
  const SettingsCompanion({
    this.id = const Value.absent(),
    this.localeCode = const Value.absent(),
  });
  SettingsCompanion.insert({
    this.id = const Value.absent(),
    this.localeCode = const Value.absent(),
  });
  static Insertable<Setting> custom({
    Expression<int>? id,
    Expression<String>? localeCode,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (localeCode != null) 'locale_code': localeCode,
    });
  }

  SettingsCompanion copyWith({Value<int>? id, Value<String?>? localeCode}) {
    return SettingsCompanion(
      id: id ?? this.id,
      localeCode: localeCode ?? this.localeCode,
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SettingsCompanion(')
          ..write('id: $id, ')
          ..write('localeCode: $localeCode')
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
          ..write('heightCm: $heightCm')
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
          other.heightCm == this.heightCm);
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
          ..write('heightCm: $heightCm')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $SettingsTable settings = $SettingsTable(this);
  late final $ProfileTableTable profileTable = $ProfileTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [settings, profileTable];
  @override
  DriftDatabaseOptions get options =>
      const DriftDatabaseOptions(storeDateTimeAsText: true);
}

typedef $$SettingsTableCreateCompanionBuilder = SettingsCompanion Function({
  Value<int> id,
  Value<String?> localeCode,
});
typedef $$SettingsTableUpdateCompanionBuilder = SettingsCompanion Function({
  Value<int> id,
  Value<String?> localeCode,
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
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> localeCode = const Value.absent(),
          }) => SettingsCompanion(id: id, localeCode: localeCode),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> localeCode = const Value.absent(),
          }) => SettingsCompanion.insert(id: id, localeCode: localeCode),
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

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$SettingsTableTableManager get settings =>
      $$SettingsTableTableManager(_db, _db.settings);
  $$ProfileTableTableTableManager get profileTable =>
      $$ProfileTableTableTableManager(_db, _db.profileTable);
}
