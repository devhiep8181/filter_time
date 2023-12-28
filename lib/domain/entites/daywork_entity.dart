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

  DayworkEntity.fromJson(Map<String, dynamic> json) {
    statusKeeping = json['status_keeping'];
    statusKeepingText = json['status_keeping_text'];

    day = json['day'] == null 
      ? null : Formatter().dateTimeFromYyyyMmDD(json['day']);
    checkin = json['time_checkin'] == null 
      ? null : Formatter().dateTimeFromHhMmSs(json['time_checkin']);
    checkout = json['time_checkout'] == null 
      ? null : Formatter().dateTimeFromHhMmSs(json['time_checkout']);
    hours = json['hours'] == null
      ? null : Formatter().dateTimeFromHhMmSs(json['hours']);

    week = json['week'];
    dayofweek = json['dayofweek'];
    late = json['late'];
    lateStatus = json['late_status'] is bool ? json['late_status'] : false;
    overtime = json['overtime'];
    overtimeCheckin = json['overtime_checkin'];
    overtimeStatus = json['overtime_status'];
    timeKeepingId = json['time_keeping_id'];
    description = json['description'];
    statusOvertimeCheckin = json['status_overtime_checkin'];
    statusOvertimeCheckout = json['status_overtime_checkout'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['status_keeping'] = statusKeeping;
    data['status_keeping_text'] = statusKeepingText;
    data['day'] = day;
    data['week'] = week;
    data['dayofweek'] = dayofweek;
    data['checkin'] = checkin;
    data['checkout'] = checkout;
    data['hours'] = hours;
    data['late'] = late;
    data['late_status'] = lateStatus;
    data['overtime'] = overtime;
    data['overtime_checkin'] = overtimeCheckin;
    data['overtime_status'] = overtimeStatus;
    data['time_keeping_id'] = timeKeepingId;
    data['description'] = description;
    data['status_overtime_checkin'] = statusOvertimeCheckin;
    data['status_overtime_checkout'] = statusOvertimeCheckout;
    return data;
  }
}
