import 'package:familiar_finance_app/data/repositories/creditcard/creditcard_repository.dart';
import 'package:familiar_finance_app/domain/credit_card/credit_card.dart';
import 'package:familiar_finance_app/utils/result.dart';

class CreditcardLocalRepository implements CreditCardRepository{

  final List<CreditCard> _creditCards = [
    CreditCard(id: '1', nomeCartao: 'Nubank', diaFechamento: 10, diaVencimento: 15, limite: 5000),
    CreditCard(id: '2', nomeCartao: 'Banco Inter', diaFechamento: 15, diaVencimento: 20, limite: 3000),
  ];

  @override
  Future<Result<CreditCard>> getCreditCardById(String creditCardId) async{
    return Result.ok(_creditCards.firstWhere((element) => element.id == creditCardId));
  }

  @override
  Future<Result<void>> addCreditCard(CreditCard creditCard)  async{
    _creditCards.add(creditCard);
    return Result.ok(null);
  }

  @override
  Future<Result<void>> deleteCreditCard(String creditCardId) async{
    _creditCards.removeWhere((element) => element.id == creditCardId);
    return Result.ok(null);
  }

  @override
  Future<Result<List<CreditCard>>> getCreditCards() async{
    return Result.ok(_creditCards);
  }

  @override
  Future<Result<void>> updateCreditCard(CreditCard creditCard) async{
    final index = _creditCards.indexWhere((element) => element.id == creditCard.id);
    if (index != -1) {
      _creditCards[index] = creditCard;
    }
    return Result.ok(null);
  }
}