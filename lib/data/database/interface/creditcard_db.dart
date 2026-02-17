import 'package:familiar_finance_app/data/database/interface/mixin/modified_database.dart';
import 'package:familiar_finance_app/domain/credit_card/credit_card.dart';
import 'package:familiar_finance_app/utils/result.dart';

abstract class CreditCardDb implements ModifiedDatabase {
  Future<Result<List<CreditCard>>> getCreditCards();
  Future<Result<CreditCard>> getCreditCardById(String creditCardId);
  Future<Result<void>> addCreditCard(
    CreditCard creditCard, {
    bool isLocal = false,
  });
  Future<Result<void>> updateCreditCard(
    CreditCard creditCard, {
    bool isLocal = false,
  });
  Future<Result<void>> deleteCreditCard(String creditCardId);
  Future<Result<List<CreditCard>>> getPendingSyncCreditCards();
}
