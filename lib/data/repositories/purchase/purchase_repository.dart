import 'dart:async';
import 'package:familiar_finance_app/data/database/interface/purchase_db.dart';
import 'package:familiar_finance_app/data/services/purchase/purchase_service.dart';
import 'package:familiar_finance_app/domain/purchase/purchase.dart';
import 'package:familiar_finance_app/utils/result.dart';

class PurchaseRepository {
  final PurchaseService _purchaseService;
  final PurchaseDb _purchaseDao;

  PurchaseRepository(this._purchaseService, this._purchaseDao);

  Future<Result<void>> deletePurchase(String purchaseId) async {
    try {
      await _purchaseService.deletePurchase(purchaseId);
      await _purchaseDao.deletePurchase(purchaseId);
      return Result.ok(null);
    } catch (e) {
      await _purchaseDao.markAsDeleted(purchaseId);
      return Result.failure('Deletado localmente');
    }
  }

  Future<Result<void>> editPurchase(
    String purchaseId,
    Purchase purchase,
  ) async {
    return _purchaseDao.editPurchase(purchase);
  }

  Future<Result<void>> registerPurchase(Purchase purchase) async {
    try {
      await _purchaseService.createPurchase(purchase);
      await _purchaseDao.registerPurchase(purchase);
      return Result.ok(null);
    } catch (e) {
      final result = await _purchaseDao.registerPurchase(purchase);
      return result.when(
        ok: (_) => Result.ok(null),
        failure: (error) => Result.failure(error),
      );
    }
  }

  Future<Result<List<Purchase>>> getPurchasesByMonth(
    int month,
    int year,
  ) async {
    return _purchaseDao.getPurchasesByMonth(month, year);
  }

  Stream watch() {
    return _purchaseDao.watch();
  }
}
