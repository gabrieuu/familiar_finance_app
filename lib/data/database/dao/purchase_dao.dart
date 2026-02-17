import 'dart:developer';

import 'package:drift/drift.dart';
import 'package:familiar_finance_app/data/database/app_database.dart';
import 'package:familiar_finance_app/data/database/entity/purchase_entity.dart';
import 'package:familiar_finance_app/data/database/entity/creditcard_entity.dart';
import 'package:familiar_finance_app/data/database/interface/purchase_db.dart';
import 'package:familiar_finance_app/data/database/mapper/purchase_db_mapper.dart';
import 'package:familiar_finance_app/domain/purchase/purchase.dart';
import 'package:familiar_finance_app/utils/result.dart';

part 'purchase_dao.g.dart';

@DriftAccessor(tables: [PurchaseEntity, CreditcardEntity])
class PurchaseDao extends DatabaseAccessor<AppDatabase>
    with _$PurchaseDaoMixin
    implements PurchaseDb {
  PurchaseDao(super.attachedDatabase);

  @override
  Future<Result<void>> deletePurchase(String purchaseId) async {
    try {
      await (delete(
        purchaseEntity,
      )..where((tbl) => tbl.idDomain.equals(purchaseId))).go();
      return Result.ok(null);
    } catch (e) {
      return Result.failure(Exception(e.toString()));
    }
  }

  @override
  Future<Result<void>> editPurchase(
    Purchase purchase, {
    bool isLocal = false,
  }) async {
    try {
      final creditCard =
          await (select(creditcardEntity)
                ..where((tbl) => tbl.idDomain.equals(purchase.creditCardId!)))
              .getSingleOrNull();

      if (creditCard == null) {
        return Result.failure(Exception('Credit card not found'));
      }
      final companion = PurchaseDbMapper.toCompanion(
        purchase,
        creditCard.id,
        needToSync: isLocal,
      );
      await update(purchaseEntity).replace(companion);
      return Result.ok(null);
    } catch (e) {
      return Result.failure(Exception(e.toString()));
    }
  }

  @override
  Future<Result<List<Purchase>>> getAllPurchaseByCreditCard(
    String creditCardId,
  ) async {
    try {
      final purchases =
          await (select(purchaseEntity)
                ..where((tbl) => tbl.creditCardIdDomain.equals(creditCardId))
                ..where((tb) => tb.deletedAt.isNull()))
              .get();
      return Result.ok(
        purchases.map((e) => PurchaseDbMapper.toDomain(e)).toList(),
      );
    } catch (e) {
      return Result.failure(Exception(e.toString()));
    }
  }

  @override
  Future<Result<List<Purchase>>> getPurchasesByMonth(
    int month,
    int year,
  ) async {
    try {
      final purchases =
          await (select(purchaseEntity)
                ..where(
                  (tbl) => (tbl.finalizedAt.month.isBiggerOrEqualValue(month)),
                )
                ..where(
                  (tbl) => (tbl.createdAt.month.isSmallerOrEqualValue(month)),
                )
                ..where(
                  (tbl) => tbl.finalizedAt.year.isBiggerOrEqualValue(year),
                )
                ..where((tbl) => tbl.createdAt.year.isBiggerOrEqualValue(year))
                ..where((tb) => tb.deletedAt.isNull()))
              .get();
      return Result.ok(
        purchases.map((e) => PurchaseDbMapper.toDomain(e)).toList(),
      );
    } catch (e) {
      return Result.failure(Exception(e.toString()));
    }
  }

  @override
  Future<Result<void>> registerPurchase(
    Purchase purchase, {
    bool isLocal = false,
  }) async {
    try {
      final creditCard =
          await (select(creditcardEntity)
                ..where((tbl) => tbl.idDomain.equals(purchase.creditCardId!)))
              .getSingleOrNull();

      if (creditCard == null) {
        return Result.failure(Exception('Credit card not found'));
      }

      final companion = PurchaseDbMapper.toCompanion(
        purchase,
        creditCard.id,
        needToSync: isLocal,
      );
      await into(purchaseEntity).insert(companion);
      return Result.ok(null);
    } catch (e) {
      log(e.toString());
      return Result.failure(Exception(e.toString()));
    }
  }

  @override
  Stream watch() {
    return select(purchaseEntity).watch();
  }

  @override
  Future<Result<void>> markAsDeleted(String id) async {
    try {
      (update(purchaseEntity)..where((tb) => tb.idDomain.equals(id))).write(
        PurchaseEntityCompanion(
          deletedAt: Value(DateTime.now()),
          needToSync: Value(true),
        ),
      );
      return Result.ok(null);
    } catch (e) {
      return Result.failure(Exception(e.toString()));
    }
  }

  @override
  Future<Result<void>> markAsUpdated(String id) async {
    try {
      (update(purchaseEntity)..where((tb) => tb.idDomain.equals(id))).write(
        PurchaseEntityCompanion(
          updatedAt: Value(DateTime.now()),
          needToSync: Value(true),
        ),
      );
      return Result.ok(null);
    } catch (e) {
      return Result.failure(Exception(e.toString()));
    }
  }

  @override
  Future<Result<List<Purchase>>> getPendingSyncPurchases() async {
    try {
      final purchases = await (select(
        purchaseEntity,
      )..where((tbl) => tbl.needToSync.equals(true))).get();
      return Result.ok(
        purchases.map((e) => PurchaseDbMapper.toDomain(e)).toList(),
      );
    } catch (e) {
      return Result.failure(Exception(e.toString()));
    }
  }
}
