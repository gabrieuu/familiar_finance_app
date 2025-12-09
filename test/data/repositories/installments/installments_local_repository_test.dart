import 'package:familiar_finance_app/data/services/installments/installments_local_service.dart';
import 'package:familiar_finance_app/data/services/installments/installments_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp((){
    TestWidgetsFlutterBinding.ensureInitialized();
  });
  test('should test assets file return installments', (){
    InstallmentsService installmentsService = InstallmentsLocalService();
    installmentsService.getInstallmentsByPurchaseId('p2').then((result) {
      result.when(
        ok: (installments){
          expect(installments.length, 2);
          expect(installments[0].installmentId, 'i1');
          expect(installments[1].installmentId, 'i2');
        },
        error: (error){
          fail('Should not return error: $error');
        }
      );
    });
  });
}