import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/core/api_pramater.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class TestApi extends StatelessWidget {
  const TestApi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TEST API"),
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                print("hehe");
              },
              child: const Text("TEST BUTTON")),
          ElevatedButton(
              onPressed: () async {
                final token = await getToken();
                final data = await fetchData(token);
                if (data != null) {
                  Logger().d("Data Raw: ${data}");
                } else {
                  print("error");
                }
                Logger().t("hihi");
              },
              child: const Text("CALL API")),
        ],
      )),
    );
  }
}

Future<dynamic> getToken() async {
  final request = await http.post(Uri.parse(baseApi + loginUri), body: {
    'username': 'admin',
    'password': '1',
    'tenantcode': 'taphoareview',
    'TenantId': '0',
    'Language': ''
  });
  final respone = json.decode(request.body);
  final String token = respone['data']['tokenPhp'];
  if (request.statusCode == 200) {
    return token;
  } else {
    return request.statusCode;
  }
}

Future<dynamic> fetchData(String? token) async {
  String startTime = DateTime(2020).toIso8601String();
  String endTime = DateTime(2024).toIso8601String();
  Map<String, dynamic> body = {'start_date': startTime, 'end_date': endTime};
  var header = {'Authorization': 'Bearer $token'};
  final request = await http.post(
      Uri.parse(baseApi + dailyAttendanceReportList),
      headers: header,
      body: body);

  if (request.statusCode == 200) {
    final respone = json.decode(request.body);
    final data = respone['data'];
    return data;
  } else {
    return request.statusCode;
  }
}
