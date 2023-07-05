part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();
}

// sự kiện tính thời gian
class StartTimer extends AppEvent {
  @override
  List<Object?> get props => [];
}

class PauseTimer extends AppEvent {
  @override
  List<Object?> get props => [];
}

class ResetTimer extends AppEvent {
  @override
  List<Object?> get props => [];
}

class TickTimer extends AppEvent {
  @override
  List<Object?> get props => [];
}

// sự kiện chọn đáp án trong quiz
class SumAnsewr extends AppEvent {
  @override
  List<Object?> get props => [];
}

class ResetAnsewr extends AppEvent {
  @override
  List<Object?> get props => [];
}

// sự kiện check đáp án được chọn đúng hay sai
class CheckAnsewrTrue extends AppEvent {
  @override
  List<Object?> get props => [];
}

class CheckAnsewrFalse extends AppEvent {
  @override
  List<Object?> get props => [];
}

// sự kiện chọn đáp án để chuyển sang câu khác


