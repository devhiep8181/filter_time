import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/core/utils/formatter.dart';
import 'package:flutter_app/domain/entites/daily_attendance_report_entity.dart';

class WorkShiftCell extends StatelessWidget {
  final DailyAttendanceReportEntity report;
  const WorkShiftCell({super.key, required this.report});

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
                      Text("${report.workShiftName}"),
                      const SizedBox(height: 4),
                      _buildShifDay(context: context, date: report.day),
                    ],
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(),
                      onPressed: () {},
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
                        time: report.timeCheckin,
                        label: "Giờ vào"),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: const Color(0xffF5F5F5),
                        borderRadius: BorderRadius.circular(12)),
                    child: _buildShifTime(
                        context: context,
                        time: report.timeCheckout,
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
