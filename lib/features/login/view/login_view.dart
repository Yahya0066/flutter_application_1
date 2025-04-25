import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/thems/app_amgies.dart';
//import 'package:flutter_application_1/core/themes/app_animations.dart';
//import 'package:flutter_application_1/core/themes/app_colors.dart';
//import 'package:flutter_application_1/core/themes/app_padding.dart';
import 'package:flutter_application_1/core/thems/app_colors.dart';
import 'package:flutter_application_1/core/thems/app_padding.dart';
import 'package:flutter_application_1/core/weidghts/Loading/custom_loading_widget.dart';
import 'package:flutter_application_1/core/weidghts/buttons/custom_button.dart';
import 'package:flutter_application_1/core/weidghts/snakbar/custom_snakbar.dart';
import 'package:flutter_application_1/core/weidghts/textfields/custom_text_fields.dart';
//import 'package:flutter_application_1/core/widgets/buttons/custom_button.dart';
//import 'package:flutter_application_1/core/widgets/textfields/custom_text_fields.dart';
import 'package:flutter_application_1/features/home/view/home_view.dart';
import 'package:flutter_application_1/features/login/view_model/states.dart';
import 'package:flutter_application_1/features/signup/view/signup_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import '../view_model/cubit.dart';
part 'widgets/Login_form.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 30),
                Lottie.asset(
                  AppAmgies.loginLogo,
                  width: MediaQuery.of(context).size.width / 4,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 20),
                Center(
                  child: Padding(
                    padding: AppPadding.horizontalPadding,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height / 1.5,
                      child: Card(
                        elevation: 5,
                        color: Colors.white,
                        child: Padding(
                          padding: AppPadding.allPadding,
                          child: BlocListener<LoginCubit, LoginStates>(
                            listener: (context, state) =>
                                handleLoginState(context, state),
                            child: _LoginFormwidgets(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void handleLoginState(BuildContext context, LoginStates state) {
    if (state is LoginSucessStates) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => HomeView(
            user: state.user,
          ),
        ),
      );
    } else if (state is LoginErorrStates) {
      Navigator.pop(context);
      CustomSnakbar.show(context, state.error);
    }
    if (state is LoginLoadStates) {
      CustomdialogLoadingWidget.show(context);
    } else if (state is LoginErorrStates) {
      Navigator.pop(context);
    }
  }
}
