import 'dart:io';
import 'package:image_picker/image_picker.dart';

class CameraHelper {
  static Future<File?> pickImage() async {
    final picker = ImagePicker();  // Cria uma instância do ImagePicker
    final image = await picker.pickImage(source: ImageSource.camera);  // Usa o método de instância pickImage

    if (image == null) {
      return null;
    }
    return File(image.path);  // Retorna a imagem como um arquivo
  }
}
