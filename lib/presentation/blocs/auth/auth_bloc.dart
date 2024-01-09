import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_app/configs/app_cache.dart';
import 'package:flutter_app/core/constant/constant.dart';
import 'package:flutter_app/core/usecase/usecase.dart';
import 'package:flutter_app/domain/entites/user.dart';
import 'package:flutter_app/domain/usecases/auth/auth_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthUsecase verifyToken;
  final AppCache appCache;

  AuthBloc({required this.verifyToken, required this.appCache})
      : super(const AuthState.unknown()) {
    on<AppStarted>(_onAppStarted);
    on<SignedIn>(_onSignedIn);
    on<SignedOut>(_onSingedOut);
  }

  FutureOr<void> _onAppStarted(
      AppStarted event, Emitter<AuthState> emit) async {
    try {
      if (appCache.getString(cachedUserKey) == null) {
        emit(const AuthState.unauthenticated());
        return;
      }
      final result = await verifyToken(NoParams());
      result.fold((failure) => emit(const AuthState.unauthenticated()),
          (success) => emit(AuthState.authenticated(user: success)));
    } catch (e) {
      emit(const AuthState.unauthenticated());
    }
  }

  FutureOr<void> _onSignedIn(SignedIn event, Emitter<AuthState> emit) {
    emit(AuthState.authenticated(user: event.user));
  }

  FutureOr<void> _onSingedOut(event, Emitter<AuthState> emit) {
    emit(const AuthState.unauthenticated());
  }
}
