import 'package:familiar_finance_app/data/repositories/purchase/purchase_local_repository.dart';
import 'package:familiar_finance_app/data/repositories/purchase/purchase_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  setUp((){
    TestWidgetsFlutterBinding.ensureInitialized();
  });
  test('should return a list of purchase by Service', () async{
    PurchaseRepository purchaseRepository = PurchaseLocalRepository();
    final result = await purchaseRepository.getAllPurchaseByCreditCard("123");
    result.when(
      ok: (purchases) {
        expect(purchases, isA<List>());
      },
      error: (error) {
        fail('Expected a successful result, but got an error: $error');
      },
    );
  });
}