import 'package:familiar_finance_app/data/database/interface/mixin/modified_database.dart';
import 'package:familiar_finance_app/domain/purchase/purchase.dart';
import 'package:familiar_finance_app/utils/result.dart';

abstract class PurchaseDb implements ModifiedDatabase {
  Stream watch();
  Future<Result<List<Purchase>>> getAllPurchaseByCreditCard(
    String creditCardId,
  );
  Future<Result<List<Purchase>>> getPurchasesByMonth(int month, int year);
  Future<Result<void>> registerPurchase(
    Purchase purchase, {
    bool isLocal = false,
  });
  Future<Result<void>> editPurchase(Purchase purchase, {bool isLocal = false});
  Future<Result<void>> deletePurchase(String purchaseId);
  Future<Result<List<Purchase>>> getPendingSyncPurchases();
}
