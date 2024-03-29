import 'package:flutter/material.dart';

import '../../config/colors.dart';

class QtecTextField extends StatelessWidget {
  const QtecTextField(
      {Key? key,
      this.hint,
      this.controller,
      this.onChanged,
      this.maxLines,
      this.textInputType,
      this.obscureText,
      this.onFieldSubmitted,
      this.validator,
      this.suffixIcon,
      this.color,
      this.onFinished,
      this.horizontalPadding,
      this.verticalPadding,
      this.fillColor})
      : super(key: key);

  final String? hint;

  // final String? label;
  final int? maxLines;
  final ValueChanged? onChanged;
  final ValueChanged? onFinished;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final String? Function(String?)? validator;
  final String? Function(String)? onFieldSubmitted;
  final bool? obscureText;
  final Widget? suffixIcon;
  final Color? color;
  final Color? fillColor;

  final double? horizontalPadding;
  final double? verticalPadding;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      obscureText: obscureText ?? false,
      controller: controller,
      onFieldSubmitted: onFieldSubmitted,
      textInputAction: TextInputAction.next,
      keyboardType: textInputType ?? TextInputType.emailAddress,
      decoration: formInputDecoration(
          suffixIcon: suffixIcon,
          color: color,
          horizontal: horizontalPadding,
          vertical: verticalPadding,
          hintText: hint!,
          fillColor: fillColor),
      onChanged: onChanged,
      style: const TextStyle(fontSize: 14),
      validator: validator,
      onSaved: onFinished,
    );
  }
}

class DokanHishabeeCustomDisabledTextFormField extends StatelessWidget {
  const DokanHishabeeCustomDisabledTextFormField(
      {Key? key,
      this.hint,
      this.maxLines,
      this.onChanged,
      this.onFinished,
      this.controller,
      this.textInputType,
      this.validator,
      this.obscureText,
      this.suffixIcon,
      this.color,
      this.horizontalPadding,
      this.verticalPadding,
      required this.enabled})
      : super(key: key);

  final String? hint;
  final bool enabled;

  // final String? label;
  final int? maxLines;
  final ValueChanged? onChanged;
  final ValueChanged? onFinished;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final String? Function(String?)? validator;
  final bool? obscureText;
  final Widget? suffixIcon;
  final Color? color;
  final double? horizontalPadding;
  final double? verticalPadding;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      maxLines: maxLines,
      obscureText: obscureText!,
      controller: controller,
      textInputAction: TextInputAction.next,
      keyboardType: textInputType ?? TextInputType.emailAddress,
      decoration: formInputDecoration(
          suffixIcon: suffixIcon,
          color: color,
          horizontal: horizontalPadding,
          vertical: verticalPadding,
          hintText: hint!),
      onChanged: onChanged,
      style: const TextStyle(fontSize: 14),
      validator: validator,
      onSaved: onFinished,
    );
  }
}

formInputDecoration(
    {required String hintText,
    Widget? suffixIcon,
    Color? color,
    Color? fillColor,
    double? horizontal,
    double? vertical}) {
  return InputDecoration(
    labelStyle: const TextStyle(
      fontSize: 16,
      color: Color.fromARGB(255, 0, 0, 0),
    ),
    fillColor: fillColor ?? ColorManager.scaffoldBackGroundColor,
    filled: true,
    contentPadding: EdgeInsets.symmetric(
        horizontal: horizontal ?? 10, vertical: vertical ?? 10),
    // labelText: labelText.tr,
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(15.0),
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: color ?? const Color(0xffF1F1F1), width: 0),
      borderRadius: const BorderRadius.all(
        Radius.circular(15.0),
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: color ?? Colors.black12, width: 2),
      borderRadius: const BorderRadius.all(
        Radius.circular(15.0),
      ),
    ),
    hintText: hintText,
    hintStyle: const TextStyle(
      color: ColorManager.grey,
      fontSize: 16,
    ),
    suffixIcon: suffixIcon,
  );
}
