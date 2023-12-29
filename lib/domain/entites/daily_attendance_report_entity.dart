import 'dart:convert';

import 'package:flutter_app/core/utils/formatter.dart';

class DailyAttendanceReportEntity {
  int? workShiftId;
  String? workShiftName;
  String? employeeName;
  String? employeeId;
  int? shiftSalary;
  DateTime? day;
  DateTime? timeCheckin;
  DateTime? timeCheckout;
  String? earlyTime;
  int? totalHoursWorked;
  int? salaryPerHour;
  int? lateHours;
  String? latePenalty;
  int? overtime;
  String? bonusOvertime;
  dynamic commission;
  int? totalSalary;

  DailyAttendanceReportEntity({
    this.workShiftId,
    this.workShiftName,
    this.employeeName,
    this.employeeId,
    this.shiftSalary,
    this.day,
    this.timeCheckin,
    this.timeCheckout,
    this.earlyTime,
    this.totalHoursWorked,
    this.salaryPerHour,
    this.lateHours,
    this.latePenalty,
    this.overtime,
    this.bonusOvertime,
    this.commission,
    this.totalSalary,
  });

  Map<String, dynamic> toMap() {
    return {
      'workShiftId': workShiftId,
      'workShiftName': workShiftName,
      'employeeName': employeeName,
      'employeeId': employeeId,
      'shiftSalary': shiftSalary,
      // 'day': day?.millisecondsSinceEpoch,
      // 'timeCheckin': timeCheckin?.millisecondsSinceEpoch,
      // 'timeCheckout': timeCheckout?.millisecondsSinceEpoch,
      'earlyTime': earlyTime,
      'totalHoursWorked': totalHoursWorked,
      'salaryPerHour': salaryPerHour,
      'lateHours': lateHours,
      'latePenalty': latePenalty,
      'overtime': overtime,
      'bonusOvertime': bonusOvertime,
      'commission': commission,
      'totalSalary': totalSalary,
    };
  }

  factory DailyAttendanceReportEntity.fromMap(Map<String, dynamic> map) {
    return DailyAttendanceReportEntity(
      workShiftId: map['work_shift_id']?.toInt(),
      workShiftName: map['work_shift_name'],
      employeeName: map['employee_name'],
      employeeId: map['employee_id'],
      shiftSalary: map['shift_salary']?.toInt(),
      // day: map['day'] != null
      //     ? DateTime.fromMillisecondsSinceEpoch(int.parse(map['day']))
      //     : null,
      day: Formatter().dateTimeFromYyyyMmDDhHmMsS(map['day']),
      timeCheckin: Formatter().dateTimeFromYyyyMmDDhHmMsS(map['time_checkin']),
      timeCheckout:
          Formatter().dateTimeFromYyyyMmDDhHmMsS(map['time_checkout']),

      //day: map['day'] != null ? DateTime.fromMillisecondsSinceEpoch(map['day']) : null,
      // timeCheckin: map['timeCheckin'] != null ? DateTime.fromMillisecondsSinceEpoch(map['timeCheckin']) : null,
      // timeCheckout: map['timeCheckout'] != null ? DateTime.fromMillisecondsSinceEpoch(map['timeCheckout']) : null,
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

  String toJson() => json.encode(toMap());

  factory DailyAttendanceReportEntity.fromJson(String source) =>
      DailyAttendanceReportEntity.fromMap(json.decode(source));
}
