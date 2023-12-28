part of 'attendence_report_bloc.dart';

abstract class AttendenceReportEvent extends Equatable {
  const AttendenceReportEvent();
  @override
  List<Object?> get props => [];
}

class ShowAttendenceReportEvent extends AttendenceReportEvent {
  final List<DailyAttendanceReportEntity> listAttendanceReport;

  const ShowAttendenceReportEvent({
    required this.listAttendanceReport,
  });

  @override
  List<Object?> get props => [listAttendanceReport];
}
