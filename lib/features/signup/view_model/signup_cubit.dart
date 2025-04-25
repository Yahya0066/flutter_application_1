import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/extintion/form_key_extintion.dart';
import 'package:flutter_application_1/features/signup/repo/signup_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'signup_states.dart';

class SignupCubit extends Cubit<SignUpStates> {
  SignupCubit() : super(SignUpInitial());
  final _signupRepo = SignupRepo();
  final formKey = GlobalKey<FormState>();
  //
  final usernameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  void createAccount() async {
    if (formKey.isValid()) {
      emit(SignUpLoadingStates());
      final result = await _signupRepo.createAccountRequest(
        email: emailController.text,
        password: passwordController.text,
        username: usernameController.text,
        phone: phoneController.text,
      );
      result.fold(
        (error) => emit(SignUpErrorStates(error: error)),
        (user) => emit(SignUpSuccessStates(credential: user)),
      );
    }
  }

  @override
  Future<void> close() {
    usernameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    return super.close();
  }

  void creatAcouunt() {}
}
