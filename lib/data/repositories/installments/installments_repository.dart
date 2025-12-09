import 'package:familiar_finance_app/domain/models/installments/installments.dart';
import 'package:familiar_finance_app/utils/result.dart';

abstract class InstallmentsRepository {
  Future<Result<List<Installments>>> getInstallmentsByPurchaseId(String purchaseId);
}