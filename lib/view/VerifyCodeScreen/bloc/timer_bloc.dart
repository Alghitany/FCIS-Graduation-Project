import 'package:flutter_bloc/flutter_bloc.dart';
import 'timer_event.dart';
import 'timer_states.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  TimerBloc() : super(TimerInitial()) {
    on<StartTimerEvent>(_onStartTimer);
    on<ResendCodeEvent>(_onResendCode);
  }

  Future<void> _onStartTimer(
      StartTimerEvent event, Emitter<TimerState> emit) async {
    emit(TimerRunning(event.duration));
    for (int i = event.duration; i >= 0; i--) {
      await Future.delayed(const Duration(seconds: 1));
      if (i > 0) {
        emit(TimerRunning(i));
      } else {
        emit(TimerFinished());
      }
    }
  }

  void _onResendCode(ResendCodeEvent event, Emitter<TimerState> emit) {
    add(StartTimerEvent(event.duration));
  }
}
