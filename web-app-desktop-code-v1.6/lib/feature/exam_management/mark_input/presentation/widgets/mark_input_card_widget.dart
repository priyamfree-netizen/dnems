import 'package:flutter/material.dart';
import 'package:mighty_school/common/widget/custom_contaner.dart';
import 'package:mighty_school/common/widget/custom_item_text_widget.dart';
import 'package:mighty_school/common/widget/numbering_widget.dart';
import 'package:mighty_school/feature/exam_management/mark_input/domain/models/mark_input_model.dart';
import 'package:mighty_school/helper/responsive_helper.dart';
import 'package:mighty_school/util/dimensions.dart';

class MarkInputCardWidget extends StatelessWidget {
  final MarkConfig? markConfig;
  final int index;
  const MarkInputCardWidget({super.key, this.markConfig, required this.index});

  @override
  Widget build(BuildContext context) {
    return ResponsiveHelper.isDesktop(context)?
    Column(children: [
        Row(spacing: Dimensions.paddingSizeDefault, children: [
          NumberingWidget(index: index),
          Expanded(child: CustomItemTextWidget(text: markConfig?.markConfigExamCode?.title??'',)),
          Expanded(child: CustomItemTextWidget(text: markConfig?.markConfigExamCode?.totalMarks??'',)),
          Expanded(child: CustomItemTextWidget(text: markConfig?.markConfigExamCode?.passMark??'',)),
          Expanded(child: CustomItemTextWidget(text: markConfig?.markConfigExamCode?.acceptance??'',)),
        ],),

      ],
    ):
    CustomContainer(child: Column(children: [
      Row(children: [
          Expanded(child: Column(children: [
              CustomItemTextWidget(text: markConfig?.markConfigExamCode?.title??'',),
              Row(children: [
                Expanded(child: CustomItemTextWidget(text: markConfig?.markConfigExamCode?.totalMarks??'',)),
                const SizedBox(width: Dimensions.paddingSizeSmall),
                Expanded(child: CustomItemTextWidget(text: markConfig?.markConfigExamCode?.passMark??'',)),
              ],)
            ],
          )),
          Expanded(child: CustomItemTextWidget(text: markConfig?.markConfigExamCode?.acceptance??'',)),
        ],
      ),

    ],),);
  }
}
