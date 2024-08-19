import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<LoadingState> {
  SplashCubit() : super(LoadingState(0));

  void startProgress() {
    const duration = Duration(milliseconds: 60);
    int progress = 0;
    Timer.periodic(duration, (timer) {
      if (progress < 100) {
        progress += 1;
        emit(LoadingState(progress));
      } else {
        timer.cancel();
      }
    });
  }
}
