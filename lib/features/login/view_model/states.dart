import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/features/login/model/login_response_model.dart';

abstract class LoginStates {}

class LoginIntialStates extends LoginStates {}

class LoginLoadStates extends LoginStates {}

class LoginErorrStates extends LoginStates {
  final String error;
  LoginErorrStates({required this.error});
}

class LoginSucessStates extends LoginStates {
  final LoginResponseModel loginResponseModel;
  // ignore: prefer_typing_uninitialized_variables
  var user;
  LoginSucessStates(
      {required this.loginResponseModel, required UserCredential user});
}
