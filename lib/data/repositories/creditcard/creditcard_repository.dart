import 'package:familiar_finance_app/data/database/interface/creditcard_db.dart';
import 'package:familiar_finance_app/domain/credit_card/credit_card.dart';
import 'package:familiar_finance_app/utils/result.dart';

class CreditCardRepository {
  final CreditCardDb creditCardDb;

  CreditCardRepository(this.creditCardDb);

  Future<Result<CreditCard>> getCreditCardById(String creditCardId) async {
    return creditCardDb.getCreditCardById(creditCardId);
  }

  Future<Result<void>> addCreditCard(CreditCard creditCard) async {
    return creditCardDb.addCreditCard(creditCard);
  }

  Future<Result<void>> deleteCreditCard(String creditCardId) async {
    return creditCardDb.deleteCreditCard(creditCardId);
  }

  Future<Result<List<CreditCard>>> getCreditCards() async {
    return creditCardDb.getCreditCards();
  }

  Future<Result<void>> updateCreditCard(CreditCard creditCard) async {
    return creditCardDb.updateCreditCard(creditCard);
  }
}
