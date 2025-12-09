import 'package:familiar_finance_app/data/services/installments/model/installment_dto.dart';
import 'package:familiar_finance_app/utils/result.dart';

abstract class InstallmentsService {
  Future<Result<List<InstallmentDTO>>> getInstallmentsByPurchaseId(String purchaseId);
}