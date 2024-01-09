import 'package:flutter/material.dart';
import 'package:flutter_app/domain/entites/daily_attendance_report_entity.dart';
import 'package:flutter_app/presentation/sceens/work_shift_cell.dart';

class WorkShiftDetailPage extends StatelessWidget {
  final DailyAttendanceReportEntity reportEntity;
  const WorkShiftDetailPage({super.key, required this.reportEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Chi tiết chấm công"), centerTitle: true),
      body: SafeArea(child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 16),
        children: [
          WorkShiftCell(
            report: reportEntity,
          ),
          const SizedBox(height: 16),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
             
            ),
            child: Column(
              children: [
                _buildLabel(context, key: 'Tổng giờ làm: ', value: reportEntity.totalHoursWorked ?? 0),
                _buildLabel(context, key: 'Lương mỗi giờ: ', value: reportEntity.salaryPerHour ?? 0),
                _buildLabel(context, key: 'Lương mỗi ca: ', value: reportEntity.shiftSalary ?? 0),
                _buildLabel(context, key: 'Tổng lương: ', value: reportEntity.totalSalary ?? 0),
                const Divider(height: 1.5),
                _buildLabel(context, key: 'Giờ tăng ca: ', value: reportEntity.bonusOvertime ?? 0),
                _buildLabel(context, key: 'Thưởng tăng ca: ', value: reportEntity.bonusOvertime ?? 0),
                const Divider(height: 1.5),
                _buildLabel(context, key: 'Số giờ muộn: ', value: reportEntity.lateHours ?? 0),
                _buildLabel(context, key: 'Tiền phạt đi muộn: ', value: reportEntity.latePenalty ?? 0),
              ],
            ),
          ),
        ],
      ),)
    );
  }

    Widget _buildLabel(BuildContext context, {
    required String key,
    required dynamic value,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(key, style: Theme.of(context).textTheme.titleMedium,),
          const Spacer(),
          Text(value.toString(),),
        ],
      ),
    );
  }
}
