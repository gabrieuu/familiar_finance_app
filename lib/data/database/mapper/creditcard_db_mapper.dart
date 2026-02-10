import 'package:drift/drift.dart';
import 'package:familiar_finance_app/data/database/app_database.dart';
import 'package:familiar_finance_app/domain/credit_card/credit_card.dart';

class CreditcardDbMapper {
  static CreditcardEntityCompanion toCompanion(
    CreditCard creditCard, {
    int? id,
    bool needToSync = false,
  }) {
    return CreditcardEntityCompanion(
      id: id != null ? Value(id) : const Value.absent(),
      idDomain: Value(creditCard.id),
      name: Value(creditCard.nomeCartao),
      closingDay: Value(creditCard.diaFechamento),
      dueDay: Value(creditCard.diaVencimento),
      needToSync: Value(needToSync),
    );
  }

  static CreditCard toDomain(CreditcardEntityData creditCard) {
    return CreditCard(
      id: creditCard.idDomain,
      nomeCartao: creditCard.name,
      diaFechamento: creditCard.closingDay,
      diaVencimento: creditCard.dueDay,
    );
  }
}
