import 'package:http/http.dart' as http;

const String baseApi = "http://api-v2.masterpro.vn/api/";

//login
const String loginUriBase = 'auth/login';

//attend
const attendApi = 'employees/timekeeping';
const attendanceScheduleList = 'employees/timesheet/getTimeSheetEmployee';
const dailyAttendanceReportList = 'employees/timesheet/getHistoryTimeSheet';
