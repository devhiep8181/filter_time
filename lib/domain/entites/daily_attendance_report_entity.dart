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
}
