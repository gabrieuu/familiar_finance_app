import 'package:familiar_finance_app/data/services/purchase/model/purchase_dto.dart';
import 'package:familiar_finance_app/domain/purchase/purchase.dart';

abstract class PurchaseService {
  Future<List<PurchaseDTO>> getPurchasesByCreditCardId(String creditCardId);
  Future<void> createPurchase(Purchase purchase);
  Future<void> deletePurchase(String purchaseId);
}

class PurchaseServiceImpl implements PurchaseService {
  @override
  Future<List<PurchaseDTO>> getPurchasesByCreditCardId(String creditCardId) {
    // TODO: implement getPurchasesByCreditCardId
    throw UnimplementedError();
  }

  @override
  Future<void> createPurchase(Purchase purchase) {
    // TODO: implement createPurchase
    throw UnimplementedError();
  }

  @override
  Future<void> deletePurchase(String purchaseId) {
    // TODO: implement deletePurchase
    throw UnimplementedError();
  }
}
