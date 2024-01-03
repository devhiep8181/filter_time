import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/domain/entites/daily_attendance_report_entity.dart';
import 'package:flutter_app/domain/usecases/attendance/get_daily_attendance_report_use_case.dart';

part 'attendence_report_event.dart';
part 'attendence_report_state.dart';

class AttendenceReportBloc
    extends Bloc<AttendenceReportEvent, AttendenceReportState> {
  GetDailyAttendanceReportUseCase getDailyAttendanceReportUseCase;

  AttendenceReportBloc({required this.getDailyAttendanceReportUseCase})
      : super(const AttendenceReportState()) {
    on<AttendenceReportInitEvent>(_onShowAttendenceReport);
    on<FilterTimeAttenceEvent>(_onFilterTimeAttenceEvent);
  }

  FutureOr<void> _onShowAttendenceReport(AttendenceReportInitEvent event,
      Emitter<AttendenceReportState> emit) async {
    try {
      emit(AttendenceReportLoading());
      final result = await getDailyAttendanceReportUseCase.call(
          GetDailyAttendanceReportParameter(
              startDate: DateTime(2020), endDate: DateTime(2024)));
      emit(AttendenceReportFinishedState(listAttendanceReport: result));
    } catch (e) {
      emit(AttendenceReportError(error: e.toString()));
    }
  }

  FutureOr<void> _onFilterTimeAttenceEvent(
      FilterTimeAttenceEvent event, Emitter<AttendenceReportState> emit) async {
    try {
      // emit(AttendenceReportLoading());
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
      // if (event.chooseFilter == "year") {
      //   for (int i = 0; i < resultRequestApi.length; i++) {
      //     if (resultRequestApi[i].day!.year == event.date!.year &&
      //         resultRequestApi[i].day!.month == event.date!.month) {
      //       result.add(resultRequestApi[i]);
      //     }
      //   }
      // } else if (event.chooseFilter == "month") {
      //   for (int i = 0; i < resultRequestApi.length; i++) {
      //     if (resultRequestApi[i].day!.month == event.date!.month &&
      //         resultRequestApi[i].day!.year == event.date!.year) {
      //       result.add(resultRequestApi[i]);
      //     }
      //   }
      // } else if (event.chooseFilter == "day") {
      //   for (int i = 0; i < resultRequestApi.length; i++) {
      //     if (resultRequestApi[i].day!.day == event.date!.day &&
      //         resultRequestApi[i].day!.month == event.date!.month &&
      //         resultRequestApi[i].day!.year == event.date!.year) {
      //       result.add(resultRequestApi[i]);
      //     }
      //   }
      // } else if (event.chooseFilter == "week") {
      //   List<DateTime> dayOfWeek = [];
      //   final DateTime startOfWeek = event.week!.start;
      //   final DateTime endOfWeek = event.week!.end;
      //   for (int i = 0; i <= endOfWeek.difference(startOfWeek).inDays; i++) {
      //     DateTime currentDay = startOfWeek.add(Duration(days: i));
      //     dayOfWeek.add(currentDay);
      //   }
      //   for (int i = 0; i < resultRequestApi.length; i++) {
      //     for (var day in dayOfWeek) {
      //       if (resultRequestApi[i].day!.compareTo(day) == 0) {
      //         result.add(resultRequestApi[i]);
      //       }
      //     }
      //   }
      // }

      emit(AttendenceReportFinishedState(listAttendanceReport: result));
    } catch (e) {
      emit(AttendenceReportError(error: e.toString()));
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
