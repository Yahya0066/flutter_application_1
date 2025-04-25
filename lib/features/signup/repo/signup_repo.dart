import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/features/login/model/login_response_model.dart';
import 'package:flutter_application_1/features/signup/model/signup_request_model.dart';

class SignupRepo {
  Future<Either<String, LoginResponseModel>> creataccountrequest(
      {required String email,
      required String password,
      required String username,
      required String phone}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final userData = await getUserData(credential.user?.uid ?? '');
      final signupData = SignRequestModel(
        email: email,
        name: username,
        phone: phone,
        uid: FirebaseAuth.instance.currentUser?.uid ?? '',
      );
      await _saveUserDataInDatabase(signupData,
          signupData: SignRequestModel(
            email: email,
            name: username,
            phone: phone,
            uid: FirebaseAuth.instance.currentUser?.uid ?? '',
          ));
      return Right(userData);
    } on FirebaseAuthException catch (e) {
      String errorMessage = e.message ?? 'An error occurred';
      if (e.code == 'weak-password') {
      } else if (e.code == 'email-already-in-use') {
        errorMessage = 'The account already exists for that email.';
      }
      return Left(errorMessage);
    }
  }

  Future<void> _saveUserDataInDatabase(SignRequestModel signupdata,
      {required SignRequestModel signupData}) async {
    // Corrected parameter type
    await FirebaseFirestore.instance
        .collection('users')
        .doc(signupdata.uid)
        .set({
          'email': signupdata.email,
          'name': signupdata.name,
          'phone': signupdata.phone,
          'uid': signupdata.uid,
        })
        .then((value) => log("User Added"))
        .catchError((error) => log("Failed to add user: $error"));
  }

  Future<LoginResponseModel> getUserData(String uid) async {
    // ignore: non_constant_identifier_names
    final Snapshot =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    final userdata = Snapshot.data();
    LoginResponseModel loginResponseModel = LoginResponseModel(
      email: userdata?['email'] ?? '',
      name: userdata?['name'] ?? '',
      phone: userdata?['phone'] ?? '',
      uid: userdata?['uid'] ?? '',
      username: '',
      token: '',
    );
    return loginResponseModel;
  }

  createAccountRequest(
      {required String email,
      required String password,
      required String username,
      required String phone}) {}
}
