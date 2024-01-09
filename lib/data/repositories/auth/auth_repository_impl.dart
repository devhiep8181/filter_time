import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:flutter_app/core/error/exception.dart';
import 'package:flutter_app/core/error/failures.dart';
import 'package:flutter_app/core/networks/network_info.dart';
import 'package:flutter_app/data/datasource/auth/auth_remote_datasource.dart';
import 'package:flutter_app/data/models/user_model.dart';
import 'package:flutter_app/domain/repositories/auth/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSoure authRemoteDataSoure;
  final NetworkInfo networkInfo;
  const AuthRepositoryImpl({
    required this.authRemoteDataSoure,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, UserModel>> verifyToken() async {
    if (await networkInfo.isConnected) {
      try {
        final result = await authRemoteDataSoure.verifyToken();
        return Right(result);
      } on ServerException catch (error) {
        return Left(ServerFailure(message: error.message));
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
