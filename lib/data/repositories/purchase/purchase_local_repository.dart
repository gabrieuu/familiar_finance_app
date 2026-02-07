import 'dart:async';

import 'package:familiar_finance_app/data/repositories/purchase/purchase_repository.dart';
import 'package:familiar_finance_app/domain/purchase/purchase.dart';
import 'package:familiar_finance_app/utils/result.dart';

class PurchaseLocalRepository implements PurchaseRepository{
  
  final List<Purchase> _purchases = [];

  final _controller = StreamController<List<Purchase>>.broadcast();

  PurchaseLocalRepository(){
   _emit();
  }

  void _emit() {
    _controller.add(List.unmodifiable(_purchases));
  }

  @override
  Future<Result<List<Purchase>>> getAllPurchaseByCreditCard(String creditCardId) async{
    return Result.ok(List.unmodifiable(_purchases.where((p) => p.creditCardId == creditCardId).toList()));
  }

  @override
  Future<Result<void>> deletePurchase(String purchaseId) async{
    _purchases.removeWhere((p) => p.id == purchaseId);
    _emit();
    return Result.ok(null);
  }

  @override
  Future<Result<void>> editPurchase(String purchaseId, Purchase purchase) async {
   final index = _purchases.indexWhere((p) => p.id == purchaseId);
    if (index != -1) {
      _purchases[index] = purchase;
      _emit();
    }
    return Result.ok(null);
  }

  @override
  Future<Result<void>> registerPurchase(Purchase purchase) async {
   _purchases.add(purchase);
    _emit();
    return Result.ok(null);
  }

  @override
  Future<Result<List<Purchase>>> getPurchasesByMonth(int month, int year) async {
    return Result.ok(List.unmodifiable(_purchases.where((p) =>  p.finalizedAt == null ||  ((p.createdAt.month <= month && p.createdAt.year <= year) && (p.finalizedAt!.month >= month && p.finalizedAt!.year >= year))).toList()));
  }
  
  @override
  Stream<List<Purchase>> watch() {
    return _controller.stream;
  }
}