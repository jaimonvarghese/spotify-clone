import 'package:dartz/dartz.dart';
import 'package:spotify/core/usecases/usecases.dart';
import 'package:spotify/data/models/auth/create_user_req.dart';
import 'package:spotify/domain/repository/auth/auth.dart';

import '../../../service_locator.dart';

class SignupUseCase implements Usecases<Either, CreateUserReq> {
  @override
  Future<Either> call({CreateUserReq? params}) async{
    return sl<AuthRepository>().signup(params!);
  }
}
