import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:familiar_finance_app/data/database/entity/creditcard_entity.dart';
import 'package:familiar_finance_app/data/database/entity/installment_entity.dart';
import 'package:familiar_finance_app/data/database/entity/purchase_entity.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [PurchaseEntity, CreditcardEntity, InstallmentEntity])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onUpgrade: (m, from, to) async {
        if (from < to) {
          await m.createAll();
        }
      },
    );
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
