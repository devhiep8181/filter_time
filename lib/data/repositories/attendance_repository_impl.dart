import 'package:flutter_app/data/datasource/attendance_remote_datasource.dart';
import 'package:flutter_app/domain/entites/attendance_entity.dart';
import 'package:flutter_app/domain/entites/daily_attendance_report_entity.dart';
import 'package:flutter_app/domain/repositories/attendance_repository.dart';

class AttendanceRepositoryImpl implements AttendanceRepository {
  final AttendanceRemoteDatasoure attendanceRemoteDatasoure;

  AttendanceRepositoryImpl({required this.attendanceRemoteDatasoure});

  @override
  Future<dynamic> attend({
    required final num longitude,
    required final num latitude,
    required final num distance,
    required final num? timeSheetId,
  }) async {
    return await attendanceRemoteDatasoure.attend(
        longitude: longitude,
        latitude: latitude,
        distance: distance,
        timeSheetId: timeSheetId);
  }

  @override
  Future<List<DailyAttendanceReportEntity>> getDailyAttendanceReportList({
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    return await attendanceRemoteDatasoure.getDailyAttendanceReportList(
        startDate: startDate, endDate: endDate);
  }

  @override
  Future<List<AttendanceEntity>> getAttendanceScheduleList({
    required DateTime startDate,
    required DateTime endDate,
    required num? timeSheetId,
  }) async {
    return await attendanceRemoteDatasoure.getAttendanceList(
        startDate: startDate, endDate: endDate, timeSheetId: timeSheetId);
  }
}
