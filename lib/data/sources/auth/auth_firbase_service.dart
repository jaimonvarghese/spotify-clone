import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify/data/models/auth/create_user_req.dart';
import 'package:spotify/domain/usecases/auth/signup.dart';

import '../../models/auth/signin_user_req.dart';

abstract class AuthFirbaseService {
  Future<Either> signup(CreateUserReq createUserReq);
  Future<Either> signin(SigninUserReq signinUserReq);
}

class AuthFirbaseServiceImp extends AuthFirbaseService {
  @override
  Future<Either> signin(SigninUserReq signinUserReq) async{
   try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: signinUserReq.email,
        password: signinUserReq.password,
      );
      return const Right("SignIn was Successfull");
    } on FirebaseAuthException catch (e) {
      String messsage = "";
      if (e.code == "invalid-email") {
        messsage = 'Not User found for that email';
      } else if (e.code == "invalid-credential") {
        messsage = 'Wrong password provided for that user.';
      }
      return left(messsage);
    }
  }

  @override
  Future<Either> signup(CreateUserReq createUserReq) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: createUserReq.email,
        password: createUserReq.password,
      );
      return Right("Signup was Successfull");
    } on FirebaseAuthException catch (e) {
      String messsage = "";
      if (e.code == "weak-password") {
        messsage = 'The password provided is too weak';
      } else if (e.code == "email-already-in-use") {
        messsage = 'An Account alreadt exists with email.';
      }
      return left(messsage);
    }
  }
}
