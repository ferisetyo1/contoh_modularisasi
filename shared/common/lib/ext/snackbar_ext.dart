import 'package:flutter/material.dart';

import '../widget/custom_text.dart';

extension SnackbarExt on BuildContext {
  Widget _content(String? title, String msg) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Visibility(
            visible: title != null,
            child: Column(
              children: [
                CustomText(
                  title ?? "",
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
                const SizedBox(height: 4),
              ],
            ),
          ),
          CustomText(
            msg,
            color: Colors.white,
          ),
        ],
      );

  ScaffoldFeatureController showErrorSnackbar(
    String message, {
    String? title,
    int durationInSeconds = 2,
    EdgeInsets? margin,
  }) {
    return ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        margin: margin,
        duration: Duration(seconds: durationInSeconds),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: Colors.red,
        content: _content(title, message),
      ),
    );
  }

  ScaffoldFeatureController showInfoSnackbar(String message,
      {String? title, int durationInSeconds = 2}) {
    return ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        duration: Duration(seconds: durationInSeconds),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: Colors.black,
        content: _content(title, message),
      ),
    );
  }

  ScaffoldFeatureController showSuccessSnackbar(
    String message, {
    String? title,
    int durationInSeconds = 2,
    EdgeInsets? margin,
  }) {
    return ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        margin: margin,
        duration: Duration(seconds: durationInSeconds),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: Colors.green,
        content: _content(title, message),
      ),
    );
  }
}
