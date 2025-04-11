
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/login/view_model/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit <LoginStates> {
  LoginCubit() : super(LoginIntialStates());
  final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final TextEditingController phoneController = TextEditingController();
final formkey = GlobalKey<FormState>();

Future<void> login () async {
  if (formkey.currentState?.validate () ?? false ) {
    emit(LoginLoadStates());{
try {
 final result = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: emailController.text,
    password: passwordController.text,);
    log('${result.user?.email}');
    log('${result.user?.uid}');
    log('${result.user?.phoneNumber}');
    emit(LoginSucessStates());
} on FirebaseAuthException catch (e){
   emit(LoginErorrStates(error: e.message?? ''));
   }
}
  }
}
}