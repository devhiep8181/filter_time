part of 'sign_in_bloc.dart';


abstract class SignInState extends Equatable {
  const SignInState();

  @override
  List<Object> get props => [];
}

class SignInInitialState extends SignInState {}

class SignInLoadingState extends SignInState {}

class SignInErrorState extends SignInState {
  final String message;

  const SignInErrorState({required this.message});

  @override
  List<Object> get props => [message];
}

class SignInLoadedState extends SignInState {
  final User user;

  const SignInLoadedState({required this.user});

  @override
  List<Object> get props => [user];
}
