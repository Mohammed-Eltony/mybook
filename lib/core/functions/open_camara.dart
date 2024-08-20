import 'package:image_picker/image_picker.dart';

class OpenCameraAndGallery {
  static uploadImages({required bool isCameraOrgallery}) async {
    final pickedImag = await ImagePicker().pickImage(
        source: isCameraOrgallery ? ImageSource.camera : ImageSource.gallery);

    return pickedImag?.path;
  }
}
