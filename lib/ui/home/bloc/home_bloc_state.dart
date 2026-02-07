import 'package:familiar_finance_app/domain/credit_card/credit_card.dart';
import 'package:familiar_finance_app/domain/purchase/purchase.dart';
import 'package:familiar_finance_app/domain/user/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_bloc_state.freezed.dart';

@freezed
abstract class HomeBlocState with _$HomeBlocState {
  const factory HomeBlocState({
    @Default(false) bool isLoading,
    String? errorMessage,
    User ? user,
    @Default([]) List<CreditCard> creditCards,
    @Default([]) List<Purchase> purchases,
  }) = _HomeBlocState;

  factory HomeBlocState.initial() => const HomeBlocState();

}