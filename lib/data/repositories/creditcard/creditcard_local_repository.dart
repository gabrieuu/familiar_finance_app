import 'package:familiar_finance_app/data/repositories/creditcard/creditcard_repository.dart';
import 'package:familiar_finance_app/data/services/creditcard/creditcard_local_service.dart';
import 'package:familiar_finance_app/data/services/creditcard/creditcard_service.dart';
import 'package:familiar_finance_app/data/services/creditcard/model/credit_card_dto.dart';
import 'package:familiar_finance_app/data/services/user/user_local_service.dart';
import 'package:familiar_finance_app/data/services/user/user_service.dart';
import 'package:familiar_finance_app/domain/models/credit_card/credit_card.dart';
import 'package:familiar_finance_app/utils/result.dart';

class CreditcardLocalRepository extends CreditCardRepository{

  final CreditcardService _creditcardService = CreditcardLocalService();
  final UserService _userService = UserLocalService();
  List<CreditCard> creditCards = [];

  @override
  Future<Result<void>> addCreditCard(CreditCard creditCard) async{
    final result = await _creditcardService.createCreditcard(CreditCardDTO(userId: creditCard.userId, nomeCartao: creditCard.nomeCartao, diaVencimento: creditCard.diaVencimento));
    return result.when(ok: (_){
      creditCards.add(creditCard);
      return Result.ok(null);
    }, error: (e) => Result.error(e));
  }

  @override
  Future<Result<void>> deleteCreditCard(String creditCardId) async{
    final result = await _creditcardService.deleteCreditcard(creditCardId);
    return result.when(ok: (_){
      creditCards.removeWhere((card) => card.cardId == creditCardId);
      return Result.ok(null);
    }, error: (e) => Result.error(e));
  }

  @override
  Future<Result<List<CreditCard>>> getCreditCards() async{
    final userResult = await _userService.getUser();

    final user = userResult.when(ok: (user) => user, error: (e) => null);
    if (user == null) {
      return Result.error('User not found');
    }

    final userId = user.id;

    final result = await _creditcardService.getCreditcardsByUserId(userId);
    return result.when(
      ok: (dtos) {
        final cards = dtos.map((dto) => CreditCard(
          cardId: dto.id ?? '',
          userId: dto.userId,
          nomeCartao: dto.nomeCartao,
          diaVencimento: dto.diaVencimento,
          limite: dto.limiteCredito,
        )).toList();
        return Result.ok(cards);
      },
      error: (e) => Result.error(e),
    );
  }

  @override
  Future<Result<void>> updateCreditCard(CreditCard creditCard) {
    return Future.value(Result.ok(null));
  }

}