import 'dart:convert';

import 'package:flutter_app/core/api_pramater.dart';
import 'package:flutter_app/core/error/exception.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_app/configs/app_cache.dart';
import 'package:flutter_app/data/models/user_model.dart';

import 'package:http/http.dart' as http;

abstract class AuthRemoteDataSoure {
  Future<UserModel> verifyToken();
}

class AuthRemoteDataSoureImpl implements AuthRemoteDataSoure {
  final SharedPreferences sharedPreferences;
  final AppCache appCache;

  AuthRemoteDataSoureImpl({
    required this.sharedPreferences,
    required this.appCache,
  });

  @override
  Future<UserModel> verifyToken() async {
    try {
      UserModel user = appCache.user;
      final res = await http.get(
        Uri.parse(baseApi + checkTokenUrl),
        headers: getHeaders(token: user.tokenPhp),
      );

      final jsonRes = json.decode(res.body);
      if (res.statusCode == 200) {
        if (jsonRes['status_code'] != null && jsonRes['status_code'] > 0) {
          throw ServerException(jsonRes['message']);
        } else {
          return user;
        }
      } else {
        throw ServerException(jsonRes['message']);
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
