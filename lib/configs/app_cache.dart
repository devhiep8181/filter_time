import 'dart:convert';

import 'package:flutter_app/domain/entites/user.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AppCache {
  final SharedPreferences sharedPreferences;

  const AppCache(this.sharedPreferences);

  get user => User.fromMap(
        json.decode(getString("CACHED_USER")!),
      );

  get token => user.token;

  get tokenPhp => user.tokenPhp;

  Future<void> setString(String key, String value) async =>
      await sharedPreferences.setString(key, value);

  String? getString(String key) => sharedPreferences.getString(key);

  void removeString(String key) async => await sharedPreferences.remove(key);
}