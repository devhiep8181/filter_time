import 'package:dartz/dartz.dart';
import 'package:flutter_app/core/error/failures.dart';
import 'package:flutter_app/core/usecase/usecase.dart';
import 'package:flutter_app/domain/entites/daily_attendance_report_entity.dart';
import 'package:flutter_app/domain/repositories/attendance_repository.dart';

class GetDailyAttendanceReportParameter {
  final DateTime startDate;
  final DateTime endDate;

  GetDailyAttendanceReportParameter({
    required this.startDate,
    required this.endDate,
  });
}

class GetDailyAttendanceReportUseCase
    implements
        UseCase<List<DailyAttendanceReportEntity>,
            GetDailyAttendanceReportParameter> {
  final AttendanceRepository attendanceRepository;

  GetDailyAttendanceReportUseCase({required this.attendanceRepository});

  @override
  Future<Either<Failure, List<DailyAttendanceReportEntity>>> call(
      GetDailyAttendanceReportParameter param) async {
    return Right(await attendanceRepository.getDailyAttendanceReportList(
        startDate: param.startDate, endDate: param.endDate));
  }
}
