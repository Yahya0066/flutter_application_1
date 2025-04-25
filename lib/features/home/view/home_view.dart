import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/login/model/login_response_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
    required this.user,
  });
  final LoginResponseModel user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          Text('username: ${user.username}'),
          Text('password: ${user.password}'),
          Text('phone: ${user.phone}'),
          Text('email: ${user.email}'),
          Text('uid: ${user.uid}')
        ],
      )),
    );
  }
}
