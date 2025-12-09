import 'package:familiar_finance_app/data/repositories/auth/auth_repository.dart';
import 'package:familiar_finance_app/data/services/auth/auth_service.dart';
import 'package:familiar_finance_app/data/services/auth/auth_service_local.dart';
import 'package:familiar_finance_app/utils/result.dart';

class AuthLocalRepository extends AuthRepository{

  final AuthService _authService = AuthServiceLocal();

  @override
  Future<bool> get isAuthenticated => Future.value(true);

  @override
  Future<Result<void>> signIn(String email, String password) async{
    final result = await _authService.signIn(email, password);
    return result.when(
      ok: (_) => Result.ok(null),
      error: (e) => Result.error(e),
    );
  }

  @override
  Future<Result<void>> signOut() {
    return Future.value(Result.ok(null));
  }

  @override
  Future<Result<void>> signUp(String email, String password) async{
    final result = await _authService.signUp(email, password);
    return result.when(
      ok: (_) => Result.ok(null),
      error: (e) => Result.error(e),
    );
  }

}