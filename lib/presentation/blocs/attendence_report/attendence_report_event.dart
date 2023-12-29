part of 'attendence_report_bloc.dart';

abstract class AttendenceReportEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AttendenceReportInitEvent extends AttendenceReportEvent {}

class ShowAttendenceReportEvent extends AttendenceReportEvent {
  final List<DailyAttendanceReportEntity> listAttendanceReport;

  ShowAttendenceReportEvent({
    required this.listAttendanceReport,
  });

  @override
  List<Object?> get props => [listAttendanceReport];
}

class FilterTimeAttenceEvent extends AttendenceReportEvent {
  final DateTime? date;
  FilterTimeAttenceEvent({
    required this.date,
  });
}
