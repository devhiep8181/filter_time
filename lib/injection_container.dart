import 'package:flutter_app/configs/app_cache.dart';
import 'package:flutter_app/data/datasource/attendance_remote_datasource.dart';
import 'package:flutter_app/data/repositories/attendance_repository_impl.dart';
import 'package:flutter_app/domain/repositories/attendance_repository.dart';
import 'package:flutter_app/domain/usecases/attendance/get_daily_attendance_report_use_case.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  
//! Core
sl.registerLazySingleton<AppCache>(() => AppCache(sl()));

//! External
 final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);


//! Use Case

  sl.registerLazySingleton<GetDailyAttendanceReportUseCase>(
      () => GetDailyAttendanceReportUseCase(attendanceRepository: sl()));

//! Repository
  sl.registerLazySingleton<AttendanceRepository>(
      () => AttendanceRepositoryImpl(attendanceRemoteDatasoure: sl()));

//! Datasource

  sl.registerLazySingleton<AttendanceRemoteDatasoure>(
      () => AttendancceRemoteDatasourceImpl(appCache: sl()));
}
