import 'package:familiar_finance_app/domain/models/purchase/purchase.dart';
import 'package:familiar_finance_app/utils/result.dart';

abstract class PurchaseRepository {
  Future<Result<List<Purchase>>> getAllPurchaseByCreditCard(String creditCardId);
  Future<Result<void>> registerPurchase(Purchase purchase);
  Future<Result<void>> editPurchase(String purchaseId, Purchase purchase);
  Future<Result<void>> deletePurchase(String purchaseId);
}