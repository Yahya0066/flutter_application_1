import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/thems/app_colors.dart';
import 'package:flutter_application_1/features/login/view/login_view.dart';
import 'package:lottie/lottie.dart';

import '../../../core/thems/app_amgies.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {@override
  void initState() {
    super.initState();
    _goToLogin();}
    void _goToLogin(){
      Future.delayed(const Duration(seconds: 3)).then((_) {
// ignore: use_build_context_synchronously
Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> const LoginView(),));
    });
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
            child: Lottie.asset(
              AppAmgies.splashLogo  ,
              width: MediaQuery.of(context).size.width / 2.5,

            ),
          ),
        );
  }
}