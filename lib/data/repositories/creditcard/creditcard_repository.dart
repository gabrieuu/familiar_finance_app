import 'package:familiar_finance_app/domain/credit_card/credit_card.dart';
import 'package:familiar_finance_app/utils/result.dart';

abstract class CreditCardRepository {
  Future<Result<CreditCard>> getCreditCardById(String creditCardId);
  Future<Result<List<CreditCard>>> getCreditCards();
  Future<Result<void>> addCreditCard(CreditCard creditCard);
  Future<Result<void>> updateCreditCard(CreditCard creditCard);
  Future<Result<void>> deleteCreditCard(String creditCardId);
}