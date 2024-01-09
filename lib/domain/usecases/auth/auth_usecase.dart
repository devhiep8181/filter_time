import 'package:dartz/dartz.dart';
import 'package:flutter_app/core/error/failures.dart';
import 'package:flutter_app/core/usecase/usecase.dart';
import 'package:flutter_app/data/models/user_model.dart';
import 'package:flutter_app/domain/repositories/auth/auth_repository.dart';

class AuthUsecase implements UseCase<UserModel, NoParams> {
  final AuthRepository repository;
  AuthUsecase({
    required this.repository,
  });
  @override
  Future<Either<Failure, UserModel>> call(NoParams param) async {
    return await repository.verifyToken();
  }
}
