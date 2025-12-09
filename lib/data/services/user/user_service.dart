import 'package:familiar_finance_app/domain/models/user/user.dart';
import 'package:familiar_finance_app/utils/result.dart';

abstract class UserService {
  Future<Result<User>> getUser();
}