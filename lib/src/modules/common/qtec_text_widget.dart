import 'package:flutter/material.dart';

import '../../config/colors.dart';

class QtecTextWidget extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final TextDecoration? textDecoration;
  const QtecTextWidget(
      {Key? key,
      required this.text,
      this.color,
      this.fontSize,
      this.fontWeight,
      this.maxLines,
      this.textAlign,
      this.textDecoration,
      this.overflow})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: true,
      overflow: overflow,
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines,
      style: TextStyle(
        fontWeight: fontWeight ?? FontWeight.normal,
        fontSize: fontSize ?? 15,
        color: color ?? ColorManager.primaryTextColor,
        overflow: maxLines != null ? TextOverflow.ellipsis : null,
        decoration: textDecoration,
        fontFamily: "Ador",
      ),
    );
  }
}
