import 'package:familiar_finance_app/data/repositories/creditcard/creditcard_repository.dart';
import 'package:familiar_finance_app/data/repositories/purchase/purchase_repository.dart';
import 'package:familiar_finance_app/domain/credit_card/credit_card.dart';
import 'package:familiar_finance_app/domain/installments/installments.dart';
import 'package:familiar_finance_app/domain/purchase/purchase.dart';
import 'package:familiar_finance_app/utils/result.dart';

class CreatePurchaseUsecase {
  final PurchaseRepository _purchaseRepository;
  final CreditCardRepository _creditCardRepository;

  CreatePurchaseUsecase(this._purchaseRepository, this._creditCardRepository);

  Future<Result<void>> execute(Purchase purchase) async{
    List<Installments> installments = await _generateInstallmentsByPurchase(purchase);
    purchase = purchase.copyWith(installments: installments, finalizedAt: installments.isNotEmpty ? installments.last.dueDate : purchase.createdAt);
    return _purchaseRepository.registerPurchase(purchase);
  }

  Future<List<Installments>> _generateInstallmentsByPurchase(Purchase purchase) async {
    List<Installments> installments = [];
    
    if(purchase.type != TypePurchase.parcel){
      return installments;
    }
    
    final creditCardResult = await _creditCardRepository.getCreditCardById(purchase.creditCardId!);
    
    if(creditCardResult.isfailure){
      return installments;
    }

    CreditCard creditCard = creditCardResult.data;

    for(int i = 0; i < purchase.numberOfInstallments; i++){
      if(purchase.createdAt.day > creditCard.diaFechamento){
        i = i + 1;
      }
      installments.add(Installments(
        dueDate: DateTime(purchase.createdAt.year, purchase.createdAt.month + i, purchase.createdAt.day),
        amount: purchase.amount / purchase.numberOfInstallments
      ));
    }
    return installments;
  }
}


// 04/02/2026

//fechamento = 5;

// 04/02/2026
// 04/03/2026
// 04/04/2026
// 04/05/2026