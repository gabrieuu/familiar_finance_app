import 'package:drift/drift.dart';
import 'package:familiar_finance_app/data/database/entity/mixin/updated_mixin.dart';

class CreditcardEntity extends Table with ModifiedMixin {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get idDomain => text().unique()();
  TextColumn get name => text()();
  IntColumn get closingDay => integer()();
  IntColumn get dueDay => integer()();
}
