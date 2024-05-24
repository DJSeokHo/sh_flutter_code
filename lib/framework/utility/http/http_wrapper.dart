import 'package:dio/dio.dart';

import '../../debug/i_log.dart';

class HttpWrapper {

  static const _tag = "HttpWrapper";

  static dynamic get(String url, {Map<String, dynamic>? header}) async {
    Response<dynamic> response = await Dio().request(
        url,
        // data: jsonEncode(jsonData),
        options: Options(
            headers: header,
            method: "GET",
            responseType: ResponseType.json,
            sendTimeout: const Duration(seconds: 10),
            receiveTimeout: const Duration(seconds: 10)
        )
    );

    ILog.debug(_tag, response.data.toString());

    return response.data;
  }

  static dynamic post(String url, Map<String, dynamic> header, FormData formData) async {

    Response<dynamic> response = await Dio().request(
        url,
        data: formData,
        options: Options(
            headers: header,
            method: "POST",
            contentType: Headers.multipartFormDataContentType,
            responseType: ResponseType.json,
            sendTimeout: const Duration(seconds: 10),
            receiveTimeout: const Duration(seconds: 10)
        )
    );

    ILog.debug(_tag, response.data.toString());

    return response.data;
  }

  static dynamic put(String url, Map<String, dynamic> header, FormData formData) async {

    Response<dynamic> response = await Dio().request(
        url,
        data: formData,
        options: Options(
            headers: header,
            method: "PUT",
            contentType: Headers.multipartFormDataContentType,
            responseType: ResponseType.json,
            sendTimeout: const Duration(seconds: 10),
            receiveTimeout: const Duration(seconds: 10)
        )
    );

    ILog.debug(_tag, response.data.toString());

    return response.data;
  }

  static dynamic delete(String url, Map<String, dynamic> header, {FormData? formData}) async {

    Response<dynamic> response = await Dio().request(
        url,
        data: formData,
        options: Options(
            headers: header,
            method: "DELETE",
            responseType: ResponseType.json,
            sendTimeout: const Duration(seconds: 10),
            receiveTimeout: const Duration(seconds: 10)
        )
    );

    ILog.debug(_tag, response.data.toString());

    return response.data;
  }
}