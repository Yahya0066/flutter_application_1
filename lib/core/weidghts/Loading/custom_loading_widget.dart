import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/thems/app_colors.dart';

class CustomdialogLoadingWidget extends StatelessWidget {
  const CustomdialogLoadingWidget({super.key});

  static void show(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => const CustomdialogLoadingWidget());
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            color: AppColors.primary,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Loading...',
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
