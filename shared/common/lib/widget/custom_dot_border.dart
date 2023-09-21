import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../common.dart';

class CustomDotBorder extends StatelessWidget {
  final double width;
  final double height;
  const CustomDotBorder({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: ColorPalletes.accentGelap,
      strokeWidth: 2,
      borderType: BorderType.RRect,
      strokeCap: StrokeCap.round,
      dashPattern: const [10, 10],
      radius: const Radius.circular(8),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: ColorPalletes.accentTerang,
            borderRadius: BorderRadius.circular(8)),
        child: const Center(
          child: Icon(
            Icons.add,
            color: ColorPalletes.accentGelap,
          ),
        ),
      ),
    );
  }
}
