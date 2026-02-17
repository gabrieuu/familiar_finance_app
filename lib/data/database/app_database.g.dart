// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $CreditcardEntityTable extends CreditcardEntity
    with TableInfo<$CreditcardEntityTable, CreditcardEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CreditcardEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _needToSyncMeta = const VerificationMeta(
    'needToSync',
  );
  @override
  late final GeneratedColumn<bool> needToSync = GeneratedColumn<bool>(
    'need_to_sync',
    aliasedName,
    true,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("need_to_sync" IN (0, 1))',
    ),
  );
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
  static const VerificationMeta _idDomainMeta = const VerificationMeta(
    'idDomain',
  );
  @override
  late final GeneratedColumn<String> idDomain = GeneratedColumn<String>(
    'id_domain',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
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
  static const VerificationMeta _closingDayMeta = const VerificationMeta(
    'closingDay',
  );
  @override
  late final GeneratedColumn<int> closingDay = GeneratedColumn<int>(
    'closing_day',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dueDayMeta = const VerificationMeta('dueDay');
  @override
  late final GeneratedColumn<int> dueDay = GeneratedColumn<int>(
    'due_day',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    updatedAt,
    deletedAt,
    needToSync,
    id,
    idDomain,
    name,
    closingDay,
    dueDay,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'creditcard_entity';
  @override
  VerificationContext validateIntegrity(
    Insertable<CreditcardEntityData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('need_to_sync')) {
      context.handle(
        _needToSyncMeta,
        needToSync.isAcceptableOrUnknown(
          data['need_to_sync']!,
          _needToSyncMeta,
        ),
      );
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('id_domain')) {
      context.handle(
        _idDomainMeta,
        idDomain.isAcceptableOrUnknown(data['id_domain']!, _idDomainMeta),
      );
    } else if (isInserting) {
      context.missing(_idDomainMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('closing_day')) {
      context.handle(
        _closingDayMeta,
        closingDay.isAcceptableOrUnknown(data['closing_day']!, _closingDayMeta),
      );
    } else if (isInserting) {
      context.missing(_closingDayMeta);
    }
    if (data.containsKey('due_day')) {
      context.handle(
        _dueDayMeta,
        dueDay.isAcceptableOrUnknown(data['due_day']!, _dueDayMeta),
      );
    } else if (isInserting) {
      context.missing(_dueDayMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CreditcardEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CreditcardEntityData(
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      needToSync: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}need_to_sync'],
      ),
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      idDomain: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id_domain'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      closingDay: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}closing_day'],
      )!,
      dueDay: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}due_day'],
      )!,
    );
  }

  @override
  $CreditcardEntityTable createAlias(String alias) {
    return $CreditcardEntityTable(attachedDatabase, alias);
  }
}

class CreditcardEntityData extends DataClass
    implements Insertable<CreditcardEntityData> {
  final DateTime? updatedAt;
  final DateTime? deletedAt;
  final bool? needToSync;
  final int id;
  final String idDomain;
  final String name;
  final int closingDay;
  final int dueDay;
  const CreditcardEntityData({
    this.updatedAt,
    this.deletedAt,
    this.needToSync,
    required this.id,
    required this.idDomain,
    required this.name,
    required this.closingDay,
    required this.dueDay,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    if (!nullToAbsent || needToSync != null) {
      map['need_to_sync'] = Variable<bool>(needToSync);
    }
    map['id'] = Variable<int>(id);
    map['id_domain'] = Variable<String>(idDomain);
    map['name'] = Variable<String>(name);
    map['closing_day'] = Variable<int>(closingDay);
    map['due_day'] = Variable<int>(dueDay);
    return map;
  }

  CreditcardEntityCompanion toCompanion(bool nullToAbsent) {
    return CreditcardEntityCompanion(
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      needToSync: needToSync == null && nullToAbsent
          ? const Value.absent()
          : Value(needToSync),
      id: Value(id),
      idDomain: Value(idDomain),
      name: Value(name),
      closingDay: Value(closingDay),
      dueDay: Value(dueDay),
    );
  }

  factory CreditcardEntityData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CreditcardEntityData(
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      needToSync: serializer.fromJson<bool?>(json['needToSync']),
      id: serializer.fromJson<int>(json['id']),
      idDomain: serializer.fromJson<String>(json['idDomain']),
      name: serializer.fromJson<String>(json['name']),
      closingDay: serializer.fromJson<int>(json['closingDay']),
      dueDay: serializer.fromJson<int>(json['dueDay']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'needToSync': serializer.toJson<bool?>(needToSync),
      'id': serializer.toJson<int>(id),
      'idDomain': serializer.toJson<String>(idDomain),
      'name': serializer.toJson<String>(name),
      'closingDay': serializer.toJson<int>(closingDay),
      'dueDay': serializer.toJson<int>(dueDay),
    };
  }

  CreditcardEntityData copyWith({
    Value<DateTime?> updatedAt = const Value.absent(),
    Value<DateTime?> deletedAt = const Value.absent(),
    Value<bool?> needToSync = const Value.absent(),
    int? id,
    String? idDomain,
    String? name,
    int? closingDay,
    int? dueDay,
  }) => CreditcardEntityData(
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    needToSync: needToSync.present ? needToSync.value : this.needToSync,
    id: id ?? this.id,
    idDomain: idDomain ?? this.idDomain,
    name: name ?? this.name,
    closingDay: closingDay ?? this.closingDay,
    dueDay: dueDay ?? this.dueDay,
  );
  CreditcardEntityData copyWithCompanion(CreditcardEntityCompanion data) {
    return CreditcardEntityData(
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      needToSync: data.needToSync.present
          ? data.needToSync.value
          : this.needToSync,
      id: data.id.present ? data.id.value : this.id,
      idDomain: data.idDomain.present ? data.idDomain.value : this.idDomain,
      name: data.name.present ? data.name.value : this.name,
      closingDay: data.closingDay.present
          ? data.closingDay.value
          : this.closingDay,
      dueDay: data.dueDay.present ? data.dueDay.value : this.dueDay,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CreditcardEntityData(')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('needToSync: $needToSync, ')
          ..write('id: $id, ')
          ..write('idDomain: $idDomain, ')
          ..write('name: $name, ')
          ..write('closingDay: $closingDay, ')
          ..write('dueDay: $dueDay')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    updatedAt,
    deletedAt,
    needToSync,
    id,
    idDomain,
    name,
    closingDay,
    dueDay,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CreditcardEntityData &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.needToSync == this.needToSync &&
          other.id == this.id &&
          other.idDomain == this.idDomain &&
          other.name == this.name &&
          other.closingDay == this.closingDay &&
          other.dueDay == this.dueDay);
}

class CreditcardEntityCompanion extends UpdateCompanion<CreditcardEntityData> {
  final Value<DateTime?> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<bool?> needToSync;
  final Value<int> id;
  final Value<String> idDomain;
  final Value<String> name;
  final Value<int> closingDay;
  final Value<int> dueDay;
  const CreditcardEntityCompanion({
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.needToSync = const Value.absent(),
    this.id = const Value.absent(),
    this.idDomain = const Value.absent(),
    this.name = const Value.absent(),
    this.closingDay = const Value.absent(),
    this.dueDay = const Value.absent(),
  });
  CreditcardEntityCompanion.insert({
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.needToSync = const Value.absent(),
    this.id = const Value.absent(),
    required String idDomain,
    required String name,
    required int closingDay,
    required int dueDay,
  }) : idDomain = Value(idDomain),
       name = Value(name),
       closingDay = Value(closingDay),
       dueDay = Value(dueDay);
  static Insertable<CreditcardEntityData> custom({
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<bool>? needToSync,
    Expression<int>? id,
    Expression<String>? idDomain,
    Expression<String>? name,
    Expression<int>? closingDay,
    Expression<int>? dueDay,
  }) {
    return RawValuesInsertable({
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (needToSync != null) 'need_to_sync': needToSync,
      if (id != null) 'id': id,
      if (idDomain != null) 'id_domain': idDomain,
      if (name != null) 'name': name,
      if (closingDay != null) 'closing_day': closingDay,
      if (dueDay != null) 'due_day': dueDay,
    });
  }

  CreditcardEntityCompanion copyWith({
    Value<DateTime?>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<bool?>? needToSync,
    Value<int>? id,
    Value<String>? idDomain,
    Value<String>? name,
    Value<int>? closingDay,
    Value<int>? dueDay,
  }) {
    return CreditcardEntityCompanion(
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      needToSync: needToSync ?? this.needToSync,
      id: id ?? this.id,
      idDomain: idDomain ?? this.idDomain,
      name: name ?? this.name,
      closingDay: closingDay ?? this.closingDay,
      dueDay: dueDay ?? this.dueDay,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (needToSync.present) {
      map['need_to_sync'] = Variable<bool>(needToSync.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (idDomain.present) {
      map['id_domain'] = Variable<String>(idDomain.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (closingDay.present) {
      map['closing_day'] = Variable<int>(closingDay.value);
    }
    if (dueDay.present) {
      map['due_day'] = Variable<int>(dueDay.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CreditcardEntityCompanion(')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('needToSync: $needToSync, ')
          ..write('id: $id, ')
          ..write('idDomain: $idDomain, ')
          ..write('name: $name, ')
          ..write('closingDay: $closingDay, ')
          ..write('dueDay: $dueDay')
          ..write(')'))
        .toString();
  }
}

class $PurchaseEntityTable extends PurchaseEntity
    with TableInfo<$PurchaseEntityTable, PurchaseEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PurchaseEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _needToSyncMeta = const VerificationMeta(
    'needToSync',
  );
  @override
  late final GeneratedColumn<bool> needToSync = GeneratedColumn<bool>(
    'need_to_sync',
    aliasedName,
    true,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("need_to_sync" IN (0, 1))',
    ),
  );
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
  static const VerificationMeta _idDomainMeta = const VerificationMeta(
    'idDomain',
  );
  @override
  late final GeneratedColumn<String> idDomain = GeneratedColumn<String>(
    'id_domain',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _creditCardIdMeta = const VerificationMeta(
    'creditCardId',
  );
  @override
  late final GeneratedColumn<int> creditCardId = GeneratedColumn<int>(
    'credit_card_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES creditcard_entity (id)',
    ),
  );
  static const VerificationMeta _creditCardIdDomainMeta =
      const VerificationMeta('creditCardIdDomain');
  @override
  late final GeneratedColumn<String> creditCardIdDomain =
      GeneratedColumn<String>(
        'credit_card_id_domain',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _numberOfInstallmentsMeta =
      const VerificationMeta('numberOfInstallments');
  @override
  late final GeneratedColumn<int> numberOfInstallments = GeneratedColumn<int>(
    'number_of_installments',
    aliasedName,
    false,
    type: DriftSqlType.int,
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
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _finalizedAtMeta = const VerificationMeta(
    'finalizedAt',
  );
  @override
  late final GeneratedColumn<DateTime> finalizedAt = GeneratedColumn<DateTime>(
    'finalized_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    updatedAt,
    deletedAt,
    needToSync,
    id,
    idDomain,
    creditCardId,
    creditCardIdDomain,
    title,
    type,
    numberOfInstallments,
    amount,
    createdAt,
    finalizedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'purchase_entity';
  @override
  VerificationContext validateIntegrity(
    Insertable<PurchaseEntityData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('need_to_sync')) {
      context.handle(
        _needToSyncMeta,
        needToSync.isAcceptableOrUnknown(
          data['need_to_sync']!,
          _needToSyncMeta,
        ),
      );
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('id_domain')) {
      context.handle(
        _idDomainMeta,
        idDomain.isAcceptableOrUnknown(data['id_domain']!, _idDomainMeta),
      );
    } else if (isInserting) {
      context.missing(_idDomainMeta);
    }
    if (data.containsKey('credit_card_id')) {
      context.handle(
        _creditCardIdMeta,
        creditCardId.isAcceptableOrUnknown(
          data['credit_card_id']!,
          _creditCardIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_creditCardIdMeta);
    }
    if (data.containsKey('credit_card_id_domain')) {
      context.handle(
        _creditCardIdDomainMeta,
        creditCardIdDomain.isAcceptableOrUnknown(
          data['credit_card_id_domain']!,
          _creditCardIdDomainMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_creditCardIdDomainMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('number_of_installments')) {
      context.handle(
        _numberOfInstallmentsMeta,
        numberOfInstallments.isAcceptableOrUnknown(
          data['number_of_installments']!,
          _numberOfInstallmentsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_numberOfInstallmentsMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('finalized_at')) {
      context.handle(
        _finalizedAtMeta,
        finalizedAt.isAcceptableOrUnknown(
          data['finalized_at']!,
          _finalizedAtMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PurchaseEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PurchaseEntityData(
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      needToSync: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}need_to_sync'],
      ),
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      idDomain: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id_domain'],
      )!,
      creditCardId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}credit_card_id'],
      )!,
      creditCardIdDomain: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}credit_card_id_domain'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      numberOfInstallments: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}number_of_installments'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}amount'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      finalizedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}finalized_at'],
      ),
    );
  }

  @override
  $PurchaseEntityTable createAlias(String alias) {
    return $PurchaseEntityTable(attachedDatabase, alias);
  }
}

class PurchaseEntityData extends DataClass
    implements Insertable<PurchaseEntityData> {
  final DateTime? updatedAt;
  final DateTime? deletedAt;
  final bool? needToSync;
  final int id;
  final String idDomain;
  final int creditCardId;
  final String creditCardIdDomain;
  final String title;
  final String type;
  final int numberOfInstallments;
  final double amount;
  final DateTime createdAt;
  final DateTime? finalizedAt;
  const PurchaseEntityData({
    this.updatedAt,
    this.deletedAt,
    this.needToSync,
    required this.id,
    required this.idDomain,
    required this.creditCardId,
    required this.creditCardIdDomain,
    required this.title,
    required this.type,
    required this.numberOfInstallments,
    required this.amount,
    required this.createdAt,
    this.finalizedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    if (!nullToAbsent || needToSync != null) {
      map['need_to_sync'] = Variable<bool>(needToSync);
    }
    map['id'] = Variable<int>(id);
    map['id_domain'] = Variable<String>(idDomain);
    map['credit_card_id'] = Variable<int>(creditCardId);
    map['credit_card_id_domain'] = Variable<String>(creditCardIdDomain);
    map['title'] = Variable<String>(title);
    map['type'] = Variable<String>(type);
    map['number_of_installments'] = Variable<int>(numberOfInstallments);
    map['amount'] = Variable<double>(amount);
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || finalizedAt != null) {
      map['finalized_at'] = Variable<DateTime>(finalizedAt);
    }
    return map;
  }

  PurchaseEntityCompanion toCompanion(bool nullToAbsent) {
    return PurchaseEntityCompanion(
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      needToSync: needToSync == null && nullToAbsent
          ? const Value.absent()
          : Value(needToSync),
      id: Value(id),
      idDomain: Value(idDomain),
      creditCardId: Value(creditCardId),
      creditCardIdDomain: Value(creditCardIdDomain),
      title: Value(title),
      type: Value(type),
      numberOfInstallments: Value(numberOfInstallments),
      amount: Value(amount),
      createdAt: Value(createdAt),
      finalizedAt: finalizedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(finalizedAt),
    );
  }

  factory PurchaseEntityData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PurchaseEntityData(
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      needToSync: serializer.fromJson<bool?>(json['needToSync']),
      id: serializer.fromJson<int>(json['id']),
      idDomain: serializer.fromJson<String>(json['idDomain']),
      creditCardId: serializer.fromJson<int>(json['creditCardId']),
      creditCardIdDomain: serializer.fromJson<String>(
        json['creditCardIdDomain'],
      ),
      title: serializer.fromJson<String>(json['title']),
      type: serializer.fromJson<String>(json['type']),
      numberOfInstallments: serializer.fromJson<int>(
        json['numberOfInstallments'],
      ),
      amount: serializer.fromJson<double>(json['amount']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      finalizedAt: serializer.fromJson<DateTime?>(json['finalizedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'needToSync': serializer.toJson<bool?>(needToSync),
      'id': serializer.toJson<int>(id),
      'idDomain': serializer.toJson<String>(idDomain),
      'creditCardId': serializer.toJson<int>(creditCardId),
      'creditCardIdDomain': serializer.toJson<String>(creditCardIdDomain),
      'title': serializer.toJson<String>(title),
      'type': serializer.toJson<String>(type),
      'numberOfInstallments': serializer.toJson<int>(numberOfInstallments),
      'amount': serializer.toJson<double>(amount),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'finalizedAt': serializer.toJson<DateTime?>(finalizedAt),
    };
  }

  PurchaseEntityData copyWith({
    Value<DateTime?> updatedAt = const Value.absent(),
    Value<DateTime?> deletedAt = const Value.absent(),
    Value<bool?> needToSync = const Value.absent(),
    int? id,
    String? idDomain,
    int? creditCardId,
    String? creditCardIdDomain,
    String? title,
    String? type,
    int? numberOfInstallments,
    double? amount,
    DateTime? createdAt,
    Value<DateTime?> finalizedAt = const Value.absent(),
  }) => PurchaseEntityData(
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    needToSync: needToSync.present ? needToSync.value : this.needToSync,
    id: id ?? this.id,
    idDomain: idDomain ?? this.idDomain,
    creditCardId: creditCardId ?? this.creditCardId,
    creditCardIdDomain: creditCardIdDomain ?? this.creditCardIdDomain,
    title: title ?? this.title,
    type: type ?? this.type,
    numberOfInstallments: numberOfInstallments ?? this.numberOfInstallments,
    amount: amount ?? this.amount,
    createdAt: createdAt ?? this.createdAt,
    finalizedAt: finalizedAt.present ? finalizedAt.value : this.finalizedAt,
  );
  PurchaseEntityData copyWithCompanion(PurchaseEntityCompanion data) {
    return PurchaseEntityData(
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      needToSync: data.needToSync.present
          ? data.needToSync.value
          : this.needToSync,
      id: data.id.present ? data.id.value : this.id,
      idDomain: data.idDomain.present ? data.idDomain.value : this.idDomain,
      creditCardId: data.creditCardId.present
          ? data.creditCardId.value
          : this.creditCardId,
      creditCardIdDomain: data.creditCardIdDomain.present
          ? data.creditCardIdDomain.value
          : this.creditCardIdDomain,
      title: data.title.present ? data.title.value : this.title,
      type: data.type.present ? data.type.value : this.type,
      numberOfInstallments: data.numberOfInstallments.present
          ? data.numberOfInstallments.value
          : this.numberOfInstallments,
      amount: data.amount.present ? data.amount.value : this.amount,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      finalizedAt: data.finalizedAt.present
          ? data.finalizedAt.value
          : this.finalizedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PurchaseEntityData(')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('needToSync: $needToSync, ')
          ..write('id: $id, ')
          ..write('idDomain: $idDomain, ')
          ..write('creditCardId: $creditCardId, ')
          ..write('creditCardIdDomain: $creditCardIdDomain, ')
          ..write('title: $title, ')
          ..write('type: $type, ')
          ..write('numberOfInstallments: $numberOfInstallments, ')
          ..write('amount: $amount, ')
          ..write('createdAt: $createdAt, ')
          ..write('finalizedAt: $finalizedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    updatedAt,
    deletedAt,
    needToSync,
    id,
    idDomain,
    creditCardId,
    creditCardIdDomain,
    title,
    type,
    numberOfInstallments,
    amount,
    createdAt,
    finalizedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PurchaseEntityData &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.needToSync == this.needToSync &&
          other.id == this.id &&
          other.idDomain == this.idDomain &&
          other.creditCardId == this.creditCardId &&
          other.creditCardIdDomain == this.creditCardIdDomain &&
          other.title == this.title &&
          other.type == this.type &&
          other.numberOfInstallments == this.numberOfInstallments &&
          other.amount == this.amount &&
          other.createdAt == this.createdAt &&
          other.finalizedAt == this.finalizedAt);
}

class PurchaseEntityCompanion extends UpdateCompanion<PurchaseEntityData> {
  final Value<DateTime?> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<bool?> needToSync;
  final Value<int> id;
  final Value<String> idDomain;
  final Value<int> creditCardId;
  final Value<String> creditCardIdDomain;
  final Value<String> title;
  final Value<String> type;
  final Value<int> numberOfInstallments;
  final Value<double> amount;
  final Value<DateTime> createdAt;
  final Value<DateTime?> finalizedAt;
  const PurchaseEntityCompanion({
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.needToSync = const Value.absent(),
    this.id = const Value.absent(),
    this.idDomain = const Value.absent(),
    this.creditCardId = const Value.absent(),
    this.creditCardIdDomain = const Value.absent(),
    this.title = const Value.absent(),
    this.type = const Value.absent(),
    this.numberOfInstallments = const Value.absent(),
    this.amount = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.finalizedAt = const Value.absent(),
  });
  PurchaseEntityCompanion.insert({
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.needToSync = const Value.absent(),
    this.id = const Value.absent(),
    required String idDomain,
    required int creditCardId,
    required String creditCardIdDomain,
    required String title,
    required String type,
    required int numberOfInstallments,
    required double amount,
    required DateTime createdAt,
    this.finalizedAt = const Value.absent(),
  }) : idDomain = Value(idDomain),
       creditCardId = Value(creditCardId),
       creditCardIdDomain = Value(creditCardIdDomain),
       title = Value(title),
       type = Value(type),
       numberOfInstallments = Value(numberOfInstallments),
       amount = Value(amount),
       createdAt = Value(createdAt);
  static Insertable<PurchaseEntityData> custom({
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<bool>? needToSync,
    Expression<int>? id,
    Expression<String>? idDomain,
    Expression<int>? creditCardId,
    Expression<String>? creditCardIdDomain,
    Expression<String>? title,
    Expression<String>? type,
    Expression<int>? numberOfInstallments,
    Expression<double>? amount,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? finalizedAt,
  }) {
    return RawValuesInsertable({
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (needToSync != null) 'need_to_sync': needToSync,
      if (id != null) 'id': id,
      if (idDomain != null) 'id_domain': idDomain,
      if (creditCardId != null) 'credit_card_id': creditCardId,
      if (creditCardIdDomain != null)
        'credit_card_id_domain': creditCardIdDomain,
      if (title != null) 'title': title,
      if (type != null) 'type': type,
      if (numberOfInstallments != null)
        'number_of_installments': numberOfInstallments,
      if (amount != null) 'amount': amount,
      if (createdAt != null) 'created_at': createdAt,
      if (finalizedAt != null) 'finalized_at': finalizedAt,
    });
  }

  PurchaseEntityCompanion copyWith({
    Value<DateTime?>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<bool?>? needToSync,
    Value<int>? id,
    Value<String>? idDomain,
    Value<int>? creditCardId,
    Value<String>? creditCardIdDomain,
    Value<String>? title,
    Value<String>? type,
    Value<int>? numberOfInstallments,
    Value<double>? amount,
    Value<DateTime>? createdAt,
    Value<DateTime?>? finalizedAt,
  }) {
    return PurchaseEntityCompanion(
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      needToSync: needToSync ?? this.needToSync,
      id: id ?? this.id,
      idDomain: idDomain ?? this.idDomain,
      creditCardId: creditCardId ?? this.creditCardId,
      creditCardIdDomain: creditCardIdDomain ?? this.creditCardIdDomain,
      title: title ?? this.title,
      type: type ?? this.type,
      numberOfInstallments: numberOfInstallments ?? this.numberOfInstallments,
      amount: amount ?? this.amount,
      createdAt: createdAt ?? this.createdAt,
      finalizedAt: finalizedAt ?? this.finalizedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (needToSync.present) {
      map['need_to_sync'] = Variable<bool>(needToSync.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (idDomain.present) {
      map['id_domain'] = Variable<String>(idDomain.value);
    }
    if (creditCardId.present) {
      map['credit_card_id'] = Variable<int>(creditCardId.value);
    }
    if (creditCardIdDomain.present) {
      map['credit_card_id_domain'] = Variable<String>(creditCardIdDomain.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (numberOfInstallments.present) {
      map['number_of_installments'] = Variable<int>(numberOfInstallments.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (finalizedAt.present) {
      map['finalized_at'] = Variable<DateTime>(finalizedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PurchaseEntityCompanion(')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('needToSync: $needToSync, ')
          ..write('id: $id, ')
          ..write('idDomain: $idDomain, ')
          ..write('creditCardId: $creditCardId, ')
          ..write('creditCardIdDomain: $creditCardIdDomain, ')
          ..write('title: $title, ')
          ..write('type: $type, ')
          ..write('numberOfInstallments: $numberOfInstallments, ')
          ..write('amount: $amount, ')
          ..write('createdAt: $createdAt, ')
          ..write('finalizedAt: $finalizedAt')
          ..write(')'))
        .toString();
  }
}

class $InstallmentEntityTable extends InstallmentEntity
    with TableInfo<$InstallmentEntityTable, InstallmentEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InstallmentEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _needToSyncMeta = const VerificationMeta(
    'needToSync',
  );
  @override
  late final GeneratedColumn<bool> needToSync = GeneratedColumn<bool>(
    'need_to_sync',
    aliasedName,
    true,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("need_to_sync" IN (0, 1))',
    ),
  );
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
  static const VerificationMeta _idDomainMeta = const VerificationMeta(
    'idDomain',
  );
  @override
  late final GeneratedColumn<String> idDomain = GeneratedColumn<String>(
    'id_domain',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _purchaseIdMeta = const VerificationMeta(
    'purchaseId',
  );
  @override
  late final GeneratedColumn<int> purchaseId = GeneratedColumn<int>(
    'purchase_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES purchase_entity (id)',
    ),
  );
  static const VerificationMeta _purchaseIdDomainMeta = const VerificationMeta(
    'purchaseIdDomain',
  );
  @override
  late final GeneratedColumn<String> purchaseIdDomain = GeneratedColumn<String>(
    'purchase_id_domain',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
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
  static const VerificationMeta _dueDateMeta = const VerificationMeta(
    'dueDate',
  );
  @override
  late final GeneratedColumn<DateTime> dueDate = GeneratedColumn<DateTime>(
    'due_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    updatedAt,
    deletedAt,
    needToSync,
    id,
    idDomain,
    purchaseId,
    purchaseIdDomain,
    amount,
    dueDate,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'installment_entity';
  @override
  VerificationContext validateIntegrity(
    Insertable<InstallmentEntityData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('need_to_sync')) {
      context.handle(
        _needToSyncMeta,
        needToSync.isAcceptableOrUnknown(
          data['need_to_sync']!,
          _needToSyncMeta,
        ),
      );
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('id_domain')) {
      context.handle(
        _idDomainMeta,
        idDomain.isAcceptableOrUnknown(data['id_domain']!, _idDomainMeta),
      );
    } else if (isInserting) {
      context.missing(_idDomainMeta);
    }
    if (data.containsKey('purchase_id')) {
      context.handle(
        _purchaseIdMeta,
        purchaseId.isAcceptableOrUnknown(data['purchase_id']!, _purchaseIdMeta),
      );
    } else if (isInserting) {
      context.missing(_purchaseIdMeta);
    }
    if (data.containsKey('purchase_id_domain')) {
      context.handle(
        _purchaseIdDomainMeta,
        purchaseIdDomain.isAcceptableOrUnknown(
          data['purchase_id_domain']!,
          _purchaseIdDomainMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_purchaseIdDomainMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('due_date')) {
      context.handle(
        _dueDateMeta,
        dueDate.isAcceptableOrUnknown(data['due_date']!, _dueDateMeta),
      );
    } else if (isInserting) {
      context.missing(_dueDateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  InstallmentEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return InstallmentEntityData(
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      needToSync: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}need_to_sync'],
      ),
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      idDomain: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id_domain'],
      )!,
      purchaseId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}purchase_id'],
      )!,
      purchaseIdDomain: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}purchase_id_domain'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}amount'],
      )!,
      dueDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}due_date'],
      )!,
    );
  }

  @override
  $InstallmentEntityTable createAlias(String alias) {
    return $InstallmentEntityTable(attachedDatabase, alias);
  }
}

class InstallmentEntityData extends DataClass
    implements Insertable<InstallmentEntityData> {
  final DateTime? updatedAt;
  final DateTime? deletedAt;
  final bool? needToSync;
  final int id;
  final String idDomain;
  final int purchaseId;
  final String purchaseIdDomain;
  final double amount;
  final DateTime dueDate;
  const InstallmentEntityData({
    this.updatedAt,
    this.deletedAt,
    this.needToSync,
    required this.id,
    required this.idDomain,
    required this.purchaseId,
    required this.purchaseIdDomain,
    required this.amount,
    required this.dueDate,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    if (!nullToAbsent || needToSync != null) {
      map['need_to_sync'] = Variable<bool>(needToSync);
    }
    map['id'] = Variable<int>(id);
    map['id_domain'] = Variable<String>(idDomain);
    map['purchase_id'] = Variable<int>(purchaseId);
    map['purchase_id_domain'] = Variable<String>(purchaseIdDomain);
    map['amount'] = Variable<double>(amount);
    map['due_date'] = Variable<DateTime>(dueDate);
    return map;
  }

  InstallmentEntityCompanion toCompanion(bool nullToAbsent) {
    return InstallmentEntityCompanion(
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      needToSync: needToSync == null && nullToAbsent
          ? const Value.absent()
          : Value(needToSync),
      id: Value(id),
      idDomain: Value(idDomain),
      purchaseId: Value(purchaseId),
      purchaseIdDomain: Value(purchaseIdDomain),
      amount: Value(amount),
      dueDate: Value(dueDate),
    );
  }

  factory InstallmentEntityData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InstallmentEntityData(
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      needToSync: serializer.fromJson<bool?>(json['needToSync']),
      id: serializer.fromJson<int>(json['id']),
      idDomain: serializer.fromJson<String>(json['idDomain']),
      purchaseId: serializer.fromJson<int>(json['purchaseId']),
      purchaseIdDomain: serializer.fromJson<String>(json['purchaseIdDomain']),
      amount: serializer.fromJson<double>(json['amount']),
      dueDate: serializer.fromJson<DateTime>(json['dueDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'needToSync': serializer.toJson<bool?>(needToSync),
      'id': serializer.toJson<int>(id),
      'idDomain': serializer.toJson<String>(idDomain),
      'purchaseId': serializer.toJson<int>(purchaseId),
      'purchaseIdDomain': serializer.toJson<String>(purchaseIdDomain),
      'amount': serializer.toJson<double>(amount),
      'dueDate': serializer.toJson<DateTime>(dueDate),
    };
  }

  InstallmentEntityData copyWith({
    Value<DateTime?> updatedAt = const Value.absent(),
    Value<DateTime?> deletedAt = const Value.absent(),
    Value<bool?> needToSync = const Value.absent(),
    int? id,
    String? idDomain,
    int? purchaseId,
    String? purchaseIdDomain,
    double? amount,
    DateTime? dueDate,
  }) => InstallmentEntityData(
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    needToSync: needToSync.present ? needToSync.value : this.needToSync,
    id: id ?? this.id,
    idDomain: idDomain ?? this.idDomain,
    purchaseId: purchaseId ?? this.purchaseId,
    purchaseIdDomain: purchaseIdDomain ?? this.purchaseIdDomain,
    amount: amount ?? this.amount,
    dueDate: dueDate ?? this.dueDate,
  );
  InstallmentEntityData copyWithCompanion(InstallmentEntityCompanion data) {
    return InstallmentEntityData(
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      needToSync: data.needToSync.present
          ? data.needToSync.value
          : this.needToSync,
      id: data.id.present ? data.id.value : this.id,
      idDomain: data.idDomain.present ? data.idDomain.value : this.idDomain,
      purchaseId: data.purchaseId.present
          ? data.purchaseId.value
          : this.purchaseId,
      purchaseIdDomain: data.purchaseIdDomain.present
          ? data.purchaseIdDomain.value
          : this.purchaseIdDomain,
      amount: data.amount.present ? data.amount.value : this.amount,
      dueDate: data.dueDate.present ? data.dueDate.value : this.dueDate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('InstallmentEntityData(')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('needToSync: $needToSync, ')
          ..write('id: $id, ')
          ..write('idDomain: $idDomain, ')
          ..write('purchaseId: $purchaseId, ')
          ..write('purchaseIdDomain: $purchaseIdDomain, ')
          ..write('amount: $amount, ')
          ..write('dueDate: $dueDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    updatedAt,
    deletedAt,
    needToSync,
    id,
    idDomain,
    purchaseId,
    purchaseIdDomain,
    amount,
    dueDate,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InstallmentEntityData &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.needToSync == this.needToSync &&
          other.id == this.id &&
          other.idDomain == this.idDomain &&
          other.purchaseId == this.purchaseId &&
          other.purchaseIdDomain == this.purchaseIdDomain &&
          other.amount == this.amount &&
          other.dueDate == this.dueDate);
}

class InstallmentEntityCompanion
    extends UpdateCompanion<InstallmentEntityData> {
  final Value<DateTime?> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<bool?> needToSync;
  final Value<int> id;
  final Value<String> idDomain;
  final Value<int> purchaseId;
  final Value<String> purchaseIdDomain;
  final Value<double> amount;
  final Value<DateTime> dueDate;
  const InstallmentEntityCompanion({
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.needToSync = const Value.absent(),
    this.id = const Value.absent(),
    this.idDomain = const Value.absent(),
    this.purchaseId = const Value.absent(),
    this.purchaseIdDomain = const Value.absent(),
    this.amount = const Value.absent(),
    this.dueDate = const Value.absent(),
  });
  InstallmentEntityCompanion.insert({
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.needToSync = const Value.absent(),
    this.id = const Value.absent(),
    required String idDomain,
    required int purchaseId,
    required String purchaseIdDomain,
    required double amount,
    required DateTime dueDate,
  }) : idDomain = Value(idDomain),
       purchaseId = Value(purchaseId),
       purchaseIdDomain = Value(purchaseIdDomain),
       amount = Value(amount),
       dueDate = Value(dueDate);
  static Insertable<InstallmentEntityData> custom({
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<bool>? needToSync,
    Expression<int>? id,
    Expression<String>? idDomain,
    Expression<int>? purchaseId,
    Expression<String>? purchaseIdDomain,
    Expression<double>? amount,
    Expression<DateTime>? dueDate,
  }) {
    return RawValuesInsertable({
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (needToSync != null) 'need_to_sync': needToSync,
      if (id != null) 'id': id,
      if (idDomain != null) 'id_domain': idDomain,
      if (purchaseId != null) 'purchase_id': purchaseId,
      if (purchaseIdDomain != null) 'purchase_id_domain': purchaseIdDomain,
      if (amount != null) 'amount': amount,
      if (dueDate != null) 'due_date': dueDate,
    });
  }

  InstallmentEntityCompanion copyWith({
    Value<DateTime?>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<bool?>? needToSync,
    Value<int>? id,
    Value<String>? idDomain,
    Value<int>? purchaseId,
    Value<String>? purchaseIdDomain,
    Value<double>? amount,
    Value<DateTime>? dueDate,
  }) {
    return InstallmentEntityCompanion(
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      needToSync: needToSync ?? this.needToSync,
      id: id ?? this.id,
      idDomain: idDomain ?? this.idDomain,
      purchaseId: purchaseId ?? this.purchaseId,
      purchaseIdDomain: purchaseIdDomain ?? this.purchaseIdDomain,
      amount: amount ?? this.amount,
      dueDate: dueDate ?? this.dueDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (needToSync.present) {
      map['need_to_sync'] = Variable<bool>(needToSync.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (idDomain.present) {
      map['id_domain'] = Variable<String>(idDomain.value);
    }
    if (purchaseId.present) {
      map['purchase_id'] = Variable<int>(purchaseId.value);
    }
    if (purchaseIdDomain.present) {
      map['purchase_id_domain'] = Variable<String>(purchaseIdDomain.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (dueDate.present) {
      map['due_date'] = Variable<DateTime>(dueDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InstallmentEntityCompanion(')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('needToSync: $needToSync, ')
          ..write('id: $id, ')
          ..write('idDomain: $idDomain, ')
          ..write('purchaseId: $purchaseId, ')
          ..write('purchaseIdDomain: $purchaseIdDomain, ')
          ..write('amount: $amount, ')
          ..write('dueDate: $dueDate')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CreditcardEntityTable creditcardEntity = $CreditcardEntityTable(
    this,
  );
  late final $PurchaseEntityTable purchaseEntity = $PurchaseEntityTable(this);
  late final $InstallmentEntityTable installmentEntity =
      $InstallmentEntityTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    creditcardEntity,
    purchaseEntity,
    installmentEntity,
  ];
}

typedef $$CreditcardEntityTableCreateCompanionBuilder =
    CreditcardEntityCompanion Function({
      Value<DateTime?> updatedAt,
      Value<DateTime?> deletedAt,
      Value<bool?> needToSync,
      Value<int> id,
      required String idDomain,
      required String name,
      required int closingDay,
      required int dueDay,
    });
typedef $$CreditcardEntityTableUpdateCompanionBuilder =
    CreditcardEntityCompanion Function({
      Value<DateTime?> updatedAt,
      Value<DateTime?> deletedAt,
      Value<bool?> needToSync,
      Value<int> id,
      Value<String> idDomain,
      Value<String> name,
      Value<int> closingDay,
      Value<int> dueDay,
    });

final class $$CreditcardEntityTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $CreditcardEntityTable,
          CreditcardEntityData
        > {
  $$CreditcardEntityTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$PurchaseEntityTable, List<PurchaseEntityData>>
  _purchaseEntityRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.purchaseEntity,
    aliasName: $_aliasNameGenerator(
      db.creditcardEntity.id,
      db.purchaseEntity.creditCardId,
    ),
  );

  $$PurchaseEntityTableProcessedTableManager get purchaseEntityRefs {
    final manager = $$PurchaseEntityTableTableManager(
      $_db,
      $_db.purchaseEntity,
    ).filter((f) => f.creditCardId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_purchaseEntityRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CreditcardEntityTableFilterComposer
    extends Composer<_$AppDatabase, $CreditcardEntityTable> {
  $$CreditcardEntityTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get needToSync => $composableBuilder(
    column: $table.needToSync,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get idDomain => $composableBuilder(
    column: $table.idDomain,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get closingDay => $composableBuilder(
    column: $table.closingDay,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get dueDay => $composableBuilder(
    column: $table.dueDay,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> purchaseEntityRefs(
    Expression<bool> Function($$PurchaseEntityTableFilterComposer f) f,
  ) {
    final $$PurchaseEntityTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.purchaseEntity,
      getReferencedColumn: (t) => t.creditCardId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PurchaseEntityTableFilterComposer(
            $db: $db,
            $table: $db.purchaseEntity,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CreditcardEntityTableOrderingComposer
    extends Composer<_$AppDatabase, $CreditcardEntityTable> {
  $$CreditcardEntityTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get needToSync => $composableBuilder(
    column: $table.needToSync,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get idDomain => $composableBuilder(
    column: $table.idDomain,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get closingDay => $composableBuilder(
    column: $table.closingDay,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get dueDay => $composableBuilder(
    column: $table.dueDay,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CreditcardEntityTableAnnotationComposer
    extends Composer<_$AppDatabase, $CreditcardEntityTable> {
  $$CreditcardEntityTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<bool> get needToSync => $composableBuilder(
    column: $table.needToSync,
    builder: (column) => column,
  );

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get idDomain =>
      $composableBuilder(column: $table.idDomain, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get closingDay => $composableBuilder(
    column: $table.closingDay,
    builder: (column) => column,
  );

  GeneratedColumn<int> get dueDay =>
      $composableBuilder(column: $table.dueDay, builder: (column) => column);

  Expression<T> purchaseEntityRefs<T extends Object>(
    Expression<T> Function($$PurchaseEntityTableAnnotationComposer a) f,
  ) {
    final $$PurchaseEntityTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.purchaseEntity,
      getReferencedColumn: (t) => t.creditCardId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PurchaseEntityTableAnnotationComposer(
            $db: $db,
            $table: $db.purchaseEntity,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CreditcardEntityTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CreditcardEntityTable,
          CreditcardEntityData,
          $$CreditcardEntityTableFilterComposer,
          $$CreditcardEntityTableOrderingComposer,
          $$CreditcardEntityTableAnnotationComposer,
          $$CreditcardEntityTableCreateCompanionBuilder,
          $$CreditcardEntityTableUpdateCompanionBuilder,
          (CreditcardEntityData, $$CreditcardEntityTableReferences),
          CreditcardEntityData,
          PrefetchHooks Function({bool purchaseEntityRefs})
        > {
  $$CreditcardEntityTableTableManager(
    _$AppDatabase db,
    $CreditcardEntityTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CreditcardEntityTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CreditcardEntityTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CreditcardEntityTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<bool?> needToSync = const Value.absent(),
                Value<int> id = const Value.absent(),
                Value<String> idDomain = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> closingDay = const Value.absent(),
                Value<int> dueDay = const Value.absent(),
              }) => CreditcardEntityCompanion(
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                needToSync: needToSync,
                id: id,
                idDomain: idDomain,
                name: name,
                closingDay: closingDay,
                dueDay: dueDay,
              ),
          createCompanionCallback:
              ({
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<bool?> needToSync = const Value.absent(),
                Value<int> id = const Value.absent(),
                required String idDomain,
                required String name,
                required int closingDay,
                required int dueDay,
              }) => CreditcardEntityCompanion.insert(
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                needToSync: needToSync,
                id: id,
                idDomain: idDomain,
                name: name,
                closingDay: closingDay,
                dueDay: dueDay,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CreditcardEntityTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({purchaseEntityRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (purchaseEntityRefs) db.purchaseEntity,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (purchaseEntityRefs)
                    await $_getPrefetchedData<
                      CreditcardEntityData,
                      $CreditcardEntityTable,
                      PurchaseEntityData
                    >(
                      currentTable: table,
                      referencedTable: $$CreditcardEntityTableReferences
                          ._purchaseEntityRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$CreditcardEntityTableReferences(
                            db,
                            table,
                            p0,
                          ).purchaseEntityRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.creditCardId == item.id,
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

typedef $$CreditcardEntityTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CreditcardEntityTable,
      CreditcardEntityData,
      $$CreditcardEntityTableFilterComposer,
      $$CreditcardEntityTableOrderingComposer,
      $$CreditcardEntityTableAnnotationComposer,
      $$CreditcardEntityTableCreateCompanionBuilder,
      $$CreditcardEntityTableUpdateCompanionBuilder,
      (CreditcardEntityData, $$CreditcardEntityTableReferences),
      CreditcardEntityData,
      PrefetchHooks Function({bool purchaseEntityRefs})
    >;
typedef $$PurchaseEntityTableCreateCompanionBuilder =
    PurchaseEntityCompanion Function({
      Value<DateTime?> updatedAt,
      Value<DateTime?> deletedAt,
      Value<bool?> needToSync,
      Value<int> id,
      required String idDomain,
      required int creditCardId,
      required String creditCardIdDomain,
      required String title,
      required String type,
      required int numberOfInstallments,
      required double amount,
      required DateTime createdAt,
      Value<DateTime?> finalizedAt,
    });
typedef $$PurchaseEntityTableUpdateCompanionBuilder =
    PurchaseEntityCompanion Function({
      Value<DateTime?> updatedAt,
      Value<DateTime?> deletedAt,
      Value<bool?> needToSync,
      Value<int> id,
      Value<String> idDomain,
      Value<int> creditCardId,
      Value<String> creditCardIdDomain,
      Value<String> title,
      Value<String> type,
      Value<int> numberOfInstallments,
      Value<double> amount,
      Value<DateTime> createdAt,
      Value<DateTime?> finalizedAt,
    });

final class $$PurchaseEntityTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $PurchaseEntityTable,
          PurchaseEntityData
        > {
  $$PurchaseEntityTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $CreditcardEntityTable _creditCardIdTable(_$AppDatabase db) =>
      db.creditcardEntity.createAlias(
        $_aliasNameGenerator(
          db.purchaseEntity.creditCardId,
          db.creditcardEntity.id,
        ),
      );

  $$CreditcardEntityTableProcessedTableManager get creditCardId {
    final $_column = $_itemColumn<int>('credit_card_id')!;

    final manager = $$CreditcardEntityTableTableManager(
      $_db,
      $_db.creditcardEntity,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_creditCardIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<
    $InstallmentEntityTable,
    List<InstallmentEntityData>
  >
  _installmentEntityRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.installmentEntity,
        aliasName: $_aliasNameGenerator(
          db.purchaseEntity.id,
          db.installmentEntity.purchaseId,
        ),
      );

  $$InstallmentEntityTableProcessedTableManager get installmentEntityRefs {
    final manager = $$InstallmentEntityTableTableManager(
      $_db,
      $_db.installmentEntity,
    ).filter((f) => f.purchaseId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _installmentEntityRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$PurchaseEntityTableFilterComposer
    extends Composer<_$AppDatabase, $PurchaseEntityTable> {
  $$PurchaseEntityTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get needToSync => $composableBuilder(
    column: $table.needToSync,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get idDomain => $composableBuilder(
    column: $table.idDomain,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get creditCardIdDomain => $composableBuilder(
    column: $table.creditCardIdDomain,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get numberOfInstallments => $composableBuilder(
    column: $table.numberOfInstallments,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get finalizedAt => $composableBuilder(
    column: $table.finalizedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$CreditcardEntityTableFilterComposer get creditCardId {
    final $$CreditcardEntityTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.creditCardId,
      referencedTable: $db.creditcardEntity,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CreditcardEntityTableFilterComposer(
            $db: $db,
            $table: $db.creditcardEntity,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> installmentEntityRefs(
    Expression<bool> Function($$InstallmentEntityTableFilterComposer f) f,
  ) {
    final $$InstallmentEntityTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.installmentEntity,
      getReferencedColumn: (t) => t.purchaseId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InstallmentEntityTableFilterComposer(
            $db: $db,
            $table: $db.installmentEntity,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PurchaseEntityTableOrderingComposer
    extends Composer<_$AppDatabase, $PurchaseEntityTable> {
  $$PurchaseEntityTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get needToSync => $composableBuilder(
    column: $table.needToSync,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get idDomain => $composableBuilder(
    column: $table.idDomain,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get creditCardIdDomain => $composableBuilder(
    column: $table.creditCardIdDomain,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get numberOfInstallments => $composableBuilder(
    column: $table.numberOfInstallments,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get finalizedAt => $composableBuilder(
    column: $table.finalizedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$CreditcardEntityTableOrderingComposer get creditCardId {
    final $$CreditcardEntityTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.creditCardId,
      referencedTable: $db.creditcardEntity,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CreditcardEntityTableOrderingComposer(
            $db: $db,
            $table: $db.creditcardEntity,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PurchaseEntityTableAnnotationComposer
    extends Composer<_$AppDatabase, $PurchaseEntityTable> {
  $$PurchaseEntityTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<bool> get needToSync => $composableBuilder(
    column: $table.needToSync,
    builder: (column) => column,
  );

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get idDomain =>
      $composableBuilder(column: $table.idDomain, builder: (column) => column);

  GeneratedColumn<String> get creditCardIdDomain => $composableBuilder(
    column: $table.creditCardIdDomain,
    builder: (column) => column,
  );

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<int> get numberOfInstallments => $composableBuilder(
    column: $table.numberOfInstallments,
    builder: (column) => column,
  );

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get finalizedAt => $composableBuilder(
    column: $table.finalizedAt,
    builder: (column) => column,
  );

  $$CreditcardEntityTableAnnotationComposer get creditCardId {
    final $$CreditcardEntityTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.creditCardId,
      referencedTable: $db.creditcardEntity,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CreditcardEntityTableAnnotationComposer(
            $db: $db,
            $table: $db.creditcardEntity,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> installmentEntityRefs<T extends Object>(
    Expression<T> Function($$InstallmentEntityTableAnnotationComposer a) f,
  ) {
    final $$InstallmentEntityTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.installmentEntity,
          getReferencedColumn: (t) => t.purchaseId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$InstallmentEntityTableAnnotationComposer(
                $db: $db,
                $table: $db.installmentEntity,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$PurchaseEntityTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PurchaseEntityTable,
          PurchaseEntityData,
          $$PurchaseEntityTableFilterComposer,
          $$PurchaseEntityTableOrderingComposer,
          $$PurchaseEntityTableAnnotationComposer,
          $$PurchaseEntityTableCreateCompanionBuilder,
          $$PurchaseEntityTableUpdateCompanionBuilder,
          (PurchaseEntityData, $$PurchaseEntityTableReferences),
          PurchaseEntityData,
          PrefetchHooks Function({
            bool creditCardId,
            bool installmentEntityRefs,
          })
        > {
  $$PurchaseEntityTableTableManager(
    _$AppDatabase db,
    $PurchaseEntityTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PurchaseEntityTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PurchaseEntityTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PurchaseEntityTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<bool?> needToSync = const Value.absent(),
                Value<int> id = const Value.absent(),
                Value<String> idDomain = const Value.absent(),
                Value<int> creditCardId = const Value.absent(),
                Value<String> creditCardIdDomain = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<int> numberOfInstallments = const Value.absent(),
                Value<double> amount = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> finalizedAt = const Value.absent(),
              }) => PurchaseEntityCompanion(
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                needToSync: needToSync,
                id: id,
                idDomain: idDomain,
                creditCardId: creditCardId,
                creditCardIdDomain: creditCardIdDomain,
                title: title,
                type: type,
                numberOfInstallments: numberOfInstallments,
                amount: amount,
                createdAt: createdAt,
                finalizedAt: finalizedAt,
              ),
          createCompanionCallback:
              ({
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<bool?> needToSync = const Value.absent(),
                Value<int> id = const Value.absent(),
                required String idDomain,
                required int creditCardId,
                required String creditCardIdDomain,
                required String title,
                required String type,
                required int numberOfInstallments,
                required double amount,
                required DateTime createdAt,
                Value<DateTime?> finalizedAt = const Value.absent(),
              }) => PurchaseEntityCompanion.insert(
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                needToSync: needToSync,
                id: id,
                idDomain: idDomain,
                creditCardId: creditCardId,
                creditCardIdDomain: creditCardIdDomain,
                title: title,
                type: type,
                numberOfInstallments: numberOfInstallments,
                amount: amount,
                createdAt: createdAt,
                finalizedAt: finalizedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PurchaseEntityTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({creditCardId = false, installmentEntityRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (installmentEntityRefs) db.installmentEntity,
                  ],
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
                        if (creditCardId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.creditCardId,
                                    referencedTable:
                                        $$PurchaseEntityTableReferences
                                            ._creditCardIdTable(db),
                                    referencedColumn:
                                        $$PurchaseEntityTableReferences
                                            ._creditCardIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (installmentEntityRefs)
                        await $_getPrefetchedData<
                          PurchaseEntityData,
                          $PurchaseEntityTable,
                          InstallmentEntityData
                        >(
                          currentTable: table,
                          referencedTable: $$PurchaseEntityTableReferences
                              ._installmentEntityRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PurchaseEntityTableReferences(
                                db,
                                table,
                                p0,
                              ).installmentEntityRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.purchaseId == item.id,
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

typedef $$PurchaseEntityTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PurchaseEntityTable,
      PurchaseEntityData,
      $$PurchaseEntityTableFilterComposer,
      $$PurchaseEntityTableOrderingComposer,
      $$PurchaseEntityTableAnnotationComposer,
      $$PurchaseEntityTableCreateCompanionBuilder,
      $$PurchaseEntityTableUpdateCompanionBuilder,
      (PurchaseEntityData, $$PurchaseEntityTableReferences),
      PurchaseEntityData,
      PrefetchHooks Function({bool creditCardId, bool installmentEntityRefs})
    >;
typedef $$InstallmentEntityTableCreateCompanionBuilder =
    InstallmentEntityCompanion Function({
      Value<DateTime?> updatedAt,
      Value<DateTime?> deletedAt,
      Value<bool?> needToSync,
      Value<int> id,
      required String idDomain,
      required int purchaseId,
      required String purchaseIdDomain,
      required double amount,
      required DateTime dueDate,
    });
typedef $$InstallmentEntityTableUpdateCompanionBuilder =
    InstallmentEntityCompanion Function({
      Value<DateTime?> updatedAt,
      Value<DateTime?> deletedAt,
      Value<bool?> needToSync,
      Value<int> id,
      Value<String> idDomain,
      Value<int> purchaseId,
      Value<String> purchaseIdDomain,
      Value<double> amount,
      Value<DateTime> dueDate,
    });

final class $$InstallmentEntityTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $InstallmentEntityTable,
          InstallmentEntityData
        > {
  $$InstallmentEntityTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $PurchaseEntityTable _purchaseIdTable(_$AppDatabase db) =>
      db.purchaseEntity.createAlias(
        $_aliasNameGenerator(
          db.installmentEntity.purchaseId,
          db.purchaseEntity.id,
        ),
      );

  $$PurchaseEntityTableProcessedTableManager get purchaseId {
    final $_column = $_itemColumn<int>('purchase_id')!;

    final manager = $$PurchaseEntityTableTableManager(
      $_db,
      $_db.purchaseEntity,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_purchaseIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$InstallmentEntityTableFilterComposer
    extends Composer<_$AppDatabase, $InstallmentEntityTable> {
  $$InstallmentEntityTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get needToSync => $composableBuilder(
    column: $table.needToSync,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get idDomain => $composableBuilder(
    column: $table.idDomain,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get purchaseIdDomain => $composableBuilder(
    column: $table.purchaseIdDomain,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dueDate => $composableBuilder(
    column: $table.dueDate,
    builder: (column) => ColumnFilters(column),
  );

  $$PurchaseEntityTableFilterComposer get purchaseId {
    final $$PurchaseEntityTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.purchaseId,
      referencedTable: $db.purchaseEntity,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PurchaseEntityTableFilterComposer(
            $db: $db,
            $table: $db.purchaseEntity,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$InstallmentEntityTableOrderingComposer
    extends Composer<_$AppDatabase, $InstallmentEntityTable> {
  $$InstallmentEntityTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get needToSync => $composableBuilder(
    column: $table.needToSync,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get idDomain => $composableBuilder(
    column: $table.idDomain,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get purchaseIdDomain => $composableBuilder(
    column: $table.purchaseIdDomain,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dueDate => $composableBuilder(
    column: $table.dueDate,
    builder: (column) => ColumnOrderings(column),
  );

  $$PurchaseEntityTableOrderingComposer get purchaseId {
    final $$PurchaseEntityTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.purchaseId,
      referencedTable: $db.purchaseEntity,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PurchaseEntityTableOrderingComposer(
            $db: $db,
            $table: $db.purchaseEntity,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$InstallmentEntityTableAnnotationComposer
    extends Composer<_$AppDatabase, $InstallmentEntityTable> {
  $$InstallmentEntityTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<bool> get needToSync => $composableBuilder(
    column: $table.needToSync,
    builder: (column) => column,
  );

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get idDomain =>
      $composableBuilder(column: $table.idDomain, builder: (column) => column);

  GeneratedColumn<String> get purchaseIdDomain => $composableBuilder(
    column: $table.purchaseIdDomain,
    builder: (column) => column,
  );

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<DateTime> get dueDate =>
      $composableBuilder(column: $table.dueDate, builder: (column) => column);

  $$PurchaseEntityTableAnnotationComposer get purchaseId {
    final $$PurchaseEntityTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.purchaseId,
      referencedTable: $db.purchaseEntity,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PurchaseEntityTableAnnotationComposer(
            $db: $db,
            $table: $db.purchaseEntity,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$InstallmentEntityTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $InstallmentEntityTable,
          InstallmentEntityData,
          $$InstallmentEntityTableFilterComposer,
          $$InstallmentEntityTableOrderingComposer,
          $$InstallmentEntityTableAnnotationComposer,
          $$InstallmentEntityTableCreateCompanionBuilder,
          $$InstallmentEntityTableUpdateCompanionBuilder,
          (InstallmentEntityData, $$InstallmentEntityTableReferences),
          InstallmentEntityData,
          PrefetchHooks Function({bool purchaseId})
        > {
  $$InstallmentEntityTableTableManager(
    _$AppDatabase db,
    $InstallmentEntityTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$InstallmentEntityTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$InstallmentEntityTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$InstallmentEntityTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<bool?> needToSync = const Value.absent(),
                Value<int> id = const Value.absent(),
                Value<String> idDomain = const Value.absent(),
                Value<int> purchaseId = const Value.absent(),
                Value<String> purchaseIdDomain = const Value.absent(),
                Value<double> amount = const Value.absent(),
                Value<DateTime> dueDate = const Value.absent(),
              }) => InstallmentEntityCompanion(
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                needToSync: needToSync,
                id: id,
                idDomain: idDomain,
                purchaseId: purchaseId,
                purchaseIdDomain: purchaseIdDomain,
                amount: amount,
                dueDate: dueDate,
              ),
          createCompanionCallback:
              ({
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<bool?> needToSync = const Value.absent(),
                Value<int> id = const Value.absent(),
                required String idDomain,
                required int purchaseId,
                required String purchaseIdDomain,
                required double amount,
                required DateTime dueDate,
              }) => InstallmentEntityCompanion.insert(
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                needToSync: needToSync,
                id: id,
                idDomain: idDomain,
                purchaseId: purchaseId,
                purchaseIdDomain: purchaseIdDomain,
                amount: amount,
                dueDate: dueDate,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$InstallmentEntityTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({purchaseId = false}) {
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
                    if (purchaseId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.purchaseId,
                                referencedTable:
                                    $$InstallmentEntityTableReferences
                                        ._purchaseIdTable(db),
                                referencedColumn:
                                    $$InstallmentEntityTableReferences
                                        ._purchaseIdTable(db)
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

typedef $$InstallmentEntityTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $InstallmentEntityTable,
      InstallmentEntityData,
      $$InstallmentEntityTableFilterComposer,
      $$InstallmentEntityTableOrderingComposer,
      $$InstallmentEntityTableAnnotationComposer,
      $$InstallmentEntityTableCreateCompanionBuilder,
      $$InstallmentEntityTableUpdateCompanionBuilder,
      (InstallmentEntityData, $$InstallmentEntityTableReferences),
      InstallmentEntityData,
      PrefetchHooks Function({bool purchaseId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CreditcardEntityTableTableManager get creditcardEntity =>
      $$CreditcardEntityTableTableManager(_db, _db.creditcardEntity);
  $$PurchaseEntityTableTableManager get purchaseEntity =>
      $$PurchaseEntityTableTableManager(_db, _db.purchaseEntity);
  $$InstallmentEntityTableTableManager get installmentEntity =>
      $$InstallmentEntityTableTableManager(_db, _db.installmentEntity);
}
