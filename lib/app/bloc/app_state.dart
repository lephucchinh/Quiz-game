part of 'app_bloc.dart';

class AppState extends Equatable {
   const AppState._( { required this.check,required this.diem,required this.time});

   const AppState.Initial( {this.check = false ,this.diem = 0, this.time = 0});

   final int time;
   final int diem;
   final bool check;
   AppState copyWith({int? time , int? diem , bool? check, bool? end}) {
    return AppState._(
      time: time ?? this.time,
      diem: diem ?? this.diem,
      check: check ?? this.check,
    );
  }

  @override
  List<Object?> get props => [time,diem,check,];
}
