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
                  if (state.status.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state.status.isSucces) {
                    return state.listAttendanceReport.isEmpty
                        ? const _EmptyWidget()
                        : ListView.builder(
                            itemCount: state.listAttendanceReport.length,
                            itemBuilder: (context, index) {
                              return WorkShiftCell(
                                  report: state.listAttendanceReport[index]);
                            });
                  }
                  return Text("State: ${state.status.isError}");
                },
              ))),
    );
  }
}

class _EmptyWidget extends StatelessWidget {
  const _EmptyWidget();

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Empty"));
  }
}

class _FilterItem extends StatefulWidget {
  const _FilterItem();
  @override
  State<_FilterItem> createState() => _FilterItemState();
}

class _FilterItemState extends State<_FilterItem> {
  ListFilter? selectedMenu;
  DateTime? _selected;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AttendenceReportBloc, AttendenceReportState>(
      builder: (context, state) {
        return PopupMenuButton(
          icon: const Icon(Icons.dehaze),
          initialValue: selectedMenu,
          onSelected: (ListFilter item) {
            setState(() {
              selectedMenu = item;
            });
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<ListFilter>>[
            PopupMenuItem<ListFilter>(
              value: ListFilter.day,
              child: const Text('Theo Ngày'),
              onTap: () async {
                const chooseFilter = "day";
                DateTime? chooseTime = await _onPressedDay(context: context);
                // ignore: use_build_context_synchronously
                if (chooseTime != null) {
                  BlocProvider.of<AttendenceReportBloc>(context).add(
                      FilterTimeAttenceEvent(
                          date: chooseTime, chooseFilter: chooseFilter));
                }
              },
            ),
            PopupMenuItem<ListFilter>(
              value: ListFilter.week,
              child: const Text('Theo Tuần'),
              onTap: () async {
                const chooseFilter = "week";
                DateTimeRange? chooseTime =
                    await _onPressedWeek(context: context);
                // ignore: use_build_context_synchronously
                if (chooseTime != null) {
                  BlocProvider.of<AttendenceReportBloc>(context).add(
                      FilterTimeAttenceEvent(
                          date: null,
                          chooseFilter: chooseFilter,
                          week: chooseTime));
                }
              },
            ),
            PopupMenuItem<ListFilter>(
              value: ListFilter.month,
              child: const Text('Theo Tháng'),
              onTap: () async {
                const chooseFilter = "month";
                DateTime? chooseTime = await _onPressedMonthYear(
                    context: context, pickerMode: MonthYearPickerMode.month);
                // ignore: use_build_context_synchronously
                if (chooseTime != null) {
                  BlocProvider.of<AttendenceReportBloc>(context).add(
                      FilterTimeAttenceEvent(
                          date: chooseTime, chooseFilter: chooseFilter));
                }
              },
            ),
            PopupMenuItem<ListFilter>(
              value: ListFilter.year,
              child: const Text('Theo Năm'),
              onTap: () async {
                const chooseFilter = "year";
                DateTime? chooseTime = await _onPressedMonthYear(
                    context: context, pickerMode: MonthYearPickerMode.year);
                // ignore: use_build_context_synchronously
                if (chooseTime != null) {
                  BlocProvider.of<AttendenceReportBloc>(context).add(
                      FilterTimeAttenceEvent(
                          date: chooseTime, chooseFilter: chooseFilter));
                }
              },
            ),
          ],
        );
      },
    );
  }

  Future<dynamic> _onPressedMonthYear({
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
    return selected;
  }

  Future<dynamic> _onPressedDay({required BuildContext context}) async {
    final selected = await showDatePicker(
        context: context, firstDate: DateTime(2020), lastDate: DateTime.now());
    return selected;
  }

  Future<dynamic> _onPressedWeek({required BuildContext context}) async {
    final selected = await showDateRangePicker(
        context: context,
        firstDate: DateTime(2020),
        lastDate: DateTime(2030),
        currentDate: DateTime.now());
    return selected;
  }
}

enum ListFilter { day, week, month, year }
