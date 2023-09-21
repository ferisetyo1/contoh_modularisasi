import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final TextOverflow? overFlow;
  final int? maxLines;
  final double? height;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final Color? background;
  final BorderRadius? borderRadius;
  final Widget? prefixIcon;
  final Widget? suffix;
  final FontStyle? fontStyle;
  final double? horizontalTextGap;
  final Function()? onTap;
  final AlignmentGeometry? alignment;
  final MainAxisAlignment? mainAlligment;
  final MainAxisSize? mainAxisSize;
  final TextDecoration? decoration;
  final BorderSide? side;

  const CustomText(
    this.text, {
    Key? key,
    this.fontSize = 14,
    this.color,
    this.fontWeight,
    this.textAlign,
    this.overFlow,
    this.maxLines,
    this.height,
    this.margin,
    this.prefixIcon,
    this.horizontalTextGap,
    this.onTap,
    this.alignment,
    this.suffix,
    this.decoration,
    this.fontStyle,
    this.padding,
    this.background,
    this.borderRadius,
    this.mainAlligment,
    this.mainAxisSize,
    this.side,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: InkWell(
        borderRadius: borderRadius,
        onTap: onTap,
        child: Container(
          alignment: alignment,
          padding: padding,
          decoration: BoxDecoration(
              color: background,
              borderRadius: borderRadius,
              border: side != null
                  ? Border.fromBorderSide(side ?? const BorderSide())
                  : null),
          child: Row(
            mainAxisAlignment: mainAlligment ?? MainAxisAlignment.start,
            mainAxisSize: mainAxisSize ?? MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (prefixIcon != null)
                Padding(
                  padding: EdgeInsets.only(
                    right: horizontalTextGap ?? 0,
                  ),
                  child: prefixIcon!,
                ),
              Flexible(
                fit: mainAxisSize == MainAxisSize.max
                    ? FlexFit.tight
                    : FlexFit.loose,
                child: Text(
                  text,
                  textAlign: textAlign,
                  overflow: overFlow,
                  maxLines: maxLines,
                  style: TextStyle(
                      color: color ?? const Color(0xFF121212),
                      fontSize: fontSize,
                      height: height,
                      fontWeight: fontWeight,
                      decoration: decoration,
                      fontStyle: fontStyle),
                ),
              ),
              if (suffix != null)
                Padding(
                  padding: EdgeInsets.only(
                    left: horizontalTextGap ?? 0,
                  ),
                  child: suffix!,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
