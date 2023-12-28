
import 'package:flutter_app/domain/entites/attendance_entity.dart';
import 'package:flutter_app/domain/entites/daily_attendance_report_entity.dart';

abstract class AttendanceRepository {
  Future<dynamic> attend({
    required final num longitude,
    required final num latitude,
    required final num distance,
    required final num? timeSheetId,
  });

  Future<List<DailyAttendanceReportEntity>> getDailyAttendanceReportList({
    required DateTime startDate,
    required DateTime endDate,
  });

  Future<List<AttendanceEntity>> getAttendanceScheduleList({
    required DateTime startDate,
    required DateTime endDate,
    required num? timeSheetId,
  });
}