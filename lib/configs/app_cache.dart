import 'dart:convert';

import 'package:flutter_app/core/constant/constant.dart';
import 'package:flutter_app/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppCache {
  final SharedPreferences sharedPreferences;

  AppCache({required this.sharedPreferences});

  get user =>
      UserModel.fromMapDataSource(json.decode(getString(cachedUserKey)!));

  get token => user.token;

  get tokenPhp => user.tokenPhp;

  Future<void> setString(String key, String value) async =>
      await sharedPreferences.setString(key, value);

  String? getString(String key) => sharedPreferences.getString(key);

  void removeString(String key) async => await sharedPreferences.remove(key);
}
