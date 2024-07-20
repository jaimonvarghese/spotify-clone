import 'package:dartz/dartz.dart';
import 'package:spotify/data/models/auth/signin_user_req.dart';

import '../../../core/usecases/usecases.dart';
import '../../../service_locator.dart';
import '../../repository/auth/auth.dart';

class SigninUseCase implements Usecases<Either, SigninUserReq> {
  @override
  Future<Either> call({SigninUserReq? params}) async{
    return sl<AuthRepository>().signin(params!);
  }
}