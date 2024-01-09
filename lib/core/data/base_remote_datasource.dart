import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_app/core/api_pramater.dart';
import 'package:flutter_app/core/error/exception.dart';
import 'package:flutter_app/core/networks/base_response_model.dart';
import 'package:http/http.dart' as http;

abstract class BaseRemoteDataSource {
  @protected
  Future<dynamic> performPostRequest(
      {String serverAddress = baseApi,
      required String url,
      required Map<String, dynamic> data,
      String? token});

  @protected
  Future<dynamic> performGetRequest(
      {String serverAddress = baseApi, required String url, String? token});
}

class BaseRemoteDataSourceImpl extends BaseRemoteDataSource {
  @override
  Future performPostRequest(
      {String serverAddress = baseApi,
      required String url,
      required Map<String, dynamic> data,
      String? token,
      bool fullRespone = false}) async {
    try {
      final res = await http.post(Uri.parse(baseApi + url),
          headers: getHeaders(token: token), body: json.encode(data));
      BaseResponseModel jsonRespone = BaseResponseModel.fromJson(res.body);
      if (res.statusCode == 200) {
        if (jsonRespone.statusCode > 200) {
          throw ServerException(jsonRespone.message);
        } else {
          return fullRespone ? jsonRespone : jsonRespone.data;
        }
      } else {
        throw ServerException(jsonRespone.message);
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future performGetRequest(
      {String serverAddress = baseApi,
      required String url,
      String? token,
      bool fullResponse = false}) async {
    try {
      final res = await http.get(
        Uri.parse(baseApi + url),
        headers: getHeaders(token: token),
      );
      BaseResponseModel jsonResponse = BaseResponseModel.fromJson(res.body);
      if (res.statusCode == 200) {
        if (jsonResponse.statusCode > 0) {
          throw ServerException(jsonResponse.message);
        } else {
          return fullResponse ? jsonResponse : jsonResponse.data;
        }
      } else {
        throw ServerException(jsonResponse.message);
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
