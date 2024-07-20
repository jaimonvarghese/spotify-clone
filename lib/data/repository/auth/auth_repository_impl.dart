import 'package:dartz/dartz.dart';
import 'package:spotify/data/sources/auth/auth_firbase_service.dart';
import 'package:spotify/domain/repository/auth/auth.dart';

import '../../../service_locator.dart';
import '../../models/auth/create_user_req.dart';
import '../../models/auth/signin_user_req.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signin(SigninUserReq signinUserReq) async {
    return await sl<AuthFirbaseService>().signin(signinUserReq);
  }

  @override
  Future<Either> signup(CreateUserReq createUserReq) async {
    return await sl<AuthFirbaseService>().signup(createUserReq);
  }
}
