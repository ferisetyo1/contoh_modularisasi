import 'package:flutter/material.dart';

import '../common.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String buttonText;
  final String? eventName;
  final Map<String, dynamic>? eventParams;
  final double? height;
  final Color? buttonColor;
  final double? width;
  final Color? textColor;
  final double fontSize;
  final EdgeInsets? margin;
  final Widget? prefixWidget;
  final Axis prefixAxis;
  final double elevation;
  final bool withBorder;
  final BorderSide? customBorder;
  final BorderRadiusGeometry? borderRadius;
  final bool isLoading;

  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.buttonText,
    this.height,
    this.buttonColor,
    this.width,
    this.textColor,
    this.margin,
    this.prefixWidget,
    this.prefixAxis = Axis.horizontal,
    this.fontSize = 14,
    this.elevation = 0,
    this.withBorder = false,
    this.eventName,
    this.eventParams,
    this.customBorder,
    this.borderRadius,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? const EdgeInsets.all(0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(width ?? double.infinity, height ?? 40),
          primary: buttonColor ?? ColorPalletes.accentGelap,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(8),
            side: withBorder
                ? customBorder ??
                    const BorderSide(
                      color: Colors.white,
                      width: 0.5,
                    )
                : BorderSide.none,
          ),
          elevation: elevation,
        ),
        onPressed: onPressed == null || isLoading
            ? null
            : () async {
                if (eventName != null) {
                  // analitycs
                  // await TrackingUtil.logEvent(
                  //     eventName: eventName!, param: eventParams);
                }
                if (onPressed != null) onPressed!();
              },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
              visible: prefixAxis != Axis.horizontal && prefixWidget != null,
              child: Padding(
                padding:
                    EdgeInsets.only(bottom: prefixWidget != null ? 8.0 : 0),
                child: prefixWidget ?? const SizedBox(),
              ),
            ),
            isLoading
                ? const CircularProgressIndicator(
                    color: ColorPalletes.accentGelap,
                  )
                : CustomText(
                    buttonText,
                    color: textColor ?? Colors.white,
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.center,
                    fontSize: fontSize,
                    prefixIcon:
                        prefixAxis == Axis.horizontal ? prefixWidget : null,
                    horizontalTextGap: 8,
                  ),
          ],
        ),
      ),
    );
  }
}
