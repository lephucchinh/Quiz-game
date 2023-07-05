import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super( AppState.Initial()) {
    on<StartTimer>(_onStartTimer);
    on<PauseTimer>(_onPauseTimer);
    on<ResetTimer>(_onResetTimer);
    on<TickTimer>(_onTickTimer);
    on<SumAnsewr>(_onSumAnsew);
    on<ResetAnsewr>(_onResetAnsew);
    on<CheckAnsewrTrue>(_onCheckAnsewrTrue);
    on<CheckAnsewrFalse>(_onCheckAnsewrFalse);
  }

  int tongdiem = 0;
  late Timer _timer;
  int _duration = 0;
  late bool checkAnsewr ;

  _onStartTimer (StartTimer event , Emitter<AppState> emit) {
    _timer = Timer.periodic(Duration(milliseconds: 1), (Timer timer) {
      add(TickTimer());
      if((_duration/100) == 5){
        add(ResetTimer());
      }
    });
  }
  _onPauseTimer (PauseTimer event , Emitter<AppState> emit) {
    _timer.cancel();
  }
  _onResetTimer (ResetTimer event , Emitter<AppState> emit) {
    _timer.cancel();
    _duration = 0;
  }
  _onTickTimer (TickTimer event , Emitter<AppState> emit) {
    _duration++;
    emit(state.copyWith(time: _duration));
  }
  _onSumAnsew (SumAnsewr event, Emitter<AppState> emit) {
    tongdiem = tongdiem + 10;
    emit(state.copyWith(diem: tongdiem));
  }
  _onResetAnsew (ResetAnsewr event, Emitter<AppState> emit ) {
    tongdiem = 0;
    emit(state.copyWith(diem: tongdiem));
  }
  _onCheckAnsewrTrue (CheckAnsewrTrue event, Emitter<AppState> emit) {
    checkAnsewr = true;
    emit(state.copyWith(check: checkAnsewr));
  }
  _onCheckAnsewrFalse (CheckAnsewrFalse event, Emitter<AppState> emit) {
    checkAnsewr = false;
    emit(state.copyWith(check: checkAnsewr));
  }

}
