import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/thems/app_colors.dart';

class CustomTextFields extends StatefulWidget {
  const CustomTextFields({super.key, required this.label, this.borderRadius, this.obscureText, this.prefixIcon, this.controller, this.validator, required TextInputType keyboardType, this.maxLength});
final String label;
final double? borderRadius;
final bool? obscureText;
final Widget? prefixIcon;
final  TextEditingController? controller;
final String? Function(String?)? validator;
final int? maxLength;

  @override
  State<CustomTextFields> createState() => _CustomTextFieldsState();
}
class _CustomTextFieldsState extends State<CustomTextFields> {
  bool obscureText = false;
  @override
  void initState() {
    super.initState();
    bool obscureText = widget.obscureText ?? false;}
    @override
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator:widget.validator,
      controller:widget.controller,
      inputFormatters: [],
      keyboardType: TextInputType.emailAddress,
     obscureText:obscureText ,
     maxLength: widget.maxLength, 
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon ?? const Icon(Icons.person),
        suffixIcon: widget.obscureText == true ? GestureDetector(onTap: () {
          obscureText=!obscureText;
          setState(() {});
        },
          child: Icon(
           obscureText ? Icons.visibility_off:Icons.remove_red_eye )) : null,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20,vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius?? 50),
          borderSide: BorderSide(color: AppColors.primary),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius?? 50),
          borderSide: BorderSide(color: const Color.fromARGB(156, 57, 76, 80)),
        ),
        label: Text(widget.label),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius?? 50),
          borderSide: BorderSide(color: const Color.fromARGB(255, 65, 114, 193)),
      ),
      )
      
      );
  }
}