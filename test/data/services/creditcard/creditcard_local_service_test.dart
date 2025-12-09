import 'package:familiar_finance_app/data/services/creditcard/creditcard_local_service.dart';
import 'package:familiar_finance_app/data/services/creditcard/creditcard_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  test('should finder in assets a json', (){
    CreditcardService creditcardService = CreditcardLocalService();
    final result = creditcardService.getCreditcardsByUserId('u1');
    result.then((res){
      res.when(
        ok: (creditcards){
          expect(creditcards.isNotEmpty, true);
        },
        error: (e){
          fail('Should not return error');
        }
      );
    });
  });
}