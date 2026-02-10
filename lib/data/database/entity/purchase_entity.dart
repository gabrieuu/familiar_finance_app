import 'package:drift/drift.dart';
import 'package:familiar_finance_app/data/database/entity/creditcard_entity.dart';
import 'package:familiar_finance_app/data/database/entity/mixin/updated_mixin.dart';

class PurchaseEntity extends Table with ModifiedMixin {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get idDomain => text().unique()();
  IntColumn get creditCardId => integer().references(CreditcardEntity, #id)();
  TextColumn get creditCardIdDomain => text().unique()();
  TextColumn get title => text()();
  TextColumn get type => text()();
  IntColumn get numberOfInstallments => integer()();
  RealColumn get amount => real()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get finalizedAt => dateTime().nullable()();
}
