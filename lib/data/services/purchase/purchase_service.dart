import 'package:familiar_finance_app/data/services/purchase/model/purchase_dto.dart';
import 'package:familiar_finance_app/domain/purchase/purchase.dart';
import 'package:familiar_finance_app/utils/result.dart';

abstract class PurchaseService {
  Future<Result<List<PurchaseDTO>>> getPurchasesByCreditCardId(String creditCardId);
  Future<Result<void>> createPurchase(Purchase purchase);
  Future<Result<void>> deletePurchase(String purchaseId);
}