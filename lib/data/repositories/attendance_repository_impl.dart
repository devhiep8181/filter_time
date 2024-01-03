import 'package:flutter_app/data/datasource/attendance_remote_datasource.dart';
import 'package:flutter_app/domain/entites/attendance_entity.dart';
import 'package:flutter_app/domain/entites/daily_attendance_report_entity.dart';
import 'package:flutter_app/domain/repositories/attendance_repository.dart';

class AttendanceRepositoryImpl implements AttendanceRepository {
  final AttendanceRemoteDatasoure attendanceRemoteDatasoure;

  AttendanceRepositoryImpl({required this.attendanceRemoteDatasoure});


  @override
  Future<List<DailyAttendanceReportEntity>> getDailyAttendanceReportList({
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    return await attendanceRemoteDatasoure.getDailyAttendanceReportList(
        startDate: startDate, endDate: endDate);
  }


}
