import 'package:drift/drift.dart';
import 'package:familiar_finance_app/data/database/app_database.dart';
import 'package:familiar_finance_app/data/database/entity/installment_entity.dart';
import 'package:familiar_finance_app/data/database/entity/purchase_entity.dart';
import 'package:familiar_finance_app/data/database/interface/installment_db.dart';
import 'package:familiar_finance_app/data/database/mapper/installment_db_mapper.dart';
import 'package:familiar_finance_app/domain/installments/installments.dart';
import 'package:familiar_finance_app/utils/result.dart';

part 'installment_dao.g.dart';

@DriftAccessor(tables: [InstallmentEntity, PurchaseEntity])
class InstallmentDao extends DatabaseAccessor<AppDatabase>
    with _$InstallmentDaoMixin
    implements InstallmentDb {
  InstallmentDao(super.attachedDatabase);

  @override
  Future<Result<List<Installments>>> getInstallmentsByPurchasesIds(
    List<String> purchaseIds,
  ) async {
    try {
      final installments = await (select(
        installmentEntity,
      )..where((tbl) => tbl.purchaseIdDomain.isIn(purchaseIds))).get();
      return Result.ok(
        installments.map((e) => InstallmentDbMapper.toDomain(e)).toList(),
      );
    } catch (e) {
      return Result.failure('Erro ao buscar parcelas: $e');
    }
  }

  @override
  Future<Result<void>> registerInstallment(
    String purchaseId,
    List<Installments> installments, {
    bool isLocal = false,
  }) async {
    try {
      final purchase = await (select(
        purchaseEntity,
      )..where((tbl) => tbl.idDomain.equals(purchaseId))).getSingle();
      await batch((batch) {
        batch.insertAll(
          installmentEntity,
          installments.map(
            (e) => InstallmentDbMapper.toCompanion(
              e,
              purchase.id,
              needToSync: isLocal,
            ),
          ),
        );
      });
      return Result.ok(null);
    } catch (e) {
      return Result.failure('Erro ao registrar parcelas: $e');
    }
  }

  @override
  Future<Result<void>> markAsDeleted(String id) async {
    try {
      await (update(
        installmentEntity,
      )..where((tb) => tb.idDomain.equals(id))).write(
        InstallmentEntityCompanion(
          deletedAt: Value(DateTime.now()),
          needToSync: Value(true),
        ),
      );
      return Result.ok(null);
    } catch (e) {
      return Result.failure('Erro ao marcar parcela como deletada: $e');
    }
  }

  @override
  Future<Result<void>> markAsUpdated(String id) async {
    try {
      await (update(
        installmentEntity,
      )..where((tb) => tb.idDomain.equals(id))).write(
        InstallmentEntityCompanion(
          updatedAt: Value(DateTime.now()),
          needToSync: Value(true),
        ),
      );
      return Result.ok(null);
    } catch (e) {
      return Result.failure('Erro ao marcar parcela como atualizada: $e');
    }
  }

  @override
  Future<Result<List<Installments>>> getPendingSyncInstallments() async {
    try {
      final installments = await (select(
        installmentEntity,
      )..where((tb) => tb.needToSync.equals(true))).get();
      return Result.ok(
        installments.map((e) => InstallmentDbMapper.toDomain(e)).toList(),
      );
    } catch (e) {
      return Result.failure('Erro ao buscar parcelas: $e');
    }
  }
}
