// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_dao.dart';

// ignore_for_file: type=lint
mixin _$PurchaseDaoMixin on DatabaseAccessor<AppDatabase> {
  $CreditcardEntityTable get creditcardEntity =>
      attachedDatabase.creditcardEntity;
  $PurchaseEntityTable get purchaseEntity => attachedDatabase.purchaseEntity;
  PurchaseDaoManager get managers => PurchaseDaoManager(this);
}

class PurchaseDaoManager {
  final _$PurchaseDaoMixin _db;
  PurchaseDaoManager(this._db);
  $$CreditcardEntityTableTableManager get creditcardEntity =>
      $$CreditcardEntityTableTableManager(
        _db.attachedDatabase,
        _db.creditcardEntity,
      );
  $$PurchaseEntityTableTableManager get purchaseEntity =>
      $$PurchaseEntityTableTableManager(
        _db.attachedDatabase,
        _db.purchaseEntity,
      );
}
