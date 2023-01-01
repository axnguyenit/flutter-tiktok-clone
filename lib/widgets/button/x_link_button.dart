import 'package:flutter/material.dart';

class XLinkButton extends StatelessWidget {
  final String? title;
  final Widget? child;
  final double? fontSize;
  final TextStyle? textStyle;
  final List<Shadow>? shadows;
  final FontWeight? fontWeight;
  final TextDecoration? decoration;
  final GestureTapCallback? onPressed;

  const XLinkButton({
    Key? key,
    this.title,
    this.child,
    this.shadows,
    this.fontSize,
    this.textStyle,
    this.onPressed,
    this.decoration,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: child ??
          RichText(
            text: TextSpan(
              text: title ?? '',
              style: textStyle ??
                  TextStyle(
                    color: const Color(0xFF0571FA),
                    fontWeight: fontWeight ?? FontWeight.w500,
                    fontSize: fontSize,
                    shadows: shadows,
                    decoration: decoration,
                  ),
            ),
          ),
    );
  }
}
