import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_app/core/error/failures.dart';
import 'package:flutter_app/domain/entites/user.dart';
import 'package:flutter_app/domain/usecases/sign_in/sign_in_usecase.dart';
import 'package:flutter_app/presentation/blocs/auth/auth_bloc.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final SignInUsecase signInUsecase;
  final AuthBloc authBloc;
  SignInBloc({required this.signInUsecase, required this.authBloc})
      : super(SignInInitialState()) {
    on<SignInSubmit>(_onSignInSubmit);
  }

  FutureOr<void> _onSignInSubmit(
      SignInSubmit event, Emitter<SignInState> emit) async {
    try {
      emit(SignInLoadingState());
      final result = await signInUsecase(SignInParams(
          useName: event.username,
          passWord: event.password,
          tenantCode: event.tenantCode));

      emit(_mapResult(result));
    } catch (e) {
      emit(SignInErrorState(message: e.toString()));
    }
  }

  SignInState _mapResult(Either<Failure, User> result) => result.fold(
          (failure) => failure is OfflineFailure
              ? const SignInErrorState(message: "Không có kết nối internet")
              : const SignInErrorState(message: "Lỗi"), (succes) {
        authBloc.add(SignedIn(user: succes));
        return SignInLoadedState(user: succes);
      });
}
