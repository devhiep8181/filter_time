import 'package:equatable/equatable.dart';

abstract class UseCase<Type, Parameter> {
  Future<Type> call(Parameter param);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}