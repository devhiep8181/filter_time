import 'dart:convert';

import 'package:flutter_app/core/utils/formatter.dart';
import 'package:flutter_app/domain/entites/daily_attendance_report_entity.dart';

class DailyAttendanceReportModel extends DailyAttendanceReportEntity {
  DailyAttendanceReportModel(
      {super.workShiftId,
      super.workShiftName,
      super.employeeId,
      super.employeeName,
      super.shiftSalary,
      super.day,
      super.timeCheckin,
      super.timeCheckout,
      super.bonusOvertime,
      super.commission,
      super.earlyTime,
      super.lateHours,
      super.latePenalty,
      super.overtime,
      super.salaryPerHour,
      super.totalHoursWorked,
      super.totalSalary});

      factory DailyAttendanceReportModel.fromMap(Map<String, dynamic> map) {
    return DailyAttendanceReportModel(
      workShiftId: map['work_shift_id']?.toInt(),
      workShiftName: map['work_shift_name'],
      employeeName: map['employee_name'],
      employeeId: map['employee_id'],
      shiftSalary: map['shift_salary']?.toInt(),
      day: Formatter().dateTimeFromYyyyMmDDhHmMsS(map['day']),
      timeCheckin: Formatter().dateTimeFromYyyyMmDDhHmMsS(map['time_checkin']),
      timeCheckout:
          Formatter().dateTimeFromYyyyMmDDhHmMsS(map['time_checkout']),
      earlyTime: map['early_time'],
      totalHoursWorked: map['total_hours_worked']?.toInt(),
      salaryPerHour: map['salary_per_hour']?.toInt(),
      lateHours: map['late_hours']?.toInt(),
      latePenalty: map['late_penalty'],
      overtime: map['overtime']?.toInt(),
      bonusOvertime: map['bonus_overtime'],
      commission: map['commission'],
      totalSalary: map['total_salary']?.toInt(),
    );
  }

  factory DailyAttendanceReportModel.fromJson(String source) =>
      DailyAttendanceReportModel.fromMap(json.decode(source));
}
