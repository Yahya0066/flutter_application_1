import 'package:firebase_auth/firebase_auth.dart';

abstract class SignUpStates {}

class SignUpInitial extends SignUpStates {}

class SignUpLoadingStates extends SignUpStates {}

class SignUpErrorStates extends SignUpStates {
  final String error;

  SignUpErrorStates({required this.error});
}

class SignUpSuccessStates extends SignUpStates {
  final UserCredential credential;

  SignUpSuccessStates({required this.credential});

  get user => null;
}
