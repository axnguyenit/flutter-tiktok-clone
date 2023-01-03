import 'package:flutter/material.dart';
import 'package:tiktok/constants/constants.dart';

enum XButtonStyle { text, outlined, contained }

class XButton extends StatelessWidget {
  final bool loading;
  final Color? color;
  final String? title;
  final Widget? child;
  final double? width;
  final double? height;
  final double elevation;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final XButtonStyle style;
  final EdgeInsets? padding;
  final double? letterSpacing;
  final BorderRadius? borderRadius;
  final GestureTapCallback? onPressed;
  final Color? borderColor;

  const XButton({
    Key? key,
    this.title,
    this.child,
    this.color,
    this.width,
    this.height,
    this.padding,
    this.onPressed,
    this.prefixIcon,
    this.suffixIcon,
    this.borderColor,
    this.borderRadius,
    this.letterSpacing,
    this.elevation = 0,
    this.loading = false,
    this.style = XButtonStyle.contained,
  }) : super(key: key);

  const XButton.contained({
    Key? key,
    this.title,
    this.child,
    this.color,
    this.width,
    this.height,
    this.padding,
    this.onPressed,
    this.prefixIcon,
    this.suffixIcon,
    this.borderColor,
    this.borderRadius,
    this.letterSpacing,
    this.elevation = 0,
    this.loading = false,
    this.style = XButtonStyle.contained,
  }) : super(key: key);

  const XButton.outlined({
    Key? key,
    this.title,
    this.child,
    this.color,
    this.width,
    this.height,
    this.padding,
    this.onPressed,
    this.prefixIcon,
    this.suffixIcon,
    this.borderColor,
    this.borderRadius,
    this.letterSpacing,
    this.elevation = 0,
    this.loading = false,
    this.style = XButtonStyle.outlined,
  }) : super(key: key);

  const XButton.text({
    Key? key,
    this.title,
    this.child,
    this.color,
    this.width,
    this.height,
    this.padding,
    this.onPressed,
    this.prefixIcon,
    this.suffixIcon,
    this.borderColor,
    this.borderRadius,
    this.letterSpacing,
    this.elevation = 0,
    this.loading = false,
    this.style = XButtonStyle.text,
  }) : super(key: key);

  const XButton.negative({
    Key? key,
    this.title,
    this.child,
    this.color = AppColors.danger,
    this.width,
    this.height,
    this.padding,
    this.onPressed,
    this.prefixIcon,
    this.suffixIcon,
    this.borderColor,
    this.borderRadius,
    this.letterSpacing,
    this.elevation = 0,
    this.loading = false,
    this.style = XButtonStyle.contained,
  }) : super(key: key);

  Color _getBorderColor(BuildContext context) {
    switch (style) {
      case XButtonStyle.contained:
      case XButtonStyle.outlined:
        return borderColor ?? context.primaryColor;
      case XButtonStyle.text:
        return borderColor ?? context.lightColor;
    }
  }

  Color _getBackgroundColor(BuildContext context) {
    switch (style) {
      case XButtonStyle.contained:
        return color ?? context.primaryColor;
      case XButtonStyle.text:
      case XButtonStyle.outlined:
        return context.lightColor;
    }
  }

  Color _getTextColor(BuildContext context) {
    switch (style) {
      case XButtonStyle.text:
      case XButtonStyle.outlined:
        return color ?? context.primaryColor;
      case XButtonStyle.contained:
        return context.lightColor;
    }
  }

  Widget _buildLoading(BuildContext context) {
    return SizedBox(
      width: 12,
      height: 12,
      child: CircularProgressIndicator(
        color: _getTextColor(context),
        strokeWidth: 2,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final xBorderRadius = borderRadius ?? BorderRadius.circular(2);
    final textColor = _getTextColor(context);
    final backgroundColor = _getBackgroundColor(context);
    final isEnabled = onPressed != null;

    return Material(
      borderRadius: xBorderRadius,
      color: isEnabled ? backgroundColor : context.borderDisableColor,
      shadowColor: backgroundColor,
      elevation: elevation,
      child: InkWell(
        onTap: loading ? null : onPressed,
        borderRadius: xBorderRadius,
        child: Ink(
          width: width,
          height: height,
          padding: padding ??
              const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: xBorderRadius,
            border: isEnabled
                ? Border.all(color: _getBorderColor(context), width: 1.0)
                : Border.all(
                    color: isEnabled
                        ? _getBorderColor(context)
                        : context.borderDisableColor,
                    width: 2.0,
                  ),
          ),
          child: child ??
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (prefixIcon != null) ...[
                      prefixIcon!,
                      const SizedBox(width: 8),
                    ],
                    Text(
                      title!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color:
                            isEnabled ? textColor : context.borderDisableColor,
                        fontWeight: FontWeight.w500,
                        letterSpacing: letterSpacing,
                      ),
                    ),
                    if (suffixIcon != null && !loading) ...[
                      const SizedBox(width: 8),
                      suffixIcon!,
                    ] else if (loading) ...[
                      const SizedBox(width: 8),
                      _buildLoading(context),
                    ],
                  ],
                ),
              ),
        ),
      ),
    );
  }
}
