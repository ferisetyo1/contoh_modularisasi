import 'package:flutter/material.dart';
import '../common.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            CircularProgressIndicator(
              color: ColorPalletes.accentGelap,
            ),
            SizedBox(height: 16),
            CustomText(
              "Harap tunggu",
              color: ColorPalletes.abuabuMedium,
            )
          ],
        ),
      ),
    );
  }
}
