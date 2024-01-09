import 'dart:convert';

import 'package:flutter_app/core/api_pramater.dart';
import 'package:flutter_app/core/utils/formatter.dart';
import 'package:flutter_app/data/models/daily_attendance_report_model.dart';
import 'package:flutter_app/domain/entites/daily_attendance_report_entity.dart';
import 'package:http/http.dart' as http;

abstract class AttendanceRemoteDatasoure {
  Future<List<DailyAttendanceReportEntity>> getDailyAttendanceReportList({
    required DateTime startDate,
    required DateTime endDate,
  });
}

class AttendancceRemoteDatasourceImpl implements AttendanceRemoteDatasoure {
  AttendancceRemoteDatasourceImpl();

  @override
  Future<List<DailyAttendanceReportEntity>> getDailyAttendanceReportList({
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    try {
      final loginUri = Uri.parse(baseApi + loginUriBase);
      final loginBody = {
        'username': 'admin',
        'password': '1',
        'tenantcode': 'taphoareview',
        'TenantId': '0',
        'Language': '',
      };

      final loginRequest = await http.post(loginUri, body: loginBody);
      final loginResponse = json.decode(loginRequest.body);
      final String token = loginResponse['data']['tokenPhp'];

      final reportUri = Uri.parse(baseApi + dailyAttendanceReportList);
      final reportBody = {
        "start_date": Formatter().dateTimeToYyyyMmDd(startDate),
        "end_date": Formatter().dateTimeToYyyyMmDd(endDate),
      };

      final reportHeaders = {'Authorization': 'Bearer $token'};

      final reportRequest =
          await http.post(reportUri, headers: reportHeaders, body: reportBody);

      final reportData = json.decode(reportRequest.body);
      print(reportData);

      return List<DailyAttendanceReportEntity>.from(
        reportData['data']
            .map((data) => DailyAttendanceReportModel.fromMap(data)),
      );
    } catch (e) {
      print("Error: $e");
      return [];
    }
  }
}
