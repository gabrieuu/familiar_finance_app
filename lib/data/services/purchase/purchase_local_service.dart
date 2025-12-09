import 'package:familiar_finance_app/data/services/local_assets/json_assets.dart';
import 'package:familiar_finance_app/data/services/purchase/model/purchase_dto.dart';
import 'package:familiar_finance_app/data/services/purchase/purchase_service.dart';
import 'package:familiar_finance_app/domain/models/purchase/purchase.dart';
import 'package:familiar_finance_app/utils/result.dart';

class PurchaseLocalService extends PurchaseService{
  @override
  Future<Result<void>> createPurchase(Purchase purchase) async{
   return Future.value(Result.ok(null));
  }

  @override
  Future<Result<void>> deletePurchase(String purchaseId) {
    return Future.value(Result.ok(null));
  }

  @override
  Future<Result<List<PurchaseDTO>>> getPurchasesByCreditCardId(String creditCardId) async {
    final purchaseJson = await JsonAssets.loadStringAssets(Assets.purchase);
    try {
      final purchases = purchaseJson.map(PurchaseDTO.fromMap).toList().where((purchase) => purchase.creditCardId == creditCardId).toList();
      return Future.value(Result.ok(purchases));
    }catch (e) {
      return Future.value(Result.error(e.toString()));
    }
  }
  
}