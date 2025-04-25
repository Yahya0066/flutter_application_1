import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/extintion/form_key_extintion.dart';
import 'package:flutter_application_1/features/login/repo/login_repo.dart';
import 'package:flutter_application_1/features/login/view_model/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates> {
  final _loginRepo = LoginRepo();
  LoginCubit() : super(LoginIntialStates());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  Future<void> login() async {
    if (formkey.isValid()) {
      emit(LoginLoadStates());
      final result = await _loginRepo.loginRequest(
          email: emailController.text, password: passwordController.text);
      result.fold(
          (error) => emit(LoginErorrStates(error: error)),
          (userCredential) => emit(LoginSucessStates(
              user: userCredential.user, loginResponseModel: userCredential)));
    }
  }
}
