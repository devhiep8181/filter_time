part of 'sign_in_bloc.dart';

abstract class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object> get props => [];
}

class SignInSubmit extends SignInEvent {
  final String tenantCode;
  final String username;
  final String password;

  const SignInSubmit({
    required this.tenantCode,
    required this.username,
    required this.password,
  });

  @override
  List<Object> get props => [tenantCode, username, password];
}
