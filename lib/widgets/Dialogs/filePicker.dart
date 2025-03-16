import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:myproduct/app_theme.dart';
import 'package:myproduct/helpers/constants/Globals.dart';
import 'package:myproduct/helpers/constants/app_utils.dart';
import 'package:myproduct/widgets/Toasts/customToastifications.dart';
import 'package:path/path.dart' as path;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

Future<File?> showPicker(
    {required BuildContext context,
    required allowedExtensions,
    required bool onlyPdf}) async {
  final file = await showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext bc) {
        return Container(
          decoration:  BoxDecoration(
              color: AppTheme.primary_1,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              )),
          child: SafeArea(
            child: Wrap(
              children: <Widget>[
                Center(
                    child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 5,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                )),
                if (!onlyPdf)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Column(
                      children: [
                        ListTile(
                          leading: Icon(
                            Icons.photo_camera,
                            color: Colors.grey.shade700,
                          ),
                          title: Text('Camera',
                              style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)),
                          onTap: () async {
                            final file = await getFromCamera(
                                context: context,
                                allowedExtensions: allowedExtensions);

                            Navigator.of(context).pop(file);
                          },
                        ),
                        Divider(
                          thickness: 2,
                          color: Colors.grey.withOpacity(0.2),
                        ),
                      ],
                    ),
                  ),
                if (!onlyPdf)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Column(
                      children: [
                        ListTile(
                            leading: Icon(
                              Icons.photo_library,
                              color: Colors.grey.shade700,
                            ),
                            title: Text(
                              'Gallery',
                              style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            onTap: () async {
                              var status = await Permission.storage.status;

                              if (!status.isGranted) {
                                // Get.snackbar("Permission",
                                //     "Please allow Storage permission");
                                await Permission.storage.request();
                              }

                              final file = await getFromGallery(
                                  context: context,
                                  allowedExtensions: allowedExtensions);
                              Navigator.of(context).pop(file);
                            }),
                        Divider(
                          thickness: 2,
                          color: Colors.grey.withOpacity(0.2),
                        ),
                      ],
                    ),
                  ),
                // true
                //     ? SizedBox()
                //     :

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    children: [
                      ListTile(
                          leading: Icon(
                            Icons.file_present,
                            color: Colors.grey.shade700,
                          ),
                          title: Text(
                            'Files',
                            style: TextStyle(
                                color: Colors.grey.shade700,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          onTap: () async {
                            var status = await Permission.storage.status;

                            if (!status.isGranted) {
                              // Get.snackbar("Permission",
                              //     "Please allow Storage permission");
                              await Permission.storage.request();
                            }

                            final file = await getFromFiles(
                                context: context,
                                allowedExtensions: allowedExtensions);
                            Navigator.of(context).pop(file);
                          }),
                      Divider(
                        thickness: 2,
                        color: Colors.grey.withOpacity(0.2),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.cancel_rounded,
                      color: Colors.red.shade700,
                    ),
                    title: Text('Cancel',
                        style: TextStyle(
                            color: Colors.red.shade700,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      });
  return file;
}

Future<File?> getFromGallery(
    {required BuildContext context, required allowedExtensions}) async {
  XFile? pickedFile = await ImagePicker().pickImage(
    source: ImageSource.gallery,
    maxWidth: 1800,
    maxHeight: 1800,
  );
  if (pickedFile != null) {
    try {
      if (checkFileExtension(pickedFile.path, allowedExtensions)) {
        File imageFile = File(pickedFile.path);

        final bytes = await imageFile.lengthSync();
        final kb = bytes / 1024;
        final mb = kb / 1024;
        if (mb <= Globals.maxUploadSize) {
          return imageFile;
        } else {
          showCustomToast(
              context: context,
              statusCode: 2,
              title: "File Max Size",
              subtitle: "${Globals.maxUploadSize} MB is maximum allowed size");
        }
      } else {
        showCustomToast(
            context: context,
            statusCode: 4,
            title: "Invalid File Extension",
            subtitle: "Allowed Extensions : ${extIcons}");
      }
    } catch (e) {
      // log(e.toString());
    }
  }
  return null;
}

Future<File?> getVideoFromGallery(
    {required BuildContext context, required allowedExtensions}) async {
  XFile? pickedFile = await ImagePicker().pickVideo(
    maxDuration: Duration(minutes: 5),
    source: ImageSource.gallery,
  );
  if (pickedFile != null) {
    try {
      if (checkFileExtension(pickedFile.path, allowedExtensions)) {
        File imageFile = File(pickedFile.path);

        final bytes = await imageFile.lengthSync();
        final kb = bytes / 1024;
        final mb = kb / 1024;
        if (mb <= Globals.maxUploadSize) {
          return imageFile;
        } else {
          showCustomToast(
              context: context,
              statusCode: 2,
              title: "File Max Size",
              subtitle: "${Globals.maxUploadSize} MB is maximum allowed size");
        }
      } else {
        showCustomToast(
            context: context,
            statusCode: 4,
            title: "Invalid File Extension",
            subtitle: "Allowed Extensions : ${extIcons}");
      }
    } catch (e) {
      // log(e.toString());
    }
  }
  return null;
}

Future<File?> getFromFiles(
    {required BuildContext context, required allowedExtensions}) async {
  final pickedFile = await FilePicker.platform.pickFiles(
      withData: true,
      // type: FileType.custom,
      // type: FileType.custom,
      // allowedExtensions: extIcons,
      allowMultiple: false);

  if (pickedFile != null) {
    try {
      for (var element in pickedFile.files) {
        // log(element.identifier.toString());
        // log(element.name.toString());
        // log(element.extension.toString());
        // log(element.size.toString());
        // log(element.path.toString());
        //  log(element.xFile.toString());
      }

      for (var element in pickedFile.xFiles) {
        // log(element.mimeType.toString());
        // log(element.name.toString());
        // log(element.path.toString());
        // log(element.length().toString());
      }

      // log(message)
      File imageFile = File("${pickedFile.files.first.path!}");

      log("Absolute path :${path.extension(imageFile.path)}");
      log("Relative path :${path.isRelative(imageFile.path)}");
      log("Root Relative path :${path.isRootRelative(imageFile.path)}");
      log("2 Absolute path :${path.absolute(imageFile.path)}");

      if (path.extension(imageFile.path).isEmpty) {
        // log(pickedFile.files.first.bytes.toString());
        Uint8List imageInUnit8List =
            pickedFile.files.first.bytes!; // store unit8List image here ;
        final tempDir = await getTemporaryDirectory();
        File file = await File('${tempDir.path}/resume.pdf').create();
        file.writeAsBytesSync(imageInUnit8List);
        imageFile = file;
      }

      if (checkFileExtension(imageFile.path, allowedExtensions)) {
        final bytes = await imageFile.lengthSync();
        final kb = bytes / 1024;
        final mb = kb / 1024;
        // log("Total mb : $mb");
        if (mb <= Globals.maxUploadSize) {
          return imageFile;
        } else {
          showCustomToast(
              context: context,
              statusCode: 2,
              title: "File Max Size",
              subtitle: "${Globals.maxUploadSize} MB is maximum allowed size");
        }
      } else {
        showCustomToast(
            context: context,
            statusCode: 4,
            title: "Invalid File Extension",
            subtitle: "Allowed Extensions : ${allowedExtensions}");
      }
    } catch (e) {
      // log(e.toString());
    }
  }
  return null;
}

Future<File?> getFromCamera(
    {required BuildContext context, required allowedExtensions}) async {
  XFile? pickedFile = await ImagePicker().pickImage(
    source: ImageSource.camera,
    maxWidth: 1800,
    maxHeight: 1800,
  );
  if (pickedFile != null) {
    try {
      File imageFile = File(pickedFile.path);

      if (checkFileExtension(imageFile.path, allowedExtensions)) {
        final bytes = await imageFile.lengthSync();
        final kb = bytes / 1024;
        final mb = kb / 1024;
        log("Total mb : $mb");
        if (mb <= Globals.maxUploadSize) {
          return imageFile;
        } else {
          showCustomToast(
              context: context,
              statusCode: 2,
              title: "File Max Size",
              subtitle: "${Globals.maxUploadSize} MB is maximum allowed size");
        }
      } else {
        showCustomToast(
            context: context,
            statusCode: 4,
            title: "Invalid File Extension",
            subtitle: "Allowed Extensions : ${allowedExtensions}");
      }
      return null;
    } catch (e) {
      log("Error while getting : ${e}");
      return null;
    }
  }
  return null;
}
