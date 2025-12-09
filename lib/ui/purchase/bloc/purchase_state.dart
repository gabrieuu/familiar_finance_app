import 'package:familiar_finance_app/domain/models/credit_card/credit_card.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'purchase_state.freezed.dart';

@freezed
abstract class PurchaseCreateState with _$PurchaseCreateState {
  const factory PurchaseCreateState({
    @Default([]) List<CreditCard> creditCards,
    @Default(false) bool cardsLoading,
    @Default(false) bool isLoading,
    String? errorMessage,
    String? cardSelectedId,
    String? title,
    String? buyerName,
    double? amount,
    int? installments,
    DateTime? purchaseDate,
    @Default(false) bool isFixed,
    @Default(false) bool isInstallment,
  }) = _PurchaseCreateState;

  factory PurchaseCreateState.initial() => const PurchaseCreateState();
}