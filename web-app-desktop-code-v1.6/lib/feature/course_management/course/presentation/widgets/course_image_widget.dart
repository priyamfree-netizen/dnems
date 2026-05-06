import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_school/common/widget/custom_title.dart';
import 'package:mighty_school/feature/course_management/course/logic/course_controller.dart';
import 'package:mighty_school/helper/app_color_helper.dart';
import 'package:mighty_school/util/app_constants.dart';
import 'package:mighty_school/util/dimensions.dart';
import 'package:mighty_school/util/styles.dart';

import 'select_course_image_widget.dart';

class CourseImageWidget extends StatelessWidget {
  final String? courseImage;
  const CourseImageWidget({super.key, this.courseImage});

  @override
  Widget build(BuildContext context) {
    return Row(spacing: Dimensions.paddingSizeDefault, children: [
      Expanded(child: Padding(padding: const EdgeInsets.symmetric(
          vertical: Dimensions.paddingSizeSmall),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          spacing: Dimensions.paddingSizeDefault, children: [
            CustomTitle(title: "featured_image".tr),
            Row(spacing: Dimensions.paddingSizeDefault, children: [
              SelectCourseImageWidget(imageUrl: "${AppConstants.baseUrl}/storage/courses/$courseImage"),
              Expanded(child: InkWell(onTap: ()=> Get.find<CourseController>().pickImage(),
                child: DottedBorder(borderType: BorderType.RRect,
                  radius: const Radius.circular(5),
                  dashPattern: const [5  ,5], strokeWidth: 0.25,
                  padding: const EdgeInsets.all(6),
                  child: Center(child: Padding(padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                      Text.rich(TextSpan(children: [
                        TextSpan(text: "click_to_upload".tr, style: textBold.copyWith(
                            color: systemPrimaryColor())),
                        TextSpan(text: " ${"or_drag_and_drop".tr}", style: textRegular.copyWith(
                            color: Theme.of(context).hintColor, fontSize: Dimensions.fontSizeSmall)),
                              ])),
                              Text("file_info".tr, style: textRegular.copyWith(
                                  color: Theme.of(context).hintColor, fontSize: Dimensions.fontSizeSmall))
                            ]),
                      ),
                    ),
                  ),
                ),
              )

            ]),
          ],
        ),
      ),),

    ]);
  }
}
