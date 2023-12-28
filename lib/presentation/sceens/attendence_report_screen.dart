import 'package:flutter/material.dart';
import 'package:flutter_app/presentation/blocs/attendence_report/attendence_report_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AttendenceReportScreen extends StatelessWidget {
  const AttendenceReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("BÁO CÁO CHẤM CÔNG")),
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(16),
              child: BlocBuilder<AttendenceReportBloc, AttendenceReportState>(
                builder: (context, state) {
                  // print(state.attendenceReportStatus);
                  if (state.attendenceReportStatus.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state.attendenceReportStatus.isSucces) {
                    return ListView.builder(
                        itemCount: state.listAttendanceReport.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(
                                "${state.listAttendanceReport[index].day}"),
                          );
                        });
                  } else {
                    print("state: ${state.attendenceReportStatus}");
                    return const Text("Error");
                  }
                },
              ))),
    );
  }
}
