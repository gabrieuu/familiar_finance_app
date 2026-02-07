import 'package:familiar_finance_app/domain/purchase/purchase.dart';
import 'package:familiar_finance_app/utils/result.dart';

abstract class PurchaseRepository {
  Stream<List<Purchase>> watch();
  Future<Result<List<Purchase>>> getAllPurchaseByCreditCard(String creditCardId);
  Future<Result<List<Purchase>>> getPurchasesByMonth(int month, int year);
  Future<Result<void>> registerPurchase(Purchase purchase);
  Future<Result<void>> editPurchase(String purchaseId, Purchase purchase);
  Future<Result<void>> deletePurchase(String purchaseId);
}