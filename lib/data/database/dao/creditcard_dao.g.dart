// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'creditcard_dao.dart';

// ignore_for_file: type=lint
mixin _$CreditCardDaoMixin on DatabaseAccessor<AppDatabase> {
  $CreditcardEntityTable get creditcardEntity =>
      attachedDatabase.creditcardEntity;
  CreditCardDaoManager get managers => CreditCardDaoManager(this);
}

class CreditCardDaoManager {
  final _$CreditCardDaoMixin _db;
  CreditCardDaoManager(this._db);
  $$CreditcardEntityTableTableManager get creditcardEntity =>
      $$CreditcardEntityTableTableManager(
        _db.attachedDatabase,
        _db.creditcardEntity,
      );
}
