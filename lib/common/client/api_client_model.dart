class ApiClientModel {
  final int? statusCode;
  final dynamic response;
  final bool isSuccess;

  ApiClientModel(
      {required this.statusCode,
      required this.response,
      required this.isSuccess});
}
