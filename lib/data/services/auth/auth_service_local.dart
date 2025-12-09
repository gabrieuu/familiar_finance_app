import 'package:familiar_finance_app/data/services/auth/auth_service.dart';
import 'package:familiar_finance_app/domain/models/user/user.dart';
import 'package:familiar_finance_app/utils/result.dart';

class AuthServiceLocal extends AuthService{
  @override
  Future<Result<User?>> signIn(String email, String password) {
   try {
     final user = User.fromJson(mockUser);
     return Future.value(Result.ok(user));
   } catch (e) {
     return Future.value(Result.error(e.toString()));
   }
  }

  @override
  Future<Result<void>> signOut() {
   return Future.value(Result.ok(null));
  }

  @override
  Future<Result<User?>> signUp(String email, String password) {
   try {
     final user = User.fromJson(mockUser);
     return Future.value(Result.ok(user));
   } catch (e) {
     return Future.value(Result.error(e.toString()));
   }
  }
}

Map<String, dynamic>mockUser = {
  'id': '1',
  'email': 'example@example.com',
  'name': 'Example User',
};