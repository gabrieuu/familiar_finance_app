import 'package:familiar_finance_app/data/database/interface/mixin/modified_database.dart';
import 'package:familiar_finance_app/domain/installments/installments.dart';
import 'package:familiar_finance_app/utils/result.dart';

abstract class InstallmentDb implements ModifiedDatabase {
  Future<Result<List<Installments>>> getInstallmentsByPurchasesIds(
    List<String> purchaseIds,
  );
  Future<Result<void>> registerInstallment(
    String purchaseId,
    List<Installments> installments, {
    bool isLocal = false,
  });
  Future<Result<List<Installments>>> getPendingSyncInstallments();
}
