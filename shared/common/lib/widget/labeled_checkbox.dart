import 'package:flutter/material.dart';

import '../common.dart';

// ignore: must_be_immutable
class LabeledCheckBox extends StatelessWidget {
  bool isChecked;
  final String? label;
  final Widget? customLabel;
  final CrossAxisAlignment? crossAxisAlignment;
  final Function(bool?)? onChanged;
  LabeledCheckBox(
      {super.key,
      this.isChecked = true,
      this.label,
      this.customLabel,
      this.crossAxisAlignment,
      this.onChanged});

  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 24,
          child: Checkbox(
            activeColor: ColorPalletes.accentGelap,
            value: isChecked,
            onChanged: onChanged,
            side: const BorderSide(color: ColorPalletes.abuabuMedium),
          ),
        ),
        const SizedBox(width: 8),
        customLabel ?? CustomText(label ?? "")
      ],
    );
  }
}
