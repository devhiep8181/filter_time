import 'package:http/http.dart' as http;

const String baseApi = "http://api-v2.masterpro.vn/api/";

//login
const String loginUri = 'auth/login';

//attend
const attendApi = 'employees/timekeeping';
const attendanceScheduleList = 'employees/timesheet/getTimeSheetEmployee';
const dailyAttendanceReportList = 'employees/timesheet/getHistoryTimeSheet';

class GetToken {
  Future<dynamic> getToken() async {
    final response = await http.post(
      Uri.parse(baseApi + loginUri),
      body: {'username': 'taphoareview', 'password': '1', 'tenantcode': 'admin'},
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      final token = response.body;
      return token;
    } else {
      print(response.statusCode);
      return null;
    }
  }
}


Map<String, String> getHeaders({required String? token}) => <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      if (token != null) 'Authorization': 'Bearer ${GetToken().getToken()}',
    };
