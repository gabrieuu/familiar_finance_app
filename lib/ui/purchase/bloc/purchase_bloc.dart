import 'dart:developer';

import 'package:familiar_finance_app/data/repositories/creditcard/creditcard_repository.dart';
import 'package:familiar_finance_app/data/repositories/purchase/purchase_repository.dart';
import 'package:familiar_finance_app/domain/models/purchase/purchase.dart';
import 'package:familiar_finance_app/ui/purchase/bloc/purchase_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PurchaseBloc extends Cubit<PurchaseCreateState>{

  PurchaseBloc(this._cardRepository, this._purchaseRepository, {Purchase? initialPurchase})
  : super(initialPurchase == null ? PurchaseCreateState.initial() 
    : PurchaseCreateState.initial().copyWith(cardSelectedId: initialPurchase.creditCardId, title: initialPurchase.title, buyerName: initialPurchase.buyerName, amount: initialPurchase.amount, installments: initialPurchase.installments.length, purchaseDate: initialPurchase.startDate)){
    loadCreditCards();
  }

  final CreditCardRepository _cardRepository;
  final PurchaseRepository _purchaseRepository;

  Future<void> loadCreditCards() async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    final resultCards = await _cardRepository.getCreditCards();

    resultCards.when(
      ok: (cards) {
       for (var card in cards) {
          log("Loaded card: ${card.cardId}");  
        }
        emit(state.copyWith(creditCards: cards, isLoading: false));
      },
      error: (error) {
        log("Error loading cards: ${error.toString()}");  
        emit(state.copyWith(errorMessage: error.toString(), isLoading: false));
      },
    );
  }

  void addPurchase() async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
      Purchase purchase = Purchase(
                            creditCardId: state.cardSelectedId ?? state.creditCards.first.cardId,
                            title: state.title ?? '',
                            type: state.isFixed ? 'fixed' : (state.isInstallment ? 'parcel' : 'credit'),
                            buyerName: state.buyerName ?? '',
                            amount: state.amount ?? 0.0,
                            installments: [],
                            startDate: state.purchaseDate,
                          );

      final result = await _purchaseRepository.registerPurchase(purchase);

      result.when(
        ok: (_) => emit(state.copyWith(isLoading: false)), 
        error: (error) => emit(state.copyWith(errorMessage: error.toString()))
      );

      log(purchase.toString());
  }

  void setIsFixed() => emit(state.copyWith(isFixed: !state.isFixed));

  void setIsInstallment() => emit(state.copyWith(isInstallment: !state.isInstallment));

  void setSelectedCardId(String cardId){
    emit(state.copyWith(cardSelectedId: cardId));
  }

  void setInstallments(int installments){
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