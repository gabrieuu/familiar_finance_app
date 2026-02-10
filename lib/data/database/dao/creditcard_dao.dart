import 'package:drift/drift.dart';
import 'package:familiar_finance_app/data/database/app_database.dart';
import 'package:familiar_finance_app/data/database/entity/creditcard_entity.dart';
import 'package:familiar_finance_app/data/database/interface/creditcard_db.dart';
import 'package:familiar_finance_app/data/database/mapper/creditcard_db_mapper.dart';
import 'package:familiar_finance_app/domain/credit_card/credit_card.dart';
import 'package:familiar_finance_app/utils/result.dart';

part 'creditcard_dao.g.dart';

@DriftAccessor(tables: [CreditcardEntity])
class CreditCardDao extends DatabaseAccessor<AppDatabase>
    with _$CreditCardDaoMixin
    implements CreditCardDb {
  CreditCardDao(super.attachedDatabase);

  Future<CreditcardEntityData> _getCreditCardById(String id) async {
    final creditCard = await (select(
      creditcardEntity,
    )..where((tbl) => tbl.idDomain.equals(id))).getSingle();
    return creditCard;
  }

  @override
  Future<Result<void>> addCreditCard(
    CreditCard creditCard, {
    bool isLocal = false,
  }) async {
    try {
      await into(
        creditcardEntity,
      ).insert(CreditcardDbMapper.toCompanion(creditCard, needToSync: isLocal));
      return Result.ok(null);
    } catch (e) {
      return Result.failure('Erro ao adicionar cartão de crédito: $e');
    }
  }

  @override
  Future<Result<void>> deleteCreditCard(String creditCardId) async {
    try {
      final creditCard = await _getCreditCardById(creditCardId);
      await delete(creditcardEntity).delete(creditCard);
      return Result.ok(null);
    } catch (e) {
      return Result.failure('Erro ao deletar cartão de crédito: $e');
    }
  }

  @override
  Future<Result<List<CreditCard>>> getCreditCards() async {
    try {
      final creditCards = await (select(creditcardEntity).get());
      return Result.ok(
        creditCards.map((e) => CreditcardDbMapper.toDomain(e)).toList(),
      );
    } catch (e) {
      return Result.failure('Erro ao buscar cartões de crédito: $e');
    }
  }

  @override
  Future<Result<void>> updateCreditCard(
    CreditCard creditCard, {
    bool isLocal = false,
  }) async {
    try {
      final creditCardEntityData = await _getCreditCardById(creditCard.id);
      await update(creditcardEntity).replace(
        CreditcardDbMapper.toCompanion(
          creditCard,
          id: creditCardEntityData.id,
          needToSync: isLocal,
        ),
      );
      return Result.ok(null);
    } catch (e) {
      return Result.failure('Erro ao atualizar cartão de crédito: $e');
    }
  }

  @override
  Future<Result<void>> markAsDeleted(String id) async {
    try {
      await (update(
        creditcardEntity,
      )..where((tb) => tb.idDomain.equals(id))).write(
        CreditcardEntityCompanion(
          deletedAt: Value(DateTime.now()),
          needToSync: Value(true),
        ),
      );
      return Result.ok(null);
    } catch (e) {
      return Result.failure(
        'Erro ao marcar cartão de crédito como deletado: $e',
      );
    }
  }

  @override
  Future<Result<void>> markAsUpdated(String id) async {
    try {
      await (update(
        creditcardEntity,
      )..where((tb) => tb.idDomain.equals(id))).write(
        CreditcardEntityCompanion(
          updatedAt: Value(DateTime.now()),
          needToSync: Value(true),
        ),
      );
      return Result.ok(null);
    } catch (e) {
      return Result.failure(
        'Erro ao marcar cartão de crédito como atualizado: $e',
      );
    }
  }

  @override
  Future<Result<List<CreditCard>>> getPendingSyncCreditCards() async {
    try {
      final creditCards = await (select(
        creditcardEntity,
      )..where((tb) => tb.needToSync.equals(true))).get();
      return Result.ok(
        creditCards.map((e) => CreditcardDbMapper.toDomain(e)).toList(),
      );
    } catch (e) {
      return Result.failure('Erro ao buscar cartões de crédito: $e');
    }
  }
}
