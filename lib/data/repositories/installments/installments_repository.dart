import 'package:familiar_finance_app/data/database/interface/installment_db.dart';
import 'package:familiar_finance_app/domain/installments/installments.dart';
import 'package:familiar_finance_app/utils/result.dart';

class InstallmentsRepository {
  final InstallmentDb _installmentDb;

  InstallmentsRepository(this._installmentDb);

  Future<Result<List<Installments>>> getInstallmentByPurchaseId(
    String purchaseId,
  ) async {
    return _installmentDb.getInstallmentByPurchaseId(purchaseId);
  }

  Future<Result<void>> registerInstallment(
    String purchaseId,
    List<Installments> installments,
  ) async {
    return _installmentDb.registerInstallment(purchaseId, installments);
  }

  Future<Result<List<Installments>>> getPendingSyncInstallments() async {
    return _installmentDb.getPendingSyncInstallments();
  }
}
