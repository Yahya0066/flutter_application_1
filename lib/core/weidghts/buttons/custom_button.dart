import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/thems/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({required double buttonWidth,super.key, this.height, this.color, this.borderRadius, this.width, required this.text, required this.fontSize, this.fontWeight, this.textColor, required this.onTap});
  final double? height;
  final double? width;
 final Color? color;
 final double? borderRadius;
 final String text;
 final double fontSize;
 final FontWeight? fontWeight;
 final Color? textColor;
 final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
       borderRadius: BorderRadius.circular(borderRadius??50),
      onTap: onTap,
      child: Material(
        child: Container(
          width: width?? double.infinity,
          height: height ?? 55,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(borderRadius??50),
          ),
          child: Center(
            child: Text(
              text,
              style: GoogleFonts.poppins(
                fontSize: fontSize,
                fontWeight:fontWeight?? FontWeight.w600,
                color:textColor?? Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}