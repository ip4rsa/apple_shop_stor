class ApiException implements Exception {
  int? statuseCod;
  String? eroreMessage;
  ApiException(this.statuseCod, this.eroreMessage);
}
