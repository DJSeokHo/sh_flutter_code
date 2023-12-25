import 'package:flutter/material.dart';
import '../../framework/debug/i_log.dart';
import 'package:http/http.dart';
import 'package:dio/dio.dart';


class IX_FetchingData {

  static const tag = "IX_FetchingData";

  void fetchDataTest() async {
    /**
     * 可能遇到奇葩错误，
     * flutter\bin\cache flutter_tools.stamp 파일 삭제
     * flutter/packages/flutter_tools/lib/src/web 이동
     * chrome.dart 파일 수정
     * --disable-extensions 아래에 --disable-web-security 입력
     */
    ILog.debug(tag, 'fetchDataTest');

    var client = Client();

    var urlString = "34.64.141.125"; // 纯域名，不要加协议头
    var url = Uri.https(urlString);
    final response = await client.get(url);
    ILog.debug(tag, response.body);
  }

  void fetchDataTestWithDIO() async {

    try {
      var response = await Dio().get('https://34.64.141.125');
      // response = await dio.get('/test', queryParameters: {'id': 12, 'name': 'wendu'});
      ILog.debug(tag, "fetchDataTestWithDIO ${response.data.toString()}");
    }
    catch (e) {
      ILog.debug(tag, e);
    }
  }
}

void main() {

  IX_FetchingData fetchingData = IX_FetchingData();
  fetchingData.fetchDataTest();
  fetchingData.fetchDataTestWithDIO();
}