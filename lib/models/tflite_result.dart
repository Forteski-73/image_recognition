class TFLiteResult {
  late double confidence;  // Usando 'late' para garantir que a variável será inicializada
  late int id;             // Usando 'late' para garantir que a variável será inicializada
  late String label;       // O mesmo para o 'label'

  TFLiteResult(this.confidence, this.id, this.label);

  TFLiteResult.fromModel(dynamic model) {
    confidence = model['confidence'];
    id = model['index'];
    label = model['label'];
  }
}