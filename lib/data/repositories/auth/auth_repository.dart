import 'package:familiar_finance_app/domain/user/user.dart';
import 'package:familiar_finance_app/utils/result.dart';

abstract class AuthRepository{
 Future<bool> get isAuthenticated;
 Future<Result<User?>> getUser();
 Future<Result<void>> signIn(String email, String password);
 Future<Result<void>> signOut();
 Future<Result<void>> signUp(String email, String password);
}