import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/domain/entites/daily_attendance_report_entity.dart';
import 'package:flutter_app/domain/usecases/attendance/get_daily_attendance_report_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'attendence_report_event.dart';
part 'attendence_report_state.dart';

class AttendenceReportBloc
    extends Bloc<AttendenceReportEvent, AttendenceReportState> {
  GetDailyAttendanceReportUseCase getDailyAttendanceReportUseCase;

  AttendenceReportBloc({required this.getDailyAttendanceReportUseCase})
      : super(const AttendenceReportState(
            status: AttendenceReportStatus.initial, listAttendanceReport: [])) {
    on<AttendenceReportInitEvent>(_onShowAttendenceReport);
    on<FilterTimeAttenceEvent>(_onFilterTimeAttenceEvent);
  }

  FutureOr<void> _onShowAttendenceReport(AttendenceReportInitEvent event,
      Emitter<AttendenceReportState> emit) async {
    try {
      emit(state.copyWith(status: AttendenceReportStatus.loading));
      final result = await getDailyAttendanceReportUseCase.call(
          GetDailyAttendanceReportParameter(
              startDate: DateTime(2020), endDate: DateTime(2024)));
      emit(state.copyWith(
          status: AttendenceReportStatus.success,
          listAttendanceReport: result));
    } catch (e) {
      emit(state.copyWith(status: AttendenceReportStatus.error));
    }
  }

  FutureOr<void> _onFilterTimeAttenceEvent(
      FilterTimeAttenceEvent event, Emitter<AttendenceReportState> emit) async {
    try {
      emit(state.copyWith(status: AttendenceReportStatus.loading));
      final resultRequestApi = await _fetchAttendanceReport(
          GetDailyAttendanceReportParameter(
              startDate: DateTime(2020), endDate: DateTime(2024)));
      final List<DailyAttendanceReportEntity> result = [];
      switch (event.chooseFilter) {
        case "year":
          result.addAll(_filterByYear(resultRequestApi, event.date!));
          break;
        case "month":
          result.addAll(_filterByMonth(resultRequestApi, event.date!));
          break;
        case "week":
          result.addAll(_filterByWeek(resultRequestApi, event.week!));
          break;
        case "day":
          result.addAll(_filterByDay(resultRequestApi, event.date!));
          break;
      }
      emit(state.copyWith(
          status: AttendenceReportStatus.success,
          listAttendanceReport: result));
    } catch (e) {
      emit(state.copyWith(status: AttendenceReportStatus.error));
    }
  }

  Future<List<DailyAttendanceReportEntity>> _fetchAttendanceReport(
      GetDailyAttendanceReportParameter parameter) async {
    return await getDailyAttendanceReportUseCase.call(parameter);
  }
}

List<DailyAttendanceReportEntity> _filterByYear(
    List<DailyAttendanceReportEntity> resultRequestApi, DateTime date) {
  return resultRequestApi
      .where((report) => report.day!.year == date.year)
      .toList();
}

List<DailyAttendanceReportEntity> _filterByMonth(
    List<DailyAttendanceReportEntity> resultRequestApi, DateTime date) {
  return resultRequestApi
      .where((report) =>
          report.day!.year == date.year && report.day!.month == date.month)
      .toList();
}

List<DailyAttendanceReportEntity> _filterByWeek(
    List<DailyAttendanceReportEntity> resultRequestApi, DateTimeRange week) {
  final dayOfWeek = List<DateTime>.generate(
      week.end.difference(week.start).inDays + 1,
      (i) => week.start.add(Duration(days: i)));

  return resultRequestApi
      .where(
          (report) => dayOfWeek.any((day) => report.day!.compareTo(day) == 0))
      .toList();
}

List<DailyAttendanceReportEntity> _filterByDay(
    List<DailyAttendanceReportEntity> resultRequestApi, DateTime date) {
  return resultRequestApi
      .where((report) =>
          report.day!.year == date.year &&
          report.day!.month == date.month &&
          report.day!.day == date.day)
      .toList();
}
