import 'package:familiar_finance_app/data/services/user/user_service.dart';
import 'package:familiar_finance_app/domain/models/user/user.dart';
import 'package:familiar_finance_app/utils/result.dart';

class UserLocalService extends UserService{
  @override
  Future<Result<User>> getUser() async{  
    return Result.ok(User(id: 'u1', name: 'Local User', email: 'localuser@example.com'));
  }
}