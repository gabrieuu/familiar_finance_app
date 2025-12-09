import 'package:familiar_finance_app/data/repositories/installments/installments_repository.dart';
import 'package:familiar_finance_app/data/services/installments/installments_local_service.dart';
import 'package:familiar_finance_app/data/services/installments/installments_service.dart';
import 'package:familiar_finance_app/domain/models/installments/installments.dart';
import 'package:familiar_finance_app/utils/result.dart';

class InstallmentsLocalRepository extends InstallmentsRepository {
  final InstallmentsService _installmentsService = InstallmentsLocalService();
  List<Installments> installments = [];
  @override
  Future<Result<List<Installments>>> getInstallmentsByPurchaseId(String purchaseId) async{
    final result = await _installmentsService.getInstallmentsByPurchaseId(purchaseId);
    return result.when(
      ok: (dtos) {
        final installmentsList = dtos.map((dto) => Installments(
          installmentId: dto.installmentId,
          purchaseId: dto.purchaseId,
          amount: dto.amount,
          installmentNumber: dto.installmentNumber,
          month: dto.month,
          status: dto.isPaid ? 'paid' : 'unpaid',
        )).toList();
        return Result.ok(installmentsList);
      },
      error: (error) => Result.error(error),);
  }
}