import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_school/common/widget/custom_button.dart';
import 'package:mighty_school/common/widget/custom_contaner.dart';
import 'package:mighty_school/common/widget/custom_dropdown.dart';
import 'package:mighty_school/common/widget/custom_title.dart';
import 'package:mighty_school/common/widget/date_selection_widget.dart';
import 'package:mighty_school/common/widget/section_header_with_path_widget.dart';
import 'package:mighty_school/feature/staff_information/staff_attendance/controller/staff_attendance_controller.dart';
import 'package:mighty_school/helper/responsive_helper.dart';
import 'package:mighty_school/util/dimensions.dart';

class AddNewStaffAttendanceWidget extends StatefulWidget {
  const AddNewStaffAttendanceWidget({super.key});

  @override
  State<AddNewStaffAttendanceWidget> createState() => _AddNewStaffAttendanceWidgetState();
}

class _AddNewStaffAttendanceWidgetState extends State<AddNewStaffAttendanceWidget> {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StaffAttendanceController>(
        builder: (attendanceController) {

          return Column(children: [
              SectionHeaderWithPath(sectionTitle: "staff_information".tr),
              Padding(padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
                child: CustomContainer(color: ResponsiveHelper.isDesktop(context)?
                Theme.of(context).cardColor: Theme.of(context).scaffoldBackgroundColor,
                  showShadow: false,
                  child: Column(mainAxisSize: MainAxisSize.min,
                    spacing: Dimensions.paddingSizeSmall, children: [

                    Row(children: [
                      Expanded(child: Column(spacing: Dimensions.paddingSizeSmall, children: [
                        const CustomTitle(title: "role"),
                        CustomDropdown(width: Get.width, title: "select".tr,
                          items: attendanceController.staffTypes,
                          selectedValue: attendanceController.selectedStaffType,
                          onChanged: (val){
                            attendanceController.setSelectedStaffType(val!);
                          },
                        ),
                      ],)),
                      const SizedBox(width: Dimensions.paddingSizeDefault),
                      const Expanded(child: DateSelectionWidget(allowFuture: false)),

                      const SizedBox(width: Dimensions.paddingSizeDefault),


                      attendanceController.isLoading? const Center(child: CircularProgressIndicator()):
                      Padding(padding: const EdgeInsets.only(top: 20),
                        child: SizedBox(width: 120, height: 42, child: CustomButton(onTap: (){
                          attendanceController.getStaffListForAttendance(attendanceController.selectedStaffType??"Staff");
                        }, text: "search".tr),),
                      ),
                    ]),

                  ],),
                ),
              ),
            ],
          );
        }
    );
  }
}
