import 'package:familiar_finance_app/utils/result.dart';

abstract class ModifiedDatabase {
  Future<Result<void>> markAsDeleted(String id);
  Future<Result<void>> markAsUpdated(String id);
}
