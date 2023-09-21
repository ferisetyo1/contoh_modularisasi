import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../common.dart';

class PageWrapper<T> extends StatelessWidget {
  final ResponseHandler<T> respon;
  final Function()? retry;
  final Widget Function(T? data)? success;
  final Widget Function()? loading;
  final double? width;
  final double? height;
  final EdgeInsets? margin;
  final Function()? noInternet;
  final Function(String? message)? error;
  final ScrollController? scrollController;

  const PageWrapper({
    super.key,
    required this.respon,
    this.retry,
    this.success,
    this.width,
    this.height,
    this.margin,
    this.noInternet,
    this.error,
    this.loading,
    this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return RefreshIndicator(
        onRefresh: () async => retry?.call(),
        color: ColorPalletes.accentGelap,
        child: ListView(
          controller: scrollController,
          padding: margin ?? const EdgeInsets.all(24),
          children: [
            respon.maybeWhen(
              orElse: () => const SizedBox(),
              noConnection: (data) => Container(
                width: width ?? constraint.maxWidth,
                height: height ?? constraint.maxHeight,
                padding: EdgeInsets.zero == margin || margin?.left == 0
                    ? const EdgeInsets.all(20)
                    : EdgeInsets.zero,
                child: noInternet?.call() ??
                    GeneralError(
                      title: "Connection Lost",
                      subTitle: "Please check your phone connection.",
                      onTap: retry,
                    ),
              ),
              success: (data) => success?.call(data) ?? const SizedBox(),
              error: (message) =>
                  error?.call(message) ??
                  Container(
                    width: width ?? constraint.maxWidth,
                    height: height ?? constraint.maxHeight,
                    padding: EdgeInsets.zero == margin || margin?.left == 0
                        ? const EdgeInsets.all(20)
                        : EdgeInsets.zero,
                    child: GeneralError(
                      title: "",
                      subTitle: message,
                      onTap: retry,
                    ),
                  ),
              loading: () =>
                  loading?.call() ??
                  SizedBox(
                    width: width ?? constraint.maxWidth,
                    height: height ?? constraint.maxHeight,
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: ColorPalletes.accentGelap,
                      ),
                    ),
                  ),
            ),
          ],
        ),
      );
    });
  }
}
