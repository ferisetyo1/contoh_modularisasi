import 'package:flutter/material.dart';
import '../common.dart';

class GeneralError extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final String? btnText;
  final EdgeInsetsGeometry? margin;
  final Widget? customImg;
  final Function()? onTap;
  const GeneralError({
    Key? key,
    this.title,
    this.subTitle,
    this.margin,
    this.onTap,
    this.btnText,
    this.customImg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: margin,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // customImg ?? SvgPicture.asset(ImageAssetPath.errorIllust),
            const SizedBox(height: 16),
            if (title?.isNotEmpty == true)
              CustomText(title ?? "Telah terjadi kesalahan", fontSize: 20),
            const SizedBox(height: 8),
            CustomText(
              subTitle ??
                  "Telah terjadi kesalahan yang tidak diketahui pada aplikasi. Silahkan coba lagi beberapa saat",
              textAlign: TextAlign.center,
              color: ColorPalletes.abuabuGelap,
            ),
            if (onTap != null) const SizedBox(height: 32),
            if (onTap != null)
              CustomButton(
                onPressed: onTap,
                buttonText: btnText ?? "Coba lagi",
              )
          ],
        ));
  }
}
