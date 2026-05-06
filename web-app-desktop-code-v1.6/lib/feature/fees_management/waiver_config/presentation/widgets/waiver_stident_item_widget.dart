
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_school/common/widget/custom_checkbox.dart';
import 'package:mighty_school/common/widget/custom_contaner.dart';
import 'package:mighty_school/common/widget/custom_image.dart';
import 'package:mighty_school/common/widget/numbering_widget.dart';
import 'package:mighty_school/feature/students_information/student/controller/student_controller.dart';
import 'package:mighty_school/feature/students_information/student/domain/model/student_model.dart';
import 'package:mighty_school/helper/responsive_helper.dart';
import 'package:mighty_school/util/app_constants.dart';
import 'package:mighty_school/util/dimensions.dart';
import 'package:mighty_school/util/styles.dart';

class WaiverStudentItemWidget extends StatelessWidget {
  final StudentItem? studentItem;
  final int index;
  const WaiverStudentItemWidget({super.key, this.studentItem, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.symmetric(vertical: 5),
      child: ResponsiveHelper.isDesktop(context)?
      Row(crossAxisAlignment: CrossAxisAlignment.start, spacing: Dimensions.paddingSizeDefault, children: [
        NumberingWidget(index: index),
        ClipRRect(borderRadius: BorderRadius.circular(120),
            child:  CustomImage(width: 40, height: 40, image: "${AppConstants.baseUrl}/storage/users/${studentItem?.image}")),

        Expanded(child: Text(studentItem?.roll??'', style: textRegular.copyWith(),)),
        Expanded(child: Text("${studentItem?.name}", maxLines: 1,overflow: TextOverflow.ellipsis,
          style: textRegular.copyWith(fontSize: Dimensions.fontSizeDefault),)),
        Padding(padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: CustomCheckbox(value: studentItem?.isSelected ?? false, onChange: (){
            Get.find<StudentController>().updateSelection(index);
          },),
        )
      ]):

      CustomContainer(child: Row(crossAxisAlignment: CrossAxisAlignment.start,  spacing: Dimensions.paddingSizeSmall, children: [
        ClipRRect(borderRadius: BorderRadius.circular(120),
            child: const CustomImage(width: Dimensions.imageSizeBig, height: Dimensions.imageSizeBig, image: "")),

        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("${studentItem?.name}", style: textMedium.copyWith(fontSize: Dimensions.fontSizeDefault),),
          Text("${"roll".tr} : ${studentItem?.roll??''}", style: textRegular.copyWith(),),
          Text("${"phone".tr} : ${studentItem?.phone??''}", style: textRegular.copyWith(),),

        ])),
        Padding(padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: CustomCheckbox(value: studentItem?.isSelected ?? false, onChange: (){
            Get.find<StudentController>().updateSelection(index);
          },),
        )
      ],
      )),
    );
  }
}