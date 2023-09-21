import 'dart:io';
import 'package:core/core.dart';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart' as pp;

class DynamicalPicker {
  static var imageExts = ['jpg', 'jpeg', 'png', 'gif'];
  static var allowedExtensions = [
    ...imageExts,
    // 'bmp',
    'pdf',
    // 'doc',
    // 'docx',
    // 'csv',
    // 'xls',
    // 'xlsx',
    // 'ppt',
  ];

  static Future<String?> findLocalPath() async {
    String? externalStorageDirPath;
    if (Platform.isAndroid) {
      try {
        externalStorageDirPath = await AndroidPathProvider.downloadsPath;
      } catch (e) {
        final directory = await pp.getExternalStorageDirectory();
        externalStorageDirPath = directory?.path;
      }
    } else if (Platform.isIOS) {
      externalStorageDirPath =
          (await pp.getApplicationDocumentsDirectory()).absolute.path;
    }
    return externalStorageDirPath;
  }

  static Future<File?> compressImageAndGetFile(File file) async {
    var targetPath = await setFilePath(file.absolute.path, compressed: true);
    var result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      targetPath!,
      quality: 50,
    );
    return Future.value(File(result?.path ?? ""));
  }

  static Future<File?> compressPDFAndGetFile(File file) async {
    if (Platform.isIOS) {
      return file;
    }
    var targetPath = await setFilePath(file.absolute.path, compressed: true);
    if (targetPath == null) return null;
    try {
      await PdfCompressor.compressPdfFile(
          file.path, targetPath, CompressQuality.MEDIUM);
      var finalResult = File(targetPath);
      return finalResult;
    } catch (e) {
      return null;
    }
  }

  static Future<String?> setFilePath(String url,
      {bool compressed = false}) async {
    String? path = await findLocalPath();
    if (path == null) return null;
    if (compressed) {
      return "$path/compressed_${url.split("/").last.split(".").first}.${url.split(".").last}";
    } else {
      return "$path/${url.split("/").last.split(".").first}.${url.split(".").last}";
    }
  }

  static Future<File?> pickFile({bool onlyImage = false}) async {
    try {
      final info = DeviceInfoPlugin();
      final status = await Permission.storage.request();
      bool storage = status.isGranted;
      if (Platform.isAndroid) {
        final androidInfo = await info.androidInfo;
        if (androidInfo.version.sdkInt >= 33) {
          storage = true;
        }
      }

      if (storage) {
        var files = await _pickFiles(
            (v) {}, onlyImage ? FileType.image : FileType.custom,
            multiple: false, usingAllowedExts: !onlyImage);
        if (files?.isNotEmpty == true) {
          return Future.value(files?.first);
        } else {
          return Future.value(null);
        }
      } else {
        return Future.error("Membutuhkan izin penyimpanan");
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  static Future<File?> pickFromCamera({Function(String)? internalError}) async {
    try {
      final status = await Permission.camera.request();
      if (status.isGranted) {
        final result = await _pickImage();
        return Future.value(result?.first);
      } else {
        return Future.error("Membutuhkan izin kamera");
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  // static Widget dialogImagePicker(
  //     {Function(File?)? retieveFile,
  //     Function()? noPermission,
  //     Function(String)? internalError}) {
  //   return Card(
  //     margin: const EdgeInsets.all(24),
  //     child: Column(
  //       mainAxisSize: MainAxisSize.min,
  //       children: [
  //         ListTile(
  //           title: const Text("From Gallery"),
  //           leading: const Icon(Icons.image),
  //           onTap: () {
  //             pickFile(
  //                 onlyImage: true,
  //                 retieveFile: retieveFile,
  //                 noPermission: noPermission,
  //                 internalError: internalError);
  //           },
  //         ),
  //         const Divider(
  //           color: ColorPalletes.abuabuGelap,
  //           height: 0,
  //           thickness: 0.5,
  //         ),
  //         ListTile(
  //           title: const Text("From Camera"),
  //           leading: const Icon(Icons.camera_alt),
  //           onTap: () {
  //             pickFromCamera(
  //                 retieveFile: retieveFile,
  //                 noPermission: noPermission,
  //                 internalError: internalError);
  //           },
  //         ),
  //       ],
  //     ),
  //   );
  // }

  static bool isTypeFileIsImage(String path) {
    return imageExts
        .singleWhere(
          (element) => element == path.split(".").last,
          orElse: () => "",
        )
        .isNotEmpty;
  }

  static bool isTypeFileIsPDF(String path) {
    return ["pdf"]
        .singleWhere(
          (element) => element == path.split(".").last,
          orElse: () => "",
        )
        .isNotEmpty;
  }

  static Future<List<File>?> _pickFiles(
      ValueChanged<List<File>>? onPickedFile, FileType filetype,
      {bool multiple = false, bool usingAllowedExts = false}) async {
    List<File> result = [];
    var rawResult = await FilePicker.platform.pickFiles(
      type: filetype,
      allowMultiple: multiple,
      allowedExtensions: filetype == FileType.custom
          ? usingAllowedExts
              ? allowedExtensions
              : null
          : null,
    );
    if (rawResult == null) {
      return null;
    }

    await Future.wait(rawResult.files.map((e) async {
      if (isTypeFileIsImage(e.path!)) {
        var file = await compressImageAndGetFile(File(e.path!));
        if (file != null) result.add(file);
      } else if (isTypeFileIsPDF(e.path!)) {
        var file = await compressPDFAndGetFile(File(e.path!));
        if (file != null) result.add(file);
      } else {
        result.add(File(e.path!));
      }
    }));
    onPickedFile?.call(result);
    return result;
  }

  static Future<List<File>?> _pickImage(
      {bool preferFrontCamera = false}) async {
    try {
      final image = await ImagePicker().pickImage(
        source: ImageSource.camera,
        imageQuality: 50,
        preferredCameraDevice:
            preferFrontCamera ? CameraDevice.front : CameraDevice.rear,
      );
      if (image == null) {
        return null;
      }
      var compressedFile = await compressImageAndGetFile(File(image.path));
      if (compressedFile == null) {
        return [];
      }
      var result = [compressedFile];
      return result;
    } on Exception catch (e) {
      debugPrint("failed to pick ${e.toString()}");
      return null;
    }
  }
}
