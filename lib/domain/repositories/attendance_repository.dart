import 'package:flutter_app/domain/entites/daily_attendance_report_entity.dart';

abstract class AttendanceRepository {
  Future<List<DailyAttendanceReportEntity>> getDailyAttendanceReportList({
    required DateTime startDate,
    required DateTime endDate,
  });
}