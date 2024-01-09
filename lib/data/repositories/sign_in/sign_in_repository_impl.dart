import 'package:dartz/dartz.dart';
import 'package:flutter_app/core/error/exception.dart';
import 'package:flutter_app/core/error/failures.dart';
import 'package:flutter_app/core/networks/network_info.dart';
import 'package:flutter_app/data/datasource/sign_in/sign_in_remote_datasource.dart';
import 'package:flutter_app/domain/entites/user.dart';
import 'package:flutter_app/domain/repositories/sign_in/sign_in_repository.dart';

class SignInRepositoryImpl implements SignInRepository {
  final SignInRemoteDataSource signInRemoteDataSource;
  final NetworkInfo networkInfo;

  SignInRepositoryImpl({
    required this.signInRemoteDataSource,
    required this.networkInfo,
  });
  @override
  Future<Either<Failure, User>> signIn(
      {required String tenantCode,
      required String username,
      required String password}) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteData = await signInRemoteDataSource.signIn(
            tenantCode: tenantCode, username: username, password: password);
        return Right(remoteData);
      } on ServerException catch (error) {
        return Left(ServerFailure(message: error.message));
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
