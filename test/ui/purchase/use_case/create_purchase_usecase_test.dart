import 'package:familiar_finance_app/data/repositories/creditcard/creditcard_repository.dart';
import 'package:familiar_finance_app/data/repositories/purchase/purchase_repository.dart';
import 'package:familiar_finance_app/domain/credit_card/credit_card.dart';
import 'package:familiar_finance_app/domain/purchase/purchase.dart';
import 'package:familiar_finance_app/ui/purchase/use_case/create_purchase_usecase.dart';
import 'package:familiar_finance_app/utils/result.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class PurchaseRepositoryMock extends Mock implements PurchaseRepository {}
class CreditCardRepositoryMock extends Mock implements CreditCardRepository {}
void main() {
  final _purchaseRepository = PurchaseRepositoryMock();
  final _creditCardRepository = CreditCardRepositoryMock();

  setUpAll(() {
    registerFallbackValue(
      purchaseMock
    );
  });

  test("deve criar as parcelas corretamente caso o dia de compra seja antes do dia de fechamento da fatura", () async{
    final cartaoMock = CreditCard(id: '1', nomeCartao: 'Cartão de Teste', diaFechamento: 5, diaVencimento: 10);

    when(() => _creditCardRepository.getCreditCardById('1')).thenAnswer((_) => Future.value(Result.ok(
      cartaoMock
    )));

    when(() => _purchaseRepository.registerPurchase(any())).thenAnswer((_) => Future.value(Result.ok(null)));
    final usecase = CreatePurchaseUsecase(_purchaseRepository, _creditCardRepository);

    await usecase.execute(purchaseMock);

    final captured = verify(
      () => _purchaseRepository.registerPurchase(captureAny()),
    ).captured.single as Purchase;


    expect(captured.installments.length, 5);
    expect(captured.installments[0].dueDate, DateTime(2026, 2, 4));
    expect(captured.installments[1].dueDate, DateTime(2026, 3, 4));
    expect(captured.installments[2].dueDate, DateTime(2026, 4, 4));
    expect(captured.installments[3].dueDate, DateTime(2026, 5, 4));
    expect(captured.installments[4].dueDate, DateTime(2026, 6, 4));
});

}

Purchase purchaseMock = Purchase(
  id: '1',
  title: 'Compra de Teste',
  type: TypePurchase.parcel,
  amount: 1000,
  creditCardId: '1',
  createdAt: DateTime(2026, 2, 4),
  numberOfInstallments: 5
);