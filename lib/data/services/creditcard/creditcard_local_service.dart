import 'package:familiar_finance_app/data/services/creditcard/creditcard_service.dart';
import 'package:familiar_finance_app/data/services/creditcard/model/credit_card_dto.dart';
import 'package:familiar_finance_app/data/services/local_assets/json_assets.dart';
import 'package:familiar_finance_app/utils/result.dart';

class CreditcardLocalService extends CreditcardService{
  @override
  Future<Result<void>> createCreditcard(CreditCardDTO creditCard) {
   return Future.value(Result.ok(null));
  }

  @override
  Future<Result<void>> deleteCreditcard(String creditCardId) {
    return Future.value(Result.ok(null));
  }

  @override
  Future<Result<List<CreditCardDTO>>> getCreditcardsByUserId(String userId) async {
    final json = await JsonAssets.loadStringAssets(Assets.creditcard);
    try {
      final creditCard = json.map<CreditCardDTO>(CreditCardDTO.fromJson).toList()
      .where((card) => card.userId == userId).toList();
      return Future.value(Result.ok(creditCard));
    } catch (e) {
      return Future.value(Result.error(e.toString()));
    }
  }

}