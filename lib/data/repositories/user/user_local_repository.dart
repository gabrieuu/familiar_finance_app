import 'package:familiar_finance_app/data/repositories/user/user_repository.dart';
import 'package:familiar_finance_app/data/services/user/user_local_service.dart';
import 'package:familiar_finance_app/data/services/user/user_service.dart';
import 'package:familiar_finance_app/domain/models/user/user.dart';
import 'package:familiar_finance_app/utils/result.dart';

class UserLocalRepository extends UserRepository{
  
  final UserService _userService = UserLocalService();

  @override
  Future<Result<User>> getUser() async{
   return await _userService.getUser();
  }

}