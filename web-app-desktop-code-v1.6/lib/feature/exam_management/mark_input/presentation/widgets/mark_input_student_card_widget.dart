import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_school/common/widget/custom_contaner.dart';
import 'package:mighty_school/common/widget/custom_divider.dart';
import 'package:mighty_school/common/widget/custom_item_text_widget.dart';
import 'package:mighty_school/common/widget/custom_text_field.dart';
import 'package:mighty_school/common/widget/numbering_widget.dart';
import 'package:mighty_school/feature/exam_management/mark_input/controller/mark_input_controller.dart';
import 'package:mighty_school/feature/exam_management/mark_input/domain/models/mark_input_model.dart';
import 'package:mighty_school/helper/responsive_helper.dart';
import 'package:mighty_school/util/dimensions.dart';
import 'package:mighty_school/util/styles.dart';

class MarkInputStudentCardWidget extends StatelessWidget {
  final Students? students;
  final MarkConfigItem? markConfigItem;
  final int index;
  const MarkInputStudentCardWidget({super.key, this.students, this.markConfigItem, required this.index});

  @override
  Widget build(BuildContext context) {
    return ResponsiveHelper.isDesktop(context)?
    GetBuilder<MarkInputController>(
      builder: (markInputController) {
        return Column(children: [
            Row(spacing: Dimensions.paddingSizeSmall, children: [
              NumberingWidget(index: index),
              Expanded(child: CustomItemTextWidget(text:students?.roll??'')),
              Expanded(child: CustomItemTextWidget(text:students?.name??'',)),
              SizedBox(height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: markConfigItem?.markConfig?.length ?? 0,
                  itemBuilder: (context, i) {
                    final markConfig = markConfigItem?.markConfig?[i];
                    return Padding(padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: SizedBox(width: 90,
                        child:  CustomTextField(controller: markInputController.getController(
                            students?.id ?? 0, markConfig?.markConfigExamCode?.id ?? 0)),
                    ));
                  },
                ),
              ),


            ],),
            const CustomDivider(verticalPadding: Dimensions.paddingSizeSmall)
          ],
        );
      }
    ):
    CustomContainer(child: Column(children: [
      Row( children: [
        Expanded(child: Text(students?.roll??'', style: textRegular.copyWith(fontSize: Dimensions.fontSizeDefault),)),
        const SizedBox(width: Dimensions.paddingSizeSmall),

        Expanded(child: Text(students?.name??'', style: textRegular.copyWith(fontSize: Dimensions.fontSizeDefault),)),
        const SizedBox(width: Dimensions.paddingSizeSmall),

        Expanded(child: SizedBox(height: 50, child: ListView.builder(
            itemCount: markConfigItem?.markConfig?.length?? 0,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index){
              return const Expanded(child: CustomTextField());
            }),)),


      ],),

    ],),);
  }
}
