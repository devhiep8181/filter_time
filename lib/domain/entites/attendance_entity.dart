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
}
