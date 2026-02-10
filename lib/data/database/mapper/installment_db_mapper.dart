import 'package:drift/drift.dart';
import 'package:familiar_finance_app/data/database/app_database.dart';
import 'package:familiar_finance_app/domain/installments/installments.dart';

class InstallmentDbMapper {
  static InstallmentEntityCompanion toCompanion(
    Installments installments,
    int purchaseId, {
    bool needToSync = false,
  }) {
    return InstallmentEntityCompanion(
      idDomain: Value(installments.id),
      purchaseIdDomain: Value(installments.purchaseId),
      purchaseId: Value(purchaseId),
      amount: Value(installments.amount),
      dueDate: Value(installments.dueDate),
      needToSync: Value(needToSync),
    );
  }

  static Installments toDomain(InstallmentEntityData installment) {
    return Installments(
      id: installment.idDomain,
      purchaseId: installment.purchaseIdDomain,
      amount: installment.amount,
      dueDate: installment.dueDate,
    );
  }
}
