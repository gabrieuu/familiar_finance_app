import 'package:familiar_finance_app/domain/installments/installments.dart';
import 'package:familiar_finance_app/domain/purchase/purchase.dart';
import 'package:familiar_finance_app/utils/result.dart';

abstract class InstallmentsRepository {
  Future<Result<List<Installments>>> getInstallmentsByPurchaseId(Purchase purchase);
}