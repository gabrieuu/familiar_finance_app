import 'package:familiar_finance_app/data/repositories/purchase/purchase_repository.dart';
import 'package:familiar_finance_app/data/services/installments/installments_local_service.dart';
import 'package:familiar_finance_app/data/services/installments/installments_service.dart';
import 'package:familiar_finance_app/data/services/purchase/purchase_local_service.dart';
import 'package:familiar_finance_app/data/services/purchase/purchase_service.dart';
import 'package:familiar_finance_app/domain/models/installments/installments.dart';
import 'package:familiar_finance_app/domain/models/purchase/purchase.dart';
import 'package:familiar_finance_app/utils/result.dart';

class PurchaseLocalRepository extends PurchaseRepository {

  final PurchaseService _purchaseService = PurchaseLocalService();
  final InstallmentsService _installmentsService = InstallmentsLocalService();
  
  @override
  Future<Result<void>> deletePurchase(String purchaseId) {
    return _purchaseService.deletePurchase(purchaseId);
  }

  @override
  Future<Result<void>> editPurchase(String purchaseId, Purchase purchase) {
    throw UnimplementedError();
  }

  @override
  Future<Result<List<Purchase>>> getAllPurchaseByCreditCard(String creditCardId) async{
    final result = await _purchaseService.getPurchasesByCreditCardId(creditCardId);
    return result.when(ok: (data) async{
      List<Purchase> purchases = [];
      for(var purchase in data){
        final installmentsResult = await _installmentsService.getInstallmentsByPurchaseId(purchase.purchaseId);
        installmentsResult.when(ok: (data){
          purchases.add(Purchase(
          title: purchase.title,
          type: purchase.type,
          purchaseId: purchase.purchaseId,
          installments: data.map((dto) => Installments(
            installmentId: dto.installmentId,
            purchaseId: dto.purchaseId,
            amount: dto.amount,
            installmentNumber: dto.installmentNumber,
            month: dto.month,
            status: dto.isPaid ? 'paid' : 'unpaid',
          )).toList(),
          amount: purchase.amount,
          buyerId: purchase.buyerId,
          buyerName: purchase.buyerName,
          creditCardId: purchase.creditCardId,
          startDate: purchase.startDate,
        ));
        }, error: (_){});
      }
      return Result.ok(purchases);
    }, error: (error){
      return Result.error(error);
    });
  }

  @override
  Future<Result<void>> registerPurchase(Purchase purchase) {
    return _purchaseService.createPurchase(purchase);
  }

}