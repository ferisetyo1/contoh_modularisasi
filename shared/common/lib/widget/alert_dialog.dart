import 'package:flutter/material.dart';

import '../common.dart';

class FeriAlertDialog extends StatelessWidget {
  final String title;
  final String desc;
  final Function()? positiveAction;
  final Function()? negativeAction;
  final String? positiveBtnText;
  final String? negativeBtnText;
  const FeriAlertDialog({
    super.key,
    required this.title,
    required this.desc,
    this.positiveAction,
    this.negativeAction,
    this.positiveBtnText,
    this.negativeBtnText,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  CustomText(
                    title,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(height: 8),
                  CustomText(
                    desc,
                    fontSize: 12,
                    color: ColorPalletes.abuabuGelap,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                if (negativeBtnText != null)
                  Expanded(
                      child: CustomButton(
                          withBorder: true,
                          customBorder: const BorderSide(
                              color: ColorPalletes.abuabuTerang, width: 1),
                          buttonColor: Colors.white,
                          textColor: ColorPalletes.accentGelap,
                          onPressed: () {
                            Navigator.pop(context);
                            negativeAction?.call();
                          },
                          buttonText: negativeBtnText ?? "")),
                if (positiveBtnText != null && negativeBtnText != null)
                  const SizedBox(width: 8),
                if (positiveBtnText != null)
                  Expanded(
                    child: CustomButton(
                        onPressed: () {
                          Navigator.pop(context, true);
                          positiveAction?.call();
                        },
                        buttonText: positiveBtnText ?? ""),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
