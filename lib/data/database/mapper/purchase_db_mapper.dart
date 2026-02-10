import 'package:drift/drift.dart';
import 'package:familiar_finance_app/data/database/app_database.dart';
import 'package:familiar_finance_app/domain/purchase/purchase.dart';

class PurchaseDbMapper {
  static PurchaseEntityCompanion toCompanion(
    Purchase purchase,
    int creditCardId, {
    bool needToSync = false,
  }) {
    return PurchaseEntityCompanion(
      idDomain: Value(purchase.id),
      title: Value(purchase.title),
      type: Value(purchase.type.name),
      amount: Value(purchase.amount),
      creditCardId: Value(creditCardId),
      createdAt: Value(purchase.createdAt),
      needToSync: Value(needToSync),
      finalizedAt: Value(purchase.finalizedAt),
    );
  }

  static Purchase toDomain(PurchaseEntityData data) {
    return Purchase(
      id: data.idDomain,
      title: data.title,
      type: TypePurchase.fromString(data.type),
      amount: data.amount,
      creditCardId: data.creditCardIdDomain,
      createdAt: data.createdAt,
      finalizedAt: data.finalizedAt,
    );
  }
}
