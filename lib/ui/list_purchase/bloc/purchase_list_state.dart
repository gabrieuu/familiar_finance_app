import 'package:familiar_finance_app/domain/purchase/purchase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'purchase_list_state.freezed.dart';

@freezed
abstract class PurchaseListState with _$PurchaseListState {
  const factory PurchaseListState({
    @Default([]) List<Purchase> purchases,
    String? errorMessage,
    required DateTime selectedDate,
  }) = _PurchaseListState;

  factory PurchaseListState.initial() => PurchaseListState(selectedDate: DateTime.now());

}