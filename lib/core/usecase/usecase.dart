import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_app/core/error/failures.dart';

abstract class UseCase<Type, Parameter> {
  Future<Either<Failure, Type>> call(Parameter param);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}