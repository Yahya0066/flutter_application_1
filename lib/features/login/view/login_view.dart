import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/thems/app_amgies.dart';
//import 'package:flutter_application_1/core/themes/app_animations.dart';
//import 'package:flutter_application_1/core/themes/app_colors.dart';
//import 'package:flutter_application_1/core/themes/app_padding.dart';
import 'package:flutter_application_1/core/thems/app_colors.dart';
import 'package:flutter_application_1/core/thems/app_padding.dart';
import 'package:flutter_application_1/core/weidghts/buttons/custom_button.dart';
import 'package:flutter_application_1/core/weidghts/textfields/custom_text_fields.dart';
//import 'package:flutter_application_1/core/widgets/buttons/custom_button.dart';
//import 'package:flutter_application_1/core/widgets/textfields/custom_text_fields.dart';
import 'package:flutter_application_1/features/home/view/home_view.dart';
import 'package:flutter_application_1/features/login/view_model/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import '../view_model/cubit.dart';

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
                          child: BlocConsumer<LoginCubit, LoginStates>(
                            listener: (context, state) {
                              if (state is LoginSucessStates) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (_) => const HomeView()),
                                );
                              } else if (state is LoginErorrStates) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(state.error)),
                                );
                              }
                            },
                            builder: (context, state) {
                              if (state is LoginLoadStates) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              return Form(
                                key:context.read<LoginCubit>().formkey,
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 20),
                                      Text(
                                        'Login',
                                        style: GoogleFonts.lato(
                                          fontSize: 40,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      CustomTextFields(
                                        validator: (email) {
                                          if (email?.isEmpty ?? true) {
                                            return 'Please enter your Email';
                                          }
                                          if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                              .hasMatch(email!)) {
                                            return 'Please enter a valid email';
                                          }
                                          return null;
                                        },
                                        controller: context.read<LoginCubit>().emailController,
                                        prefixIcon: const Icon(Icons.email),
                                        label: 'Email',
                                        keyboardType: TextInputType.emailAddress,
                                      ),
                                      const SizedBox(height: 10),
                                      CustomTextFields(
                                        validator: (password) {
                                          if (password?.isEmpty ?? true) {
                                            return 'Please enter your Password';
                                          }
                                          if (password!.length < 6) {
                                            return 'Password must be at least 6 characters';
                                          }
                                          return null;
                                        },
                                        controller: context.read<LoginCubit>().passwordController,
                                        prefixIcon: const Icon(Icons.key),
                                        obscureText: true,
                                        label: 'Password',
                                        keyboardType: TextInputType.visiblePassword,
                                      ),
                                      const SizedBox(height: 5),
                                      GestureDetector(
                                        onTap: () {},
                                        child: Text(
                                          'Forgot password?',
                                          style: TextStyle(
                                            color: Colors.black,
                                            decoration: TextDecoration.underline,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 30),
                                      Align(
                                        alignment: Alignment.center,
                                        child: CustomButton(
                                          text: 'Login',
                                          fontSize: 16.0,
                                          onTap: () {
                                            context.read<LoginCubit>().login();
                                          },
                                          buttonWidth: 200,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
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
}