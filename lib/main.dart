import 'package:flutter/material.dart';
import 'package:flutter_app/core/constant/constant.dart';
import 'package:flutter_app/injection_container.dart';
import 'package:flutter_app/presentation/blocs/attendence_report/attendence_report_bloc.dart';
import 'package:flutter_app/presentation/sceens/attendence_report_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:month_year_picker/month_year_picker.dart';

import 'simple_bloc_observer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AttendenceReportBloc(getDailyAttendanceReportUseCase: sl())
        ..add(AttendenceReportInitEvent()),
      child: MaterialApp(
        theme: ThemeData(scaffoldBackgroundColor: appThemeColor),
        home: const AttendenceReportScreen(),
         localizationsDelegates:const [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        MonthYearPickerLocalizations.delegate,
      ],
      ),
    );
  }
}
