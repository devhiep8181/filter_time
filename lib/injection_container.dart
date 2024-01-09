import 'package:flutter_app/configs/app_cache.dart';
import 'package:flutter_app/data/datasource/attendance/attendance_remote_datasource.dart';
import 'package:flutter_app/data/repositories/attendance_repository_impl.dart';
import 'package:flutter_app/domain/repositories/attendance_repository.dart';
import 'package:flutter_app/domain/usecases/attendance/get_daily_attendance_report_use_case.dart';
import 'package:flutter_app/presentation/blocs/attendence_report/attendence_report_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
//! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

//! Bloc
  sl.registerLazySingleton(
      () => AttendenceReportBloc(getDailyAttendanceReportUseCase: sl()));

//! Use Case

  sl.registerLazySingleton<GetDailyAttendanceReportUseCase>(
      () => GetDailyAttendanceReportUseCase(attendanceRepository: sl()));

//! Repository
  sl.registerLazySingleton<AttendanceRepository>(
      () => AttendanceRepositoryImpl(attendanceRemoteDatasoure: sl()));

//! Datasource

  sl.registerLazySingleton<AttendanceRemoteDatasoure>(
      () => AttendancceRemoteDatasourceImpl());
}
