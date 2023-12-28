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

  String get id =>
      workShiftId.toString() +
      (timeCheckin?.toIso8601String() ?? '') +
      (timeCheckout?.toIso8601String() ?? '');

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

  DailyAttendanceReportEntity.fromJson(Map<String, dynamic> json) {
    workShiftId = json['work_shift_id'];
    workShiftName = json['work_shift_name'];
    employeeName = json['employee_name'];
    employeeId = json['employee_id'];
    shiftSalary = json['shift_salary'];

    day = Formatter().dateTimeFromYyyyMmDDhHmMsS(json['day']);
    timeCheckin = Formatter().dateTimeFromYyyyMmDDhHmMsS(json['time_checkin']);
    timeCheckout =
        Formatter().dateTimeFromYyyyMmDDhHmMsS(json['time_checkout']);

    earlyTime = json['early_time'];
    totalHoursWorked = json['total_hours_worked'];
    salaryPerHour = json['salary_per_hour'];
    lateHours = json['late_hours'];
    latePenalty = json['late_penalty'];
    overtime = json['overtime'];
    bonusOvertime = json['bonus_overtime'];
    commission = json['commission'];
    totalSalary = json['total_salary'];
  }

  Map<String, dynamic> toMap() {
    return {
      'workShiftId': workShiftId,
      'workShiftName': workShiftName,
      'employeeName': employeeName,
      'employeeId': employeeId,
      'shiftSalary': shiftSalary,
      'day': day?.millisecondsSinceEpoch,
      'timeCheckin': timeCheckin?.millisecondsSinceEpoch,
      'timeCheckout': timeCheckout?.millisecondsSinceEpoch,
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
      day: map['day'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['day'])
          : null,
      timeCheckin: map['time_checkin'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['time_checkin'])
          : null,
      timeCheckout: map['time_checkout'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['time_checkout'])
          : null,
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
}
