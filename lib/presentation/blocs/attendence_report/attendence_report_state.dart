part of 'attendence_report_bloc.dart';

enum AttendenceReportStatus { initial, loading, success, error }

extension AttendenceReportStautsX on AttendenceReportStatus {
  bool get isLoading => [AttendenceReportStatus.loading].contains(this);
  bool get isSucces => [AttendenceReportStatus.success].contains(this);
}

class AttendenceReportState extends Equatable {
  const AttendenceReportState();

  @override
  List<Object> get props => [];
}

class AttendenceReportInitial extends AttendenceReportState {}

class AttendenceReporLoading extends AttendenceReportState {}

class AttendenceReportFinishedState extends AttendenceReportState {
  final List<DailyAttendanceReportEntity> listAttendanceReport;

  const AttendenceReportFinishedState({
    required this.listAttendanceReport,
  });

  @override
  List<Object> get props => [listAttendanceReport];

  AttendenceReportFinishedState copyWith({
    AttendenceReportStatus? attendenceReportStatus,
    List<DailyAttendanceReportEntity>? listAttendanceReport,
  }) {
    return AttendenceReportFinishedState(
      listAttendanceReport: listAttendanceReport ?? this.listAttendanceReport,
    );
  }
}

class AttendenceReporError extends AttendenceReportState {
  final String error;

  const AttendenceReporError({required this.error});

  @override
  List<Object> get props => [error];
}
