import 'package:familiar_finance_app/data/repositories/auth/auth_repository.dart';
import 'package:familiar_finance_app/domain/user/user.dart';
import 'package:familiar_finance_app/utils/result.dart';

class AuthLocalRepository implements AuthRepository{
  @override
  Future<bool> get isAuthenticated async => true;

  @override
  Future<Result<void>> signIn(String email, String password) async{
   return Result.ok(null);
  }

  @override
  Future<Result<void>> signOut() async{
   return Result.ok(null);
  }

  @override
  Future<Result<void>> signUp(String email, String password) async{
    return Result.ok(null);
  }

  @override
  Future<Result<User?>> getUser() async{
    return Result.ok(User(id: 1, email: 'user@example.com', name: 'User'));
  }

}