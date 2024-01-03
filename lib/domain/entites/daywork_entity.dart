import '../../../core/utils/formatter.dart';

class DayworkEntity {
  int? statusKeeping;
  String? statusKeepingText;
  DateTime? day;
  num? week;
  num? dayofweek;
  DateTime? checkin;
  DateTime? checkout;
  DateTime? hours;
  String? late;
  bool? lateStatus;
  dynamic overtime;
  dynamic overtimeCheckin;
  bool? overtimeStatus;
  int? timeKeepingId;
  String? description;
  dynamic statusOvertimeCheckin;
  dynamic statusOvertimeCheckout;

  DayworkEntity({
    this.statusKeeping,
    this.statusKeepingText,
    this.day,
    this.week,
    this.dayofweek,
    this.checkin,
    this.checkout,
    this.hours,
    this.late,
    this.lateStatus,
    this.overtime,
    this.overtimeCheckin,
    this.overtimeStatus,
    this.timeKeepingId,
    this.description,
    this.statusOvertimeCheckin,
    this.statusOvertimeCheckout,
  });
}
