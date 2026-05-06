import 'package:flutter/material.dart';
import 'package:mighty_school/common/widget/custom_divider.dart';
import 'package:mighty_school/common/widget/custom_item_text_widget.dart';
import 'package:mighty_school/common/widget/heading_menu_widget.dart';
import 'package:mighty_school/common/widget/numbering_widget.dart';
import 'package:mighty_school/feature/staff_information/staff_attendance/domain/models/staff_attendance_report_model.dart';
import 'package:mighty_school/util/dimensions.dart';

class AttendanceLogWidget extends StatelessWidget {
  final StaffAttendanceReportItem? attendanceItem;
  const AttendanceLogWidget({super.key, this.attendanceItem});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
        const HeadingMenu(showActionOption: false, headings: ["date", "attendance", "entry", "exit"]),
        ListView.separated(
          itemCount: attendanceItem?.logs?.length??0,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (_, index){
          return Row(spacing: Dimensions.paddingSizeDefault,children: [
            NumberingWidget(index: index),
            Expanded(child: CustomItemTextWidget(text:attendanceItem?.logs?[index].date??"")),
            Expanded(child: CustomItemTextWidget(text:attendanceItem?.logs?[index].attendance.toString()=="1"? "Present" :
            attendanceItem?.logs?[index].attendance.toString()=="2"? "Absent": "Leave")),
            Expanded(child: CustomItemTextWidget(text:attendanceItem?.logs?[index].startTime??"")),
            Expanded(child: CustomItemTextWidget(text:attendanceItem?.logs?[index].endTime??"")),
          ],);
        }, separatorBuilder: (BuildContext context, int index) {
            return const CustomDivider();
        },),
      ],
    );
  }
}
