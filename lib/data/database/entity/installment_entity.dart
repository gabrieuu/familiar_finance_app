import 'package:drift/drift.dart';
import 'package:familiar_finance_app/data/database/entity/mixin/updated_mixin.dart';
import 'package:familiar_finance_app/data/database/entity/purchase_entity.dart';

class InstallmentEntity extends Table with ModifiedMixin {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get idDomain => text().unique()();
  IntColumn get purchaseId => integer().references(PurchaseEntity, #id)();
  TextColumn get purchaseIdDomain => text().unique()();
  RealColumn get amount => real()();
  DateTimeColumn get dueDate => dateTime()();
}
