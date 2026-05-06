import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_school/common/controller/datepicker_controller.dart';
import 'package:mighty_school/common/widget/custom_button.dart';
import 'package:mighty_school/common/widget/custom_contaner.dart';
import 'package:mighty_school/common/widget/date_selection_widget.dart';
import 'package:mighty_school/feature/staff_information/staff_attendance/controller/staff_attendance_controller.dart';
import 'package:mighty_school/feature/student_attendance_information/student_attendance/domain/models/student_attendance_model.dart';
import 'package:mighty_school/helper/responsive_helper.dart';
import 'package:mighty_school/util/dimensions.dart';

class StaffAttendanceReportSearchWidget extends StatefulWidget {
  final AttendanceItem? attendanceItem;
  const StaffAttendanceReportSearchWidget({super.key, this.attendanceItem});

  @override
  State<StaffAttendanceReportSearchWidget> createState() => _StaffAttendanceReportSearchWidgetState();
}

class _StaffAttendanceReportSearchWidgetState extends State<StaffAttendanceReportSearchWidget> {

  TextEditingController greaterThanController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StaffAttendanceController>(builder: (attendanceController) {

          return Padding(padding: EdgeInsets.symmetric(horizontal: ResponsiveHelper.isDesktop(context)? Dimensions.paddingSizeDefault : 0 ),
            child: CustomContainer(child: Column(mainAxisSize: MainAxisSize.min, children: [


                Row(spacing: Dimensions.paddingSizeDefault, children: [
                   Expanded(child: DateSelectionWidget(title: "from_date".tr)),
                   Expanded(child: DateSelectionWidget(end: true, title: "to_date".tr)),

                  attendanceController.isLoading? const Center(child: CircularProgressIndicator()):
                  Padding(padding: const EdgeInsets.only(top: 35.0),
                    child: SizedBox(width: 120, height: 40, child: CustomButton(onTap: (){

                      attendanceController.getStaffAttendanceReport(
                          fromDate: Get.find<DatePickerController>().formatedDate,
                          toDate: Get.find<DatePickerController>().formatedEndDate);

                    }, text: "search".tr))),
                ]),

                const SizedBox(height: Dimensions.paddingSizeSmall),
              ],),
            ),
          );
        }
    );
  }
}
