import 'dart:convert';

import 'package:clean_archtecture_repository/common/client/api_client_model.dart';
import 'package:dio/dio.dart';

class ApiClient {
  final Dio _dio = Dio();
  Map<String, dynamic> header = {};

  /// Get
  Future<ApiClientModel> getMethod(
      {required String path,
      required bool isHeader,
       Map<String, dynamic>? body}) async {
    try {
      final response = await _dio.get(
        path,
        data: jsonEncode(body ?? {}),
        options: Options(
          headers: isHeader ? header : null,
        ),
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return ApiClientModel(
          statusCode: response.statusCode,
          response: response.data,
          isSuccess: true,
        );
      }

      return ApiClientModel(
        statusCode: response.statusCode,
        response: response.data,
        isSuccess: false,
      );
    } on DioError catch (e) {
      return ApiClientModel(
        statusCode: e.response!.statusCode,
        response: e.message,
        isSuccess: false,
      );
    }
  }

  /// Put
  Future<ApiClientModel> putMethod(
      {required String path,
      required bool isHeader,
       Map<String, dynamic>? body}) async {
    try {
      final response = await _dio.put(
        path,
        data: jsonEncode(body ?? {}),
        options: Options(
          headers: isHeader ? header : null,
        ),
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return ApiClientModel(
          statusCode: response.statusCode,
          response: response.data,
          isSuccess: true,
        );
      }

      return ApiClientModel(
        statusCode: response.statusCode,
        response: response.data,
        isSuccess: false,
      );
    } on DioError catch (e) {
      return ApiClientModel(
        statusCode: e.response?.statusCode,
        response: e.message,
        isSuccess: false,
      );
    }
  }

  /// Patch
  Future<ApiClientModel> patchMethod(
      {required String path,
      required bool isHeader,
       Map<String, dynamic>? body}) async {
    try {
      final response = await _dio.patch(
        path,
        data: jsonEncode(body ?? {}),
        options: Options(
          headers: isHeader ? header : null,
        ),
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return ApiClientModel(
          statusCode: response.statusCode,
          response: response.data,
          isSuccess: true,
        );
      }

      return ApiClientModel(
        statusCode: response.statusCode,
        response: response.data,
        isSuccess: false,
      );
    } on DioError catch (e) {
      return ApiClientModel(
        statusCode: e.response?.statusCode,
        response: e.message,
        isSuccess: false,
      );
    }
  }

  /// Delete
  Future<ApiClientModel> deleteMethod(
      {required String path,
      required bool isHeader,
       Map<String, dynamic>? body}) async {
    try {
      final response = await _dio.delete(
        path,
        data: jsonEncode(body ?? {}),
        options: Options(
          headers: isHeader ? header : null,
        ),
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return ApiClientModel(
          statusCode: response.statusCode,
          response: response.data,
          isSuccess: true,
        );
      }

      return ApiClientModel(
        statusCode: response.statusCode,
        response: response.data,
        isSuccess: false,
      );
    } on DioError catch (e) {
      return ApiClientModel(
        statusCode: e.response?.statusCode,
        response: e.message,
        isSuccess: false,
      );
    }
  }
}
