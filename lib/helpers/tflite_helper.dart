import 'dart:async';
import 'dart:io';
import 'package:image_recognition/models/tflite_result.dart';
import 'package:tflite/tflite.dart';

class TFLiteHelper {
  static Future loadModel() async {
    await Tflite.loadModel(
      model: "assets/model_unquant.tflite",
      labels: "assets/labels.txt",
      numThreads: 1,
    );
  }

  static void dispose() {
    Tflite.close();
  }

  static Future<List<TFLiteResult>> classifyImage(File image) async {
    List<TFLiteResult> outputs = [];
    var output = await Tflite.runModelOnImage(
      path: image.path,
      imageMean: 0.0,
      imageStd: 255.0,
      numResults: 2,
      threshold: 0.2,
      asynch: true,
    );

    // Verificar se output não é null
    if (output != null) {
      output.forEach((value) {
        final element = TFLiteResult.fromModel(value);
        outputs.add(element);
      });
    }

    print(outputs);

    return outputs;
  }
}
