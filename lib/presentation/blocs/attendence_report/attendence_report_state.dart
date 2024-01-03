part of 'attendence_report_bloc.dart';

enum AttendenceReportStatus { initial, loading, success, error }

extension AttendenceReportStautsX on AttendenceReportStatus {
  bool get isLoading => [AttendenceReportStatus.loading].contains(this);
  bool get isSucces => [AttendenceReportStatus.success].contains(this);
  bool get isError => [AttendenceReportStatus.error].contains(this);
}

class AttendenceReportState extends Equatable {
  const AttendenceReportState({required this.status, required this.listAttendanceReport});
  final AttendenceReportStatus status;
  final List<DailyAttendanceReportEntity> listAttendanceReport;
  @override
  List<Object> get props => [status, listAttendanceReport];

  AttendenceReportState copyWith({
    AttendenceReportStatus? status,
    List<DailyAttendanceReportEntity>? listAttendanceReport,
  }) {
    return AttendenceReportState(
      status: status ?? this.status,
      listAttendanceReport: listAttendanceReport ?? this.listAttendanceReport,
    );
  }
}

