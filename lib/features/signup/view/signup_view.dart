import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/thems/app_colors.dart';
import 'package:flutter_application_1/core/thems/app_padding.dart';
import 'package:flutter_application_1/core/weidghts/Loading/custom_loading_widget.dart';
import 'package:flutter_application_1/core/weidghts/buttons/custom_button.dart';
import 'package:flutter_application_1/core/weidghts/snakbar/custom_snakbar.dart';
import 'package:flutter_application_1/core/weidghts/textfields/custom_text_fields.dart';
import 'package:flutter_application_1/features/home/view/home_view.dart';
import 'package:flutter_application_1/features/signup/view_model/signup_cubit.dart';
import 'package:flutter_application_1/features/signup/view_model/signup_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(),
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: Padding(
          padding: AppPadding.allPadding,
          child: Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 1.2,
              child: Card(
                elevation: 5,
                color: Colors.white,
                child: Padding(
                  padding: AppPadding.allPadding,
                  child: SingleChildScrollView(
                    child: BlocListener<SignupCubit, SignUpStates>(
                      listener: (context, state) {
                        if (state is SignUpLoadingStates) {
                          CustomdialogLoadingWidget.show(context);
                        } else if (state is SignUpErrorStates) {
                          Navigator.pop(context);
                          CustomSnakbar.show(context, state.error);
                        } else if (state is SignUpSuccessStates) {
                          Navigator.pop(context);
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeView(
                                user: state.user,
                              ),
                            ),
                          );
                        }
                      },
                      child: Builder(builder: (context) {
                        return Form(
                          key: context.read<SignupCubit>().formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Welcome To Ystore',
                                style: GoogleFonts.lato(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                'discover the best products',
                                style: GoogleFonts.lato(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(height: 20),
                              CustomTextFields(
                                controller:
                                    context.read<SignupCubit>().emailController,
                                label: 'Email',
                                keyboardType: TextInputType.emailAddress,
                                validator: (email) {
                                  String pattern =
                                      r'^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
                                  RegExp regex = RegExp(pattern);
                                  if (email?.isEmpty ?? true) {
                                    return 'please enter your email';
                                  } else if (!regex.hasMatch(email!)) {
                                    return 'please enter a valid email';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 20),
                              CustomTextFields(
                                controller: context
                                    .read<SignupCubit>()
                                    .usernameController,
                                label: 'username',
                                keyboardType: TextInputType.text,
                                validator: (username) {
                                  if (username?.isEmpty ?? true) {
                                    return 'please enter your username';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 20),
                              CustomTextFields(
                                controller:
                                    context.read<SignupCubit>().phoneController,
                                label: 'phone number',
                                keyboardType: TextInputType.phone,
                                validator: (phone) {
                                  if (phone?.isEmpty ?? true) {
                                    return 'please enter your phone number';
                                  } else if (!((phone!.length) == 10)) {
                                    return 'please enter a valid phone number';
                                  }
                                  return null;
                                },
                                maxLength: 10,
                              ),
                              const SizedBox(height: 20),
                              CustomTextFields(
                                validator: (password) {
                                  if (password?.isEmpty ?? true) {
                                    return 'please enter your password';
                                  } else if ((password!.length) < 6) {
                                    return 'password must be at least 6 characters long';
                                  }
                                  return null;
                                },
                                controller: context
                                    .read<SignupCubit>()
                                    .passwordController,
                                label: 'password',
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: true,
                              ),
                              const SizedBox(height: 20),
                              CustomTextFields(
                                controller: context
                                    .read<SignupCubit>()
                                    .confirmPasswordController,
                                label: 'confirm password',
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: true,
                                validator: (confirmPassword) {
                                  if (confirmPassword?.isEmpty ?? true) {
                                    return 'please enter your confirm password';
                                  } else if (confirmPassword !=
                                      context
                                          .read<SignupCubit>()
                                          .passwordController
                                          .text) {
                                    return 'passwords do not match';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 20),
                              CustomButton(
                                text: 'Create Account',
                                buttonWidth: 200.0,
                                fontSize: 16.0,
                                onTap: () {
                                  context.read<SignupCubit>().createAccount();
                                },
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
