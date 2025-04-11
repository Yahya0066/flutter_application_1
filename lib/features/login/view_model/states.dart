abstract class LoginStates {}

class LoginIntialStates extends LoginStates{}

class LoginLoadStates extends LoginStates{}

class LoginErorrStates extends LoginStates{
  final String error;

  LoginErorrStates({required this.error});

}

class LoginSucessStates extends LoginStates{}
