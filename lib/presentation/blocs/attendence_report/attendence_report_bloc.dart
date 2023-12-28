import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_app/domain/entites/daily_attendance_report_entity.dart';
import 'package:flutter_app/domain/usecases/attendance/get_daily_attendance_report_use_case.dart';

part 'attendence_report_event.dart';
part 'attendence_report_state.dart';

class AttendenceReportBloc
    extends Bloc<AttendenceReportEvent, AttendenceReportState> {
  GetDailyAttendanceReportUseCase getDailyAttendanceReportUseCase;

  AttendenceReportBloc({required this.getDailyAttendanceReportUseCase})
      : super(const AttendenceReportState(
            attendenceReportStatus: AttendenceReportStatus.initial,
            listAttendanceReport: [])) {
    on<ShowAttendenceReportEvent>(_onShowAttendenceReport);
  }
  
  Future<void> _onShowAttendenceReport(ShowAttendenceReportEvent event,
      Emitter<AttendenceReportState> emit) async {
    try {
      emit(state.copyWith(
          attendenceReportStatus: AttendenceReportStatus.loading));
      final result = await getDailyAttendanceReportUseCase.call(
          GetDailyAttendanceReportParameter(
              startDate: DateTime(2020), endDate: DateTime(2024)));
      print(result);
      emit(state.copyWith(
          attendenceReportStatus: AttendenceReportStatus.success,
          listAttendanceReport: result));
    } catch (e) {
      emit(
          state.copyWith(attendenceReportStatus: AttendenceReportStatus.error));
    }
  }
}
