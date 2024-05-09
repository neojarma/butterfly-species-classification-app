import 'package:butterfly_classification/app/routes/app_pages.dart';
import 'package:butterfly_classification/main.dart';
import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ObserveController extends GetxController with StateMixin {
  late CameraController camController;
  var toggleCamera = 0;

  @override
  void onInit() async {
    super.onInit();

    change(false, status: RxStatus.loading());
    camController = CameraController(
      allAvailableCameras[0],
      ResolutionPreset.medium,
      enableAudio: false,
    );
    await camController.initialize();
    change(true, status: RxStatus.success());
  }

  @override
  void dispose() {
    camController.dispose();
    super.dispose();
  }

  void flipCamera() async {
    change(false, status: RxStatus.loading());
    if (toggleCamera == 0) {
      camController = CameraController(
        allAvailableCameras[1],
        ResolutionPreset.medium,
        enableAudio: false,
      );
      toggleCamera = 1;
    } else {
      camController = CameraController(
        allAvailableCameras[0],
        ResolutionPreset.medium,
        enableAudio: false,
      );
      toggleCamera = 0;
    }
    await camController.initialize();
    change(true, status: RxStatus.success());
  }

  void takePicture() async {
    await camController.setFlashMode(FlashMode.off);
    var tempImage = await camController.takePicture();
    var tempImagePath = tempImage.path;
    Get.toNamed(Routes.PREVIEW_IMAGE, arguments: {
      "imageFile": tempImagePath,
    });
  }

  void uploadPictureFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image == null) return;
    var tempImagePath = image.path;

    Get.toNamed(Routes.PREVIEW_IMAGE, arguments: {
      "imageFile": tempImagePath,
    });
  }
}
