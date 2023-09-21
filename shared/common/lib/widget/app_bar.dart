import 'package:core/core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../common.dart';

AppBar feriAppBar(
    {String? title,
    PreferredSizeWidget? bottom,
    ShapeBorder? shape,
    bool automaticallyImplyLeading = true}) {
  return AppBar(
    title: title != null
        ? Text(
            title,
            style: const TextStyle(color: Colors.black),
          )
        : null,
    systemOverlayStyle: SystemUiOverlayStyle.dark,
    automaticallyImplyLeading: automaticallyImplyLeading,
    backgroundColor: Colors.transparent,
    elevation: 0,
    iconTheme: const IconThemeData(color: Colors.black),
    bottom: bottom,
    centerTitle: true,
    shape: shape,
    actions: [
      Visibility(
        visible: kDebugMode || AppConfig.appFlavor != Flavor.prod,
        child: CustomText(
          "Alice",
          fontWeight: FontWeight.w500,
          color: ColorPalletes.accentGelap,
          margin: const EdgeInsets.only(right: 20),
          onTap: () {
            getIt<Alice>().showInspector();
          },
        ),
      )
    ],
  );
}
