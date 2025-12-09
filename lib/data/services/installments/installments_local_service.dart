import 'package:familiar_finance_app/data/services/installments/installments_service.dart';
import 'package:familiar_finance_app/data/services/installments/model/installment_dto.dart';
import 'package:familiar_finance_app/data/services/local_assets/json_assets.dart';
import 'package:familiar_finance_app/utils/result.dart';

class InstallmentsLocalService extends InstallmentsService {
  @override
  Future<Result<List<InstallmentDTO>>> getInstallmentsByPurchaseId(String purchaseId) async{
    final installmentsListMap = await JsonAssets.loadStringAssets(Assets.installments);
    try {
      final installments = installmentsListMap.map(InstallmentDTO.fromMap).toList().where((inst) => inst.purchaseId == purchaseId).toList();
      return Future.value(Result.ok(installments));
    }catch (e) {
      return Future.value(Result.error(e.toString()));
    }
  }
}