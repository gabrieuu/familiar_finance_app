import 'dart:developer';

import 'package:familiar_finance_app/data/repositories/creditcard/creditcard_repository.dart';
import 'package:familiar_finance_app/domain/purchase/purchase.dart';
import 'package:familiar_finance_app/ui/purchase/bloc/purchase_state.dart';
import 'package:familiar_finance_app/ui/purchase/use_case/create_purchase_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreatePurchaseBloc extends Cubit<PurchaseCreateState>{

  CreatePurchaseBloc(
    this._cardRepository, 
    this._createPurchaseUsecase,
  )
  : super(PurchaseCreateState.initial()){
    loadCreditCards();
  }

  final CreditCardRepository _cardRepository;
  final CreatePurchaseUsecase _createPurchaseUsecase;

  void loadForEdit(Purchase purchase) async {
    emit(state.copyWith(
      isFixed: purchase.type == TypePurchase.fixed,
      isInstallment: purchase.type == TypePurchase.parcel,
      title: purchase.title,
      purchaseDate: purchase.createdAt,
      amount: purchase.amount,
      cardSelectedId: purchase.creditCardId,
      initialPurchase: purchase,
    ));
  }

  Future<void> loadCreditCards() async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    final resultCards = await _cardRepository.getCreditCards();

    resultCards.when(
      ok: (cards) {
       for (var card in cards) {
          log("Loaded card: ${card.id}");  
        }
        emit(state.copyWith(creditCards: cards, isLoading: false));
      },
      failure: (error) {
        log("Error loading cards: ${error.toString()}");  
        emit(state.copyWith(errorMessage: error.toString(), isLoading: false));
      },
    );
  }

  Purchase get _getPurchaseFromState => Purchase(
                            id: state.initialPurchase?.id,
                            title: state.title!,
                            type: state.isFixed ? TypePurchase.fixed : state.isInstallment ? TypePurchase.parcel : TypePurchase.single,
                            creditCardId: state.cardSelectedId,
                            numberOfInstallments: state.installments,
                            amount: state.amount ?? 0.0,
                            createdAt: state.purchaseDate ?? DateTime.now(),
                          );

  void addPurchase() async {
    if(state.cardSelectedId == null){
      emit(state.copyWith(errorMessage: 'Select a credit card'));
      return;
    }
    emit(state.copyWith(isLoading: true, errorMessage: null));

    final result = await _createPurchaseUsecase.execute(_getPurchaseFromState);

    result.when(
      ok: (_) => emit(state.copyWith(isLoading: false)), 
      failure: (error) => emit(state.copyWith(errorMessage: error.toString()))
    );
  }

  void setPurchaseDate(DateTime date){
    emit(state.copyWith(purchaseDate: date));
  }

  void setIsFixed() => emit(state.copyWith(isFixed: !state.isFixed));

  void setIsInstallment() => emit(state.copyWith(isInstallment: !state.isInstallment));

  void setSelectedCardId(String cardId){
    emit(state.copyWith(cardSelectedId: cardId));
  }

  void setInstallments(int? installments){
    if(installments == null) return;
    emit(state.copyWith(installments: installments));
  }

  void setTitle(String title){
    emit(state.copyWith(title: title));
  }

  void setBuyerName(String buyerName){
    emit(state.copyWith(buyerName: buyerName));
  }

  void setAmount(double amount){
    emit(state.copyWith(amount: amount));
  }

}