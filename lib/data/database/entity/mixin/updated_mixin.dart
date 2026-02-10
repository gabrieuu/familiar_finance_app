import 'package:drift/drift.dart';

mixin ModifiedMixin on Table {
  DateTimeColumn get updatedAt => dateTime().nullable()();
  DateTimeColumn get deletedAt => dateTime().nullable()();
  BoolColumn get needToSync => boolean().nullable()();
}
