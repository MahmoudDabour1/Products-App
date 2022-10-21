import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextForm extends StatefulWidget {
  final String label;
  final bool isLastInput, isPassword;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final validator;
  final  prefixIcon;

  const TextForm({
    Key? key,
    required this.label,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.isLastInput = false,
    this.isPassword = false, this.validator, this.prefixIcon,
  }) : super(key: key);

  @override
  State<TextForm> createState() => _TextFormState();
}

class _TextFormState extends State<TextForm> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 30.h),
      child: TextFormField(
        validator: widget.validator,
        obscureText: widget.isPassword && isHidden,
        obscuringCharacter: "*",
        textInputAction:
            widget.isLastInput ? TextInputAction.done : TextInputAction.next,
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        decoration: InputDecoration(
          fillColor: Colors.grey.shade200,
          filled: true,
          prefixIcon: widget.prefixIcon ,
          suffixIcon: widget.isPassword?GestureDetector(onTap: (){
            isHidden = !isHidden;
            setState((){});
          },
              child: Icon(isHidden?Icons.visibility_off: Icons.visibility),):null,
            contentPadding: EdgeInsets.symmetric(horizontal: 16.h),
            labelText: widget.label,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
            )),
      ),
    );
  }
}
