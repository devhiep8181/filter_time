import 'package:dartz/dartz.dart';
import 'package:flutter_app/core/error/failures.dart';
import 'package:flutter_app/data/models/user_model.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserModel>> verifyToken();
}
