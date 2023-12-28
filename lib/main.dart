import 'package:flutter/material.dart';
import 'package:flutter_app/injection_container.dart';
import 'package:flutter_app/presentation/blocs/attendence_report/attendence_report_bloc.dart';
import 'package:flutter_app/presentation/sceens/attendence_report_screen.dart';
import 'package:flutter_app/presentation/sceens/test_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          AttendenceReportBloc(getDailyAttendanceReportUseCase: sl()),
      child: const MaterialApp(
        home: AttendenceReportScreen(),
      ),
    );
  }
}
