import 'package:flutter/material.dart';

import '../common.dart';

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({
    Key? key,
    this.onPressed,
    this.onWillPop,
    this.title,
    this.message,
    this.btnText,
    this.imgAssets,
    this.withCancel,
    this.onPressedCancel,
    this.btnTextCancel,
  }) : super(key: key);
  final VoidCallback? onPressed;
  final VoidCallback? onPressedCancel;
  final VoidCallback? onWillPop;
  final String? title;
  final String? message;
  final String? btnText;
  final String? btnTextCancel;
  final String? imgAssets;
  final bool? withCancel;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      margin: const EdgeInsets.all(24),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // SvgPicture.asset(imgAssets ?? ImageAssetPath.errorIllust),
            const SizedBox(height: 16),
            Visibility(
                visible: title != null,
                child: CustomText(
                  title ?? "",
                  fontWeight: FontWeight.w700,
                )),
            const SizedBox(height: 8),
            Visibility(
                visible: message != null,
                child: CustomText(
                  message ?? "",
                  color: ColorPalletes.abuabuGelap,
                )),
            const SizedBox(height: 41),
            Row(
              children: [
                Visibility(
                  visible: withCancel ?? false,
                  child: Expanded(
                    child: CustomButton(
                      onPressed: onPressedCancel ??
                          () {
                            Navigator.pop(context);
                          },
                      buttonText: btnTextCancel ?? "Batal",
                      buttonColor: Colors.white,
                      textColor: ColorPalletes.accentGelap,
                      withBorder: true,
                      customBorder: const BorderSide(
                          color: ColorPalletes.accentGelap, width: 1),
                      margin: const EdgeInsets.only(right: 8),
                    ),
                  ),
                ),
                Expanded(
                  child: CustomButton(
                    onPressed: onPressed,
                    buttonText: btnText ?? "Tutup",
                    buttonColor: ColorPalletes.accentGelap,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
