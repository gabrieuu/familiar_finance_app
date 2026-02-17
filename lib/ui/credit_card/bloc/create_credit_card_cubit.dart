import 'package:familiar_finance_app/data/repositories/creditcard/creditcard_repository.dart';
import 'package:familiar_finance_app/domain/credit_card/credit_card.dart';
import 'package:familiar_finance_app/ui/credit_card/bloc/create_credit_card_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateCreditCardCubit extends Cubit<CreateCreditCardState> {
  final CreditCardRepository creditCardRepository;

  CreateCreditCardCubit(this.creditCardRepository)
    : super(const CreateCreditCardState());

  void setNomeCartao(String nome) {
    emit(state.copyWith(nomeCartao: nome));
  }

  void setDiaVencimento(int dia) {
    emit(state.copyWith(diaVencimento: dia));
  }

  void setDiaFechamento(int dia) {
    emit(state.copyWith(diaFechamento: dia));
  }

  void setLimite(double limite) {
    emit(state.copyWith(limite: limite));
  }

  Future<void> submit() async {
    if (state.nomeCartao.isEmpty) {
      emit(
        state.copyWith(
          status: CreateCreditCardStatus.failure,
          errorMessage: 'Por favor, insira o nome do cartão.',
        ),
      );
      return;
    }

    emit(state.copyWith(status: CreateCreditCardStatus.loading));

    final creditCard = CreditCard(
      nomeCartao: state.nomeCartao,
      diaVencimento: state.diaVencimento,
      diaFechamento: state.diaFechamento,
      limite: state.limite,
    );

    final result = await creditCardRepository.addCreditCard(creditCard);

    result.when(
      ok: (_) => emit(state.copyWith(status: CreateCreditCardStatus.success)),
      failure: (error) => emit(
        state.copyWith(
          status: CreateCreditCardStatus.failure,
          errorMessage: error.toString(),
        ),
      ),
    );
  }
}
