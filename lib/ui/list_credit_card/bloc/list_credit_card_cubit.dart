import 'package:familiar_finance_app/data/repositories/creditcard/creditcard_repository.dart';
import 'package:familiar_finance_app/ui/list_credit_card/bloc/credit_list_card_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListCreditCardCubit extends Cubit<CreditListCardState> {
  ListCreditCardCubit(this._cardRepository) : super(CreditListCardState.initial());

  final CreditCardRepository _cardRepository;

  void loadCreditCards() async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    final resultCards = await _cardRepository.getCreditCards();

    resultCards.when(
      ok: (cards) => emit(state.copyWith(creditCards: cards, isLoading: false)),
      failure: (error) => emit(state.copyWith(errorMessage: error.toString(), isLoading: false)),
    );
  }
}