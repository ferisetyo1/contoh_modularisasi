import 'package:flutter/material.dart';
import 'package:core/core.dart';

import '../common.dart';

mixin BaseWidget {
  showErrorDialog(BuildContext context, String message,
      {String? title = "Terjadi Kesalahan",
      String? btnText,
      Function()? onPressed,
      String? imgAssets,
      int? id}) async {
    DialogHelper().show(
        context,
        id: id,
        DialogWidget.custom(
            child: ErrorDialog(
          title: title,
          imgAssets: imgAssets,
          message: message,
          btnText: btnText,
          onPressed: () {
            onPressed?.call();
            dismissDialog(context);
          },
        )));
  }

  showErrorRequestDialog(BuildContext context, String? message,
      {Function()? onPressed, int? id}) {
    String msg = "$message";
    showErrorDialog(context, msg,
        id: id, title: "Gagal Request", onPressed: onPressed);
  }

  showLoadingDialog(BuildContext context, {int? id}) {
    debugPrint("showLoadingDialog");
    DialogHelper().show(
        context,
        id: id,
        DialogWidget.custom(
          closable: false,
          child: const LoadingDialog(),
        ));
  }

  dismissDialog(BuildContext context, {int? id}) {
    DialogHelper().hide(context, id: id);
  }

  showSuccessSnacbar(BuildContext context, String s) {
    context.showSuccessSnackbar(s);
  }

  showErrorSnacbar(BuildContext context, String s) {
    context.showErrorSnackbar(s);
  }

  showInfoSnacbar(BuildContext context, String s, {int? duration}) {
    context.showInfoSnackbar(s, durationInSeconds: duration ?? 2);
  }

  showPreviewImage(BuildContext context, String s, {String desc = ""}) {
    showDialog(
        context: context,
        builder: (context) {
          return Material(
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                PhotoView(imageProvider: CachedNetworkImageProvider(s)),
                Padding(
                    padding: const EdgeInsets.all(24),
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(
                        Icons.close,
                        size: 36,
                      ),
                      color: Colors.white,
                    )),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: CustomText(
                    desc,
                    color: Colors.white,
                    background: Colors.black.withOpacity(0.3),
                    textAlign: TextAlign.center,
                    padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
                    mainAxisSize: MainAxisSize.max,
                  ),
                )
              ],
            ),
          );
        });
  }

  void defaultHandleResponse<T>(
      {required BuildContext context,
      required ResponseHandler<T> respon,
      Function()? onLoading,
      Function(T? data)? onSuccess,
      Function(T? data)? customSuccess,
      Function(String? message)? onError,
      Function(String? message)? customOnError,
      Function(T? data)? onNoConnection,
      bool? withDialogLoading,
      bool withSuccessSnackbar = true,
      int? id}) {
    respon.maybeWhen(
      orElse: () {
        dismissDialog(context, id: id);
      },
      noConnection: (data) {
        showErrorDialog(
          context,
          "Silahkan periksa koneksi internet anda",
          title: "Gagal menghubungkan",
          imgAssets: ImageAssetPath.errorIllust,
        );
        onNoConnection?.call(data);
      },
      loading: () {
        if (withDialogLoading ?? true) {
          showLoadingDialog(context, id: id);
        }
        onLoading?.call();
      },
      success: customSuccess ??
          (data) {
            if (withSuccessSnackbar) showSuccessSnacbar(context, "Berhasil");
            dismissDialog(context, id: id);
            onSuccess?.call(data);
          },
      error: customOnError ??
          (message) {
            showErrorRequestDialog(
              context,
              message,
              id: id,
              onPressed: () {
                // if (code == "1006" || code == "1005") {
                //   getIt<HiveHelper>().setIsLoggedIn(false);
                //   context.router.replaceAll([const LoginRoute()]);
                // }
              },
            );
            onError?.call(message);
          },
    );
  }

  Future<T?> showBaseModal<T>(
      BuildContext context, Widget Function(BuildContext context) builder,
      {bool isScrollControlled = false, bool useSafeArea = false}) {
    return showModalBottomSheet<T?>(
        context: context,
        isScrollControlled: isScrollControlled,
        useSafeArea: useSafeArea,
        shape: const RoundedRectangleBorder(
            borderRadius:
                BorderRadiusDirectional.vertical(top: Radius.circular(16))),
        builder: builder);
  }
}
