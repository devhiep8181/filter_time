part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AppStarted extends AuthEvent {}

class SignedIn extends AuthEvent {
  final User user;
  const SignedIn({
    required this.user,
  });
  @override
  List<Object> get props => [user];
}

class SignedOut extends AuthEvent{}