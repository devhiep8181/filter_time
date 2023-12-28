import 'daywork_entity.dart';

class AttendanceEntity {
  int? id;
  String? employeeId;
  String? employeeName;
  String? workDate;
  String? workDateEnd;
  String? workShiftName;
  String? startTime;
  String? endTime;
  String? lateMinutes;
  List<DayworkEntity>? dayworks;

  AttendanceEntity({
    this.id,
    this.employeeId,
    this.employeeName,
    this.workDate,
    this.workDateEnd,
    this.workShiftName,
    this.startTime,
    this.endTime,
    this.lateMinutes,
    this.dayworks,
  });

  AttendanceEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    employeeId = json['employee_id'];
    employeeName = json['employee_name'];
    workDate = json['work_date'];
    workDateEnd = json['work_date_end'];
    workShiftName = json['work_shift_name'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    lateMinutes = json['late_minutes'];
    if (json['dayworks'] != null) {
      dayworks = <DayworkEntity>[];
      json['dayworks'].forEach((v) {
        dayworks!.add(DayworkEntity.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['employee_id'] = employeeId;
    data['employee_name'] = employeeName;
    data['work_date'] = workDate;
    data['work_date_end'] = workDateEnd;
    data['work_shift_name'] = workShiftName;
    data['start_time'] = startTime;
    data['end_time'] = endTime;
    data['late_minutes'] = lateMinutes;
    if (dayworks != null) {
      data['dayworks'] = dayworks!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
