import 'dart:io';

import 'package:flutter/material.dart';

import '../common.dart';

Future<File?> showBottomModalPickFoto({required BuildContext context}) {
  return showModalBottomSheet<File>(
    context: context,
    enableDrag: true,
    useSafeArea: false,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8), topRight: Radius.circular(8))),
    builder: (context) => const ImageBottomSheetContent(),
  );
}

class ImageBottomSheetContent extends StatelessWidget with BaseWidget {
  const ImageBottomSheetContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                const Expanded(
                    child: CustomText(
                  "Pilih Gambar",
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                )),
                IconButton(
                    visualDensity: VisualDensity.compact,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.close))
              ],
            ),
          ),
          ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            horizontalTitleGap: 0,
            title: const CustomText("Kamera"),
            leading: const Icon(Icons.camera_alt_outlined),
            onTap: () async {
              try {
                final result = await DynamicalPicker.pickFromCamera();
                if (result != null) {
                  Navigator.pop(context, result);
                }
              } catch (e) {
                showErrorDialog(context, e.toString(), title: "");
              }
            },
          ),
          ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            horizontalTitleGap: 0,
            title: const CustomText("Gallery"),
            leading: const Icon(Icons.folder_open_rounded),
            onTap: () async {
              try {
                final result = await DynamicalPicker.pickFile(onlyImage: true);
                if (result != null) {
                  Navigator.pop(context, result);
                }
              } catch (e) {
                showErrorDialog(context, e.toString());
              }
            },
          ),
        ],
      ),
    );
  }
}
