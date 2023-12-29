import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_app/domain/entites/daily_attendance_report_entity.dart';
import 'package:flutter_app/domain/usecases/attendance/get_daily_attendance_report_use_case.dart';

part 'attendence_report_event.dart';
part 'attendence_report_state.dart';

class AttendenceReportBloc
    extends Bloc<AttendenceReportInitEvent, AttendenceReportState> {
  GetDailyAttendanceReportUseCase getDailyAttendanceReportUseCase;

  AttendenceReportBloc({required this.getDailyAttendanceReportUseCase})
      : super(AttendenceReportInitial()) {
    on<AttendenceReportInitEvent>(_onShowAttendenceReport);
    //on<FilterTimeAttenceEvent>(_onFilterTimeAttenceEvent);
  }

  FutureOr<void> _onShowAttendenceReport(AttendenceReportInitEvent event,
      Emitter<AttendenceReportState> emit) async {
    try {
      emit(AttendenceReporLoading());
      final result = await getDailyAttendanceReportUseCase.call(
          GetDailyAttendanceReportParameter(
              startDate: DateTime(2020), endDate: DateTime(2024)));
      emit(AttendenceReportFinishedState(listAttendanceReport: result));
    } catch (e) {
      print(e.toString());
      emit(AttendenceReporError(error: e.toString()));
    }
  }

  FutureOr<void> _onFilterTimeAttenceEvent(
      FilterTimeAttenceEvent event, Emitter<AttendenceReportState> emit) {}
}
