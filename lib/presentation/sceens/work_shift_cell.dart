import 'package:flutter/material.dart';
import 'package:flutter_app/core/utils/formatter.dart';
import 'package:flutter_app/domain/entites/daily_attendance_report_entity.dart';
import 'package:flutter_app/presentation/sceens/work_shift_detail_page.dart';

class WorkShiftCell extends StatefulWidget {
  final DailyAttendanceReportEntity report;
  const WorkShiftCell({super.key, required this.report});

  @override
  State<WorkShiftCell> createState() => _WorkShiftCellState();
}

class _WorkShiftCellState extends State<WorkShiftCell> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xffffffff),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${widget.report.workShiftName}"),
                      const SizedBox(height: 4),
                      _buildShifDay(context: context, date: widget.report.day),
                    ],
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => WorkShiftDetailPage(
                                reportEntity: widget.report)));
                      },
                      child: const Text("Chi tiết"))
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 8, bottom: 8),
                child: Divider(thickness: 2),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: const Color(0xffF5F5F5),
                        borderRadius: BorderRadius.circular(12)),
                    child: _buildShifTime(
                        context: context,
                        time: widget.report.timeCheckin,
                        label: "Giờ vào"),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: const Color(0xffF5F5F5),
                        borderRadius: BorderRadius.circular(12)),
                    child: _buildShifTime(
                        context: context,
                        time: widget.report.timeCheckout,
                        label: "Giờ ra"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildShifTime(
      {required BuildContext context,
      required DateTime? time,
      required String label}) {
    if (time == null) return const SizedBox.shrink();
    final timeString = Formatter().dateTimeToHhMmSs(time);
    return Text("$label : $timeString");
  }

  Widget _buildShifDay(
      {required BuildContext context, required DateTime? date}) {
    if (date == null) return const SizedBox.shrink();
    final dateString = Formatter().dateTimeToDdMmYyyy(date);
    return Text(dateString);
  }
}
