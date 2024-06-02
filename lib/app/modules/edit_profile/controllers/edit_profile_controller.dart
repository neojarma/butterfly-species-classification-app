import 'package:butterfly_classification/app/core/themes/custom_snackbar_theme.dart';
import 'package:butterfly_classification/app/data/provider/api_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart' as dio;

class EditProfileController extends GetxController with StateMixin {
  String temporaryImagePath = '';
  var isImageChange = false.obs;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  String email = '';
  String name = '';
  String profileImage = '';

  final storage = const FlutterSecureStorage();
  final dioHttp = dio.Dio();

  @override
  void onInit() {
    initializeUserProfile();

    super.onInit();
  }

  void pickImage() async {
    isImageChange.value = false;
    var userImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (userImage == null) return;

    isImageChange.value = true;
    temporaryImagePath = userImage.path;

    refresh();
  }

  void handleEditProfile() async {
    change(false, status: RxStatus.loading());

    final name = nameController.text;
    final email = emailController.text;
    final token = await storage.read(key: 'token');
    final username = await storage.read(key: 'username');

    final dio.FormData formData = dio.FormData.fromMap(
      isImageChange.value
          ? {
              "image": await dio.MultipartFile.fromFile(
                temporaryImagePath,
                filename: temporaryImagePath.split('/').last,
              ),
              "full_name": name,
              "email": email,
            }
          : {
              "full_name": name,
              "email": email,
            },
    );
    dio.Options options = dio.Options(headers: {
      'Authorization': 'Bearer $token',
    });

    try {
      change(false, status: RxStatus.loading());
      await dioHttp.put(ApiProvider.profiles, data: formData, options: options);
    } catch (e) {
      throw Exception('Failed to send request $e');
    }

    CustomSnackbar.successSnackbar(
      title: 'Success',
      message: 'Success update profile',
    );

    if (isImageChange.value) {
      await storage.write(
        key: 'img',
        value: '$username/${temporaryImagePath.split('/').last}',
      );
    }

    await storage.write(key: 'email', value: email);
    await storage.write(key: 'name', value: name);

    change(true, status: RxStatus.success());
  }

  void initializeUserProfile() async {
    change(false, status: RxStatus.loading());

    email = (await storage.read(key: 'email'))!;
    name = (await storage.read(key: 'name'))!;
    final img = (await storage.read(key: 'img'));
    profileImage = '${ApiProvider.images}/user/$img';

    nameController.text = name;
    emailController.text = email;

    change(true, status: RxStatus.success());
  }
}
