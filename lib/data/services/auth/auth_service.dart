import 'package:familiar_finance_app/domain/models/user/user.dart';
import 'package:familiar_finance_app/utils/result.dart';

abstract class AuthService {
  Future<Result<User?>> signIn(String email, String password);
  Future<Result<void>> signOut();
  Future<Result<User?>> signUp(String email, String password);
}