import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:mutqin/core/networking/api_endpoints.dart';

class DioFactory {
  static Dio? dio;

  static initDio() {
    dio ??= Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response?> getData({
    required String endpoint,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
  }) async {
    try {
      Response response = await dio!.get(
        endpoint,
        queryParameters: query,
        options: Options(headers: headers),
      );
      return response;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<Response?> postData({
    required String endpoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
  }) async {
    try {
      Response response = await dio!.post(
        endpoint,
        data: data,
        queryParameters: query,
        options: Options(headers: headers),
      );
      return response;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<Response?> putData({
    required String endpoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
  }) async {
    try {
      Response response = await dio!.put(
        endpoint,
        data: data,
        queryParameters: query,
        options: Options(headers: headers),
      );
      return response;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<Response?> patchData({
    required String endpoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
  }) async {
    try {
      Response response = await dio!.patch(
        endpoint,
        data: data,
        queryParameters: query,
        options: Options(headers: headers),
      );
      return response;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<Response?> deleteData({
    required String endpoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
  }) async {
    try {
      Response response = await dio!.delete(
        endpoint,
        data: data,
        queryParameters: query,
        options: Options(headers: headers),
      );
      return response;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
