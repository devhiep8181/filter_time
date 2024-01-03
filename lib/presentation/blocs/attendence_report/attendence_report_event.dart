part of 'attendence_report_bloc.dart';

abstract class AttendenceReportEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AttendenceReportInitEvent extends AttendenceReportEvent {}

class ShowAttendenceReportEvent extends AttendenceReportEvent {
  final List<DailyAttendanceReportEntity> listAttendanceReport;
  final DateTime? date;

  ShowAttendenceReportEvent({
    required this.listAttendanceReport,
    required this.date,
  });

  @override
  List<Object?> get props => [listAttendanceReport, date];
}

class FilterTimeAttenceEvent extends AttendenceReportEvent {
  final DateTime? date;
  final DateTimeRange? week;
  final String chooseFilter;
  FilterTimeAttenceEvent({required this.date, required this.chooseFilter, this.week});
}
