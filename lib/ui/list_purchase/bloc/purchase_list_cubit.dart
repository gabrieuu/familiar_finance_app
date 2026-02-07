import 'dart:async';

import 'package:familiar_finance_app/data/repositories/purchase/purchase_repository.dart';
import 'package:familiar_finance_app/domain/purchase/purchase.dart';
import 'package:familiar_finance_app/ui/list_purchase/bloc/purchase_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PurchaseListCubit extends Cubit<PurchaseListState>{
  PurchaseListCubit(
    this._purchaseRepository
  ): super(PurchaseListState.initial());

  final PurchaseRepository _purchaseRepository;
  late final StreamSubscription _stubPurchase;

  void start(){
    _stubPurchase = _purchaseRepository.watch().listen((data){
      List<Purchase> purchases = _filterPurchasesBySelectedDate(data);
      emit(state.copyWith(
        purchases: purchases
      ));
    });
  }

  void setSelectedDate(DateTime date){
    emit(state.copyWith(selectedDate: date));
    getPurchasesByMonth();
  }

  void getPurchasesByMonth() async {
    final result = await _purchaseRepository.getPurchasesByMonth(state.selectedDate.month, state.selectedDate.year);
    result.when(
      ok: (purchases){
        List<Purchase> listPurchases = _filterPurchasesBySelectedDate(purchases);
        emit(state.copyWith(purchases: listPurchases));
      },
      failure: (error) => emit(state.copyWith(errorMessage: error.toString())),
    );
  }

  List<Purchase> _filterPurchasesBySelectedDate(List<Purchase> purchases) {
    return purchases.where((p) =>  p.finalizedAt == null || ((p.createdAt.month <= state.selectedDate.month && p.createdAt.year <= state.selectedDate.year) && (p.finalizedAt!.month >= state.selectedDate.month && p.finalizedAt!.year >= state.selectedDate.year))).toList();
  }

  @override
  Future<void> close() {
    _stubPurchase.cancel();
    return super.close();
  }
}