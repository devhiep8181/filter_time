import 'package:flutter_app/core/usecase/usecase.dart';
import 'package:flutter_app/domain/entites/attendance_entity.dart';
import 'package:flutter_app/domain/repositories/attendance_repository.dart';

class GetAttendanceScheduleParameter {
  final DateTime startDate;
  final DateTime endDate;
  final num? timeSheetId;

  GetAttendanceScheduleParameter({
    required this.startDate,
    required this.endDate,
    required this.timeSheetId,
  });
}

class GetAttendanceScheduleUseCase
    implements UseCase<List<AttendanceEntity>, GetAttendanceScheduleParameter> {
  final AttendanceRepository attendanceRepository;

  GetAttendanceScheduleUseCase({
    required this.attendanceRepository,
  });

  @override
  Future<List<AttendanceEntity>> call(GetAttendanceScheduleParameter param) {
    return attendanceRepository.getAttendanceScheduleList(
        startDate: param.startDate,
        endDate: param.endDate,
        timeSheetId: param.timeSheetId);
  }
}
