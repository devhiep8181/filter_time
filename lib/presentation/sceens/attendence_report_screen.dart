import 'package:flutter/material.dart';
import 'package:flutter_app/presentation/blocs/attendence_report/attendence_report_bloc.dart';
import 'package:flutter_app/presentation/sceens/work_shift_cell.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:month_year_picker/month_year_picker.dart';

class AttendenceReportScreen extends StatelessWidget {
  const AttendenceReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BÁO CÁO CHẤM CÔNG"),
        actions: const [_FilterItem()],
      ),
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(16),
              child: BlocBuilder<AttendenceReportBloc, AttendenceReportState>(
                builder: (context, state) {
                  if (state is AttendenceReporLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is AttendenceReportFinishedState) {
                    //print(state.listAttendanceReport);
                    return ListView.builder(
                        itemCount: state.listAttendanceReport.length,
                        itemBuilder: (context, index) {
                          return WorkShiftCell(
                              report: state.listAttendanceReport[index]);
                        });
                  } else if (state is AttendenceReporError) {
                    return Text(state.error);
                  }
                  return const SizedBox(
                    child: Center(child: Text('Error')),
                  );
                },
              ))),
    );
  }
}

class _FilterItem extends StatefulWidget {
  const _FilterItem({
    super.key,
  });

  @override
  State<_FilterItem> createState() => _FilterItemState();
}

class _FilterItemState extends State<_FilterItem> {
  ListFilter? selectedMenu;
  DateTime? _selected;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: const Icon(Icons.dehaze),
      initialValue: selectedMenu,
      onSelected: (ListFilter item) {
        setState(() {
          selectedMenu = item;
        });
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<ListFilter>>[
        const PopupMenuItem<ListFilter>(
          value: ListFilter.day,
          child: Text('Theo Ngày'),
        ),
        const PopupMenuItem<ListFilter>(
          value: ListFilter.week,
          child: Text('Theo Tuần'),
        ),
        PopupMenuItem<ListFilter>(
          value: ListFilter.month,
          child: const Text('Theo Tháng'),
          onTap: () {
            _onPressed(context: context, pickerMode: MonthYearPickerMode.month);
          },
        ),
        PopupMenuItem<ListFilter>(
          value: ListFilter.year,
          child: const Text('Theo Năm'),
          onTap: () async {
            DateTime? chooseTime = await _onPressed(
                context: context, pickerMode: MonthYearPickerMode.year);
            
          },
        ),
      ],
    );
  }

  Future<dynamic> _onPressed({
    required BuildContext context,
    required MonthYearPickerMode pickerMode,
    String? locale,
  }) async {
    final localeObj = locale != null ? Locale(locale) : null;
    final selected = await showMonthYearPicker(
      context: context,
      initialDate: _selected ?? DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime(2030),
      locale: localeObj,
      initialMonthYearPickerMode: pickerMode,
    );
    if (selected != null) {
      setState(() {
        _selected = selected;
      });
    }
    return selected;
  }
}

enum ListFilter { day, week, month, year }
