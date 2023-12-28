import 'package:flutter_app/core/usecase/usecase.dart';
import 'package:flutter_app/domain/repositories/attendance_repository.dart';

class AttendParameter {
  final double longitude;
  final double latitude;
  final int distance;
  final num? timeSheetId;

  AttendParameter({
    required this.longitude,
    required this.latitude,
    required this.distance,
    required this.timeSheetId,
  });
}

class AttendanceUseCase implements UseCase<dynamic, AttendParameter> {
  final AttendanceRepository attendanceRepository;
  AttendanceUseCase({required this.attendanceRepository});

  @override
  Future call(AttendParameter param) {
    return attendanceRepository.attend(
        longitude: param.longitude,
        latitude: param.latitude,
        distance: param.distance,
        timeSheetId: param.timeSheetId);
  }
}
