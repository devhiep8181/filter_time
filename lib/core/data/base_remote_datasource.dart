import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/core/api_pramater.dart';
import 'package:flutter_app/core/error/exception.dart';
import 'package:http/http.dart' as http;
import '../networks/base_response_model.dart';



abstract class BaseRemoteDataSource {
  @protected
  Future<dynamic> performPostRequest({
    String serverAddress = baseApi,
    required String url,
    required Map<String, dynamic> data,
    String? token,
  });

  @protected
  Future<dynamic> performGetRequest({
    String serverAddress = baseApi,
    required String url,
    String? token,
  });
}

class BaseRemoteDataSourceImpl extends BaseRemoteDataSource {
  @override
  Future<dynamic> performPostRequest({
    String serverAddress = baseApi,
    required String url,
    Map<String, dynamic>? data,
    String? token,
    bool fullResponse = false,
  }) async {
    try {
      final http.Response res = await http.post(
        Uri.parse('$serverAddress$url'),
        headers: getHeaders(token: token),
        body: data != null ? jsonEncode(data) : null,
      );

      BaseResponseModel jsonResponse = BaseResponseModel.fromJson(res.body);

      if (res.statusCode == 200) {
        if (jsonResponse.statusCode > 0) {
          throw ServerException(jsonResponse.message);
        } else {
          return fullResponse ? jsonResponse : jsonResponse.data;
        }
      } else {
        print(jsonResponse.message);
        throw ServerException(jsonResponse.message);
      }
    } catch (e) {
      print(e.toString());
      throw ServerException(e.toString());
    }
  }

  @override
  Future<dynamic> performGetRequest({
    String serverAddress = baseApi,
    required String url,
    String? token,
    bool fullResponse = false,
  }) async {
    try {
      final http.Response res = await http.get(
        Uri.parse('$serverAddress/$url'),
        headers: getHeaders(token: token),
      );

      BaseResponseModel jsonResponse = BaseResponseModel.fromJson(res.body);

      if (res.statusCode == 200) {
        if (jsonResponse.statusCode > 0) {
          throw ServerException(jsonResponse.message);
        } else {
          return fullResponse ? jsonResponse : jsonResponse.data!;
        }
      } else {
        print(jsonResponse.message);
        throw ServerException(jsonResponse.message);
      }
    } catch (e) {
      print(e.toString());
      throw ServerException(e.toString());
    }
  }
}
