import 'package:flutter_app/core/api_pramater.dart';
import 'package:flutter_app/core/data/base_remote_datasource.dart';
import 'package:flutter_app/data/models/user_model.dart';
import 'package:flutter_app/domain/entites/user.dart';

abstract class SignInRemoteDataSource {
  Future<User> signIn({
    required String tenantCode,
    required String username,
    required String password,
  });
}

class SignInRemoteDataSourceImpl extends BaseRemoteDataSourceImpl
    implements SignInRemoteDataSource {
  final String appKey;
  SignInRemoteDataSourceImpl({required this.appKey});

  @override
  Future<User> signIn(
      {required String tenantCode,
      required String username,
      required String password}) async {
    final bodyData = {
      'username': username,
      'password': password,
      'tenantcode': tenantCode,
      'key_app': appKey,
    };
    final data = await performPostRequest(url: loginUriBase, data: bodyData);
    return UserModel.fromMap(data);
  }
}
