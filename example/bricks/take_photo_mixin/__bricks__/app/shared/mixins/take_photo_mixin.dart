import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

import '../themes/app_colors.dart';

mixin TakePhotoMixin on GetxController {
  final _imagePicker = ImagePicker();
  File? fileImage;
  String? retrieveDataError;

  Future<void> takePhoto(
    ImageSource imageSource, {
    bool closeBefore = false,
  }) async {
    final pickedFile = await _imagePicker.pickImage(
      source: imageSource,
      imageQuality: 90,
    );
    if (pickedFile != null) {
      final finalImage = await ImageCropper().cropImage(
        sourcePath: pickedFile.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ],
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'Selecione a área',
            toolbarColor: AppColors.primary,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false,
          ),
          IOSUiSettings(title: 'Selecione a área'),
        ],
      );
      if (finalImage != null) {
        fileImage = File(finalImage.path);
        update();
      }
    }
    if (closeBefore) {
      Get.back();
    }
  }

  Future<void> retrieveLostData() async {
    final LostDataResponse response = await _imagePicker.retrieveLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      fileImage = File(response.file!.path);
    } else {
      retrieveDataError = response.exception!.message;
    }
    update();
  }

  Future<String?> setPhotoProfile(String userId) async {
    if (fileImage != null) {
      final extensionFile = basename(fileImage!.path).split('.').last;
      final nameImageOffer = 'profile.$extensionFile';
      var ref = FirebaseStorage.instance
          .ref('users/$userId/profile')
          .child(nameImageOffer);
      final result = await ref.putFile(fileImage!);
      return await result.ref.getDownloadURL();
    }
    return null;
  }
}
