part of 'attendence_report_bloc.dart';

enum AttendenceReportStatus { initial, loading, success, error }

extension AttendenceReportStautsX on AttendenceReportStatus {
  bool get isLoading => [AttendenceReportStatus.loading].contains(this);
  bool get isSucces => [AttendenceReportStatus.success].contains(this);
}

class AttendenceReportState extends Equatable {
  final AttendenceReportStatus attendenceReportStatus;
  final List<DailyAttendanceReportEntity> listAttendanceReport;

  const AttendenceReportState({
    required this.attendenceReportStatus,
    required this.listAttendanceReport,
  });

  @override
  List<Object?> get props => [attendenceReportStatus, listAttendanceReport];

  AttendenceReportState copyWith({
    AttendenceReportStatus? attendenceReportStatus,
    List<DailyAttendanceReportEntity>? listAttendanceReport,
  }) {
    return AttendenceReportState(
      attendenceReportStatus:
          attendenceReportStatus ?? this.attendenceReportStatus,
      listAttendanceReport: listAttendanceReport ?? this.listAttendanceReport,
    );
  }
}
