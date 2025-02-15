import 'package:equatable/equatable.dart';

abstract class TimerState extends Equatable {
  const TimerState();

  @override
  List<Object?> get props => [];
}

class TimerInitial extends TimerState {}

class TimerRunning extends TimerState {
  final int remainingTime;

  const TimerRunning(this.remainingTime);

  @override
  List<Object?> get props => [remainingTime];
}

class TimerFinished extends TimerState {}
