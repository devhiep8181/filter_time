//! API
Map<String, String> getHeaders({required String? token}) => <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      if (token != null) 'Authorization': 'Bearer $token',
    };

const String baseApi = 'http://api-v2.masterpro.vn/api/';
const String checkTokenUrl = '/api/user/check-token';

//login
const String loginUriBase = 'auth/login';

//attend
const attendApi = 'employees/timekeeping';
const attendanceScheduleList = 'employees/timesheet/getTimeSheetEmployee';
const dailyAttendanceReportList = 'employees/timesheet/getHistoryTimeSheet';
