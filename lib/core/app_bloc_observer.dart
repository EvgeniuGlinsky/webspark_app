// ignore_for_file: strict_raw_type

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);

    debugPrint('AppBlocObserver onCreate -- ${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);

    debugPrint(
        'AppBlocObserver onChange -- ${bloc.runtimeType}, ${change.currentState}');
    debugPrint(
        'AppBlocObserver onChange -- ${bloc.runtimeType}, ${change.nextState}');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    debugPrint('AppBlocObserver onError -- ${bloc.runtimeType}, $error');

    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
  }
}
