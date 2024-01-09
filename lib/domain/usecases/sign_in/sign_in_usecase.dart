import 'package:dartz/dartz.dart';
import 'package:flutter_app/core/error/failures.dart';
import 'package:flutter_app/core/usecase/usecase.dart';
import 'package:flutter_app/domain/entites/user.dart';
import 'package:flutter_app/domain/repositories/sign_in/sign_in_repository.dart';

class SignInUsecase extends UseCase<User, SignInParams> {
  final SignInRepository repository;
  SignInUsecase({
    required this.repository,
  });
  @override
  Future<Either<Failure, User>> call(SignInParams param) async {
    return await repository.signIn(
        tenantCode: param.tenantCode,
        username: param.useName,
        password: param.passWord);
  }
}

class SignInParams {
  final String useName;
  final String passWord;
  final String tenantCode;
  SignInParams({
    required this.useName,
    required this.passWord,
    required this.tenantCode,
  });
}
