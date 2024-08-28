import 'package:bictov/declarations/constants/colors.dart';
import 'package:bictov/declarations/constants/number_literals.dart';
import 'package:bictov/declarations/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    required this.hintText,
    required this.validator,
    required this.inputFormatters,
    this.keyboardInputType,
    this.prefixWidget,
    this.prefixIcon,
    this.initialValue,
    this.onSaved,
    this.controller,
    this.obscureText = false,
    this.suffixIcon,
    this.fillColor = Colors.white,
    this.borderColor,
    this.enabledBorderColor,
    this.focusedBorderColor,
    this.maxLines = 1,
    this.widget,
    this.onSubmit,
    this.onChanged,
    this.onTap,
    this.enable
  });
  final String hintText;
  final String? initialValue;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final List<TextInputFormatter> inputFormatters;
  final TextInputType? keyboardInputType;
  final Widget? prefixWidget;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Widget? widget;
  final bool obscureText;
  Color fillColor;
  Color? borderColor;
  Color? enabledBorderColor;
  Color? focusedBorderColor;
  final Function(String?)? onSaved;
  final void Function(String)? onSubmit;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  bool? enable;
  int maxLines;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlignVertical: TextAlignVertical.center,
      enabled: initialValue != null ? enable : true,
      enableSuggestions: true,
      onSaved: onSaved,
      onFieldSubmitted: onSubmit,
      onTap: onTap,
      controller: null,
      initialValue: initialValue,
      validator: validator,
      keyboardType: keyboardInputType,
      onChanged: onChanged,
      textAlign: TextAlign.end,
      textDirection: TextDirection.ltr,
      inputFormatters: inputFormatters,
      obscureText: obscureText,
      maxLines: maxLines,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide:
                  BorderSide(color: borderColor ?? BictovColors.kColor98C1D9)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: enabledBorderColor ?? BictovColors.kColor98C1D9)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: focusedBorderColor ?? BictovColors.kColor98C1D9)),
          hintText: hintText,
          hintTextDirection: TextDirection.ltr,
          filled: true,
          fillColor: fillColor,
          prefix: prefixWidget,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          icon: widget,
          hintStyle: TextStyle(
              fontSize: BictovNumberLiteralsConstants.nL12,
              fontFamily: BictovStringConstants.fontFamily,
              color: BictovColors.kColor9F9F9F)),
    );
  }
}
