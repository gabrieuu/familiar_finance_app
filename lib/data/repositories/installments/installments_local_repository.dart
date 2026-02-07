import 'package:familiar_finance_app/data/repositories/installments/installments_repository.dart';
import 'package:familiar_finance_app/domain/installments/installments.dart';
import 'package:familiar_finance_app/domain/purchase/purchase.dart';
import 'package:familiar_finance_app/utils/result.dart';

class InstallmentsLocalRepository implements InstallmentsRepository{
  @override
  Future<Result<List<Installments>>> getInstallmentsByPurchaseId(Purchase purchase) async {
    return Result.ok([]);
  }
}