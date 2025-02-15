import 'package:equatable/equatable.dart';

abstract class TimerEvent extends Equatable {
  const TimerEvent();

  @override
  List<Object?> get props => [];
}

class StartTimerEvent extends TimerEvent {
  final int duration;

  const StartTimerEvent(this.duration);

  @override
  List<Object?> get props => [duration];
}

class ResendCodeEvent extends TimerEvent {
  final int duration;

  const ResendCodeEvent(this.duration);

  @override
  List<Object?> get props => [duration];
}
