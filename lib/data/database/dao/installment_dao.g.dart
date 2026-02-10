// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'installment_dao.dart';

// ignore_for_file: type=lint
mixin _$InstallmentDaoMixin on DatabaseAccessor<AppDatabase> {
  $CreditcardEntityTable get creditcardEntity =>
      attachedDatabase.creditcardEntity;
  $PurchaseEntityTable get purchaseEntity => attachedDatabase.purchaseEntity;
  $InstallmentEntityTable get installmentEntity =>
      attachedDatabase.installmentEntity;
  InstallmentDaoManager get managers => InstallmentDaoManager(this);
}

class InstallmentDaoManager {
  final _$InstallmentDaoMixin _db;
  InstallmentDaoManager(this._db);
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
  $$InstallmentEntityTableTableManager get installmentEntity =>
      $$InstallmentEntityTableTableManager(
        _db.attachedDatabase,
        _db.installmentEntity,
      );
}
