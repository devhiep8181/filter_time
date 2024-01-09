import 'package:dartz/dartz.dart';
import 'package:flutter_app/core/error/failures.dart';
import 'package:flutter_app/domain/entites/user.dart';

abstract class SignInRepository{
  Future<Either<Failure, User>> signIn({
    required String tenantCode,
    required String username,
    required String password,
  });
}