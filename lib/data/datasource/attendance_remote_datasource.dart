import 'dart:convert';

import 'package:flutter_app/configs/app_cache.dart';
import 'package:flutter_app/core/api_pramater.dart';
import 'package:flutter_app/core/data/base_remote_datasource.dart';
import 'package:flutter_app/core/utils/formatter.dart';
import 'package:flutter_app/domain/entites/attendance_entity.dart';
import 'package:flutter_app/domain/entites/daily_attendance_report_entity.dart';
import 'package:http/http.dart' as http;

abstract class AttendanceRemoteDatasoure {
  Future<dynamic> attend({
    required num longitude,
    required num latitude,
    required num distance,
    required num? timeSheetId,
  });
  Future<List<DailyAttendanceReportEntity>> getDailyAttendanceReportList({
    required DateTime startDate,
    required DateTime endDate,
  });
  Future<List<AttendanceEntity>> getAttendanceList({
    required final DateTime startDate,
    required final DateTime endDate,
    required final num? timeSheetId,
  });
}

class AttendancceRemoteDatasourceImpl extends BaseRemoteDataSourceImpl
    implements AttendanceRemoteDatasoure {
  final AppCache appCache;
  AttendancceRemoteDatasourceImpl({required this.appCache});
  @override
  Future<dynamic> attend(
      {required num longitude,
      required num latitude,
      required num distance,
      required num? timeSheetId}) async {
    Map<String, dynamic> body = {
      "longitude": longitude,
      "latitude": latitude,
      "distance": distance,
      "id_timesheet": timeSheetId ?? ''
    };

    final data = await performPostRequest(
      serverAddress: baseApi,
      url: dailyAttendanceReportList,
      token: appCache.token,
      data: body,
      fullResponse: true,
    );
    return data;
  }

  @override
  Future<List<DailyAttendanceReportEntity>> getDailyAttendanceReportList(
      {required DateTime startDate, required DateTime endDate}) async {
    Map<String, dynamic> body = {
      "start_date": Formatter().dateTimeToYyyyMmDd(startDate),
      "end_date": Formatter().dateTimeToYyyyMmDd(endDate),
    };

    final request = await http.post(Uri.parse(baseApi + loginUri), body: {
      'username': 'admin',
      'password': '1',
      'tenantcode': 'taphoareview',
      'TenantId': '0',
      'Language': ''
    });
    final respone = json.decode(request.body);
    final String token = respone['data']['tokenPhp'];
    //print(token);
    var header = {'Authorization': 'Bearer $token'};

    final getData = await http.post(
        Uri.parse(baseApi + dailyAttendanceReportList),
        headers: header,
        body: body);

    final data = json.decode(getData.body);
    print(data);
    List<DailyAttendanceReportEntity> result = [];
    //print(result);
    //print(data['data'][0]);
    for (int i = 0; i < data['data'].length; i++) {
      result.add(DailyAttendanceReportEntity.fromMap(data['data'][i]));
    }

    return result.toList();
  }

  @override
  Future<List<AttendanceEntity>> getAttendanceList(
      {required DateTime startDate,
      required DateTime endDate,
      required num? timeSheetId}) async {
    Map<String, dynamic> body = {
      "start_date": Formatter().dateTimeToYyyyMmDd(startDate),
      "end_date": Formatter().dateTimeToYyyyMmDd(endDate),
      "timesheet_id": timeSheetId ?? '',
    };

    final data = await performPostRequest(
      serverAddress: baseApi,
      url: dailyAttendanceReportList,
      token: appCache.token,
      data: body,
      fullResponse: true,
    );

    List<AttendanceEntity> result = [];
    for (int i = 0; i < data.data.lenght; i++) {
      result.add(data.data[i]);
    }

    return result.toList();
  }
}
