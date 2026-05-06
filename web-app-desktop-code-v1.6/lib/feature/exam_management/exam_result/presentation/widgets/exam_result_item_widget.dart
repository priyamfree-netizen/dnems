import 'package:flutter/material.dart';
import 'package:mighty_school/common/widget/custom_contaner.dart';
import 'package:mighty_school/common/widget/custom_item_text_widget.dart';
import 'package:mighty_school/common/widget/numbering_widget.dart';
import 'package:mighty_school/feature/exam_management/exam_result/domain/models/exam_result_model.dart';
import 'package:mighty_school/helper/responsive_helper.dart';
import 'package:mighty_school/util/dimensions.dart';

class ExamResultItemWidget extends StatelessWidget {
  final ExamResultItem? resultItem;
  final int index;
  const ExamResultItemWidget({super.key, this.resultItem, required this.index});

  @override
  Widget build(BuildContext context) {
    return ResponsiveHelper.isDesktop(context)?
    Row(spacing: Dimensions.paddingSizeDefault, children: [
      NumberingWidget(index: index),
      Expanded(child: CustomItemTextWidget(text: resultItem?.studentName ??'N/A')),
      Expanded(child: CustomItemTextWidget(text: resultItem?.roll ??'N/A')),
      Expanded(child: CustomItemTextWidget(text: resultItem?.gpa.toString()??'')),
      Expanded(child: CustomItemTextWidget(text: resultItem?.grade??'')),
      Expanded(child: CustomItemTextWidget(text: resultItem?.totalMarks.toString()??'')),
    ],):
    CustomContainer(child: Column(children: [
        CustomItemTextWidget(text: resultItem?.studentName??''),
        CustomItemTextWidget(text: resultItem?.roll??''),
        CustomItemTextWidget(text: resultItem?.gpa.toString()??''),
        CustomItemTextWidget(text: resultItem?.grade??""),
        CustomItemTextWidget(text: resultItem?.totalMarks.toString()??""),
      ],
    ),);
  }
}
