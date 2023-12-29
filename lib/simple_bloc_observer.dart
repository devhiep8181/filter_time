import 'package:flutter_bloc/flutter_bloc.dart';



class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    // if (bloc.runtimeType != NavBarBloc) {
      print('${bloc.runtimeType} $event');
    // }
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    print('${bloc.runtimeType} $error');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    // print(transition);
  }
}
