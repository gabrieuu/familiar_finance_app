
import 'package:familiar_finance_app/domain/credit_card/credit_card.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'credit_list_card_state.freezed.dart';

@freezed
abstract class CreditListCardState with _$CreditListCardState{
  const factory CreditListCardState({
    @Default([]) List<CreditCard> creditCards,
    String? errorMessage,
    @Default(false) bool isLoading,
  }) = _CreditListCardState;

  factory CreditListCardState.initial() => CreditListCardState();
}