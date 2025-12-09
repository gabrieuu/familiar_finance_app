import 'package:familiar_finance_app/data/services/creditcard/model/credit_card_dto.dart';
import 'package:familiar_finance_app/utils/result.dart';

abstract class CreditcardService {
  Future<Result<void>> createCreditcard(CreditCardDTO creditCard);
  Future<Result<List<CreditCardDTO>>> getCreditcardsByUserId(String userId);
  Future<Result<void>> deleteCreditcard(String creditCardId);
}