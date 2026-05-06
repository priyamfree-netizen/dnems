import 'package:flutter/material.dart';
import 'package:mighty_school/common/widget/custom_text_field.dart';
import 'package:mighty_school/common/widget/numbering_widget.dart';
import 'package:mighty_school/feature/routine_management/exam_routine/domain/model/exam_routine_model.dart';
import 'package:mighty_school/util/dimensions.dart';
import 'package:mighty_school/util/styles.dart';

class ExamRoutineItemWidget extends StatelessWidget {
  final ExamRoutineItemBody? examRoutineItem;
  final int index;
  const ExamRoutineItemWidget({super.key, this.examRoutineItem, required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(spacing: Dimensions.paddingSizeSmall, children: [
      NumberingWidget(index: index),
      Expanded(child: Text('${examRoutineItem?.subjectName}', style: textRegular.copyWith())),
       Expanded(child: CustomTextField(controller: examRoutineItem?.dateController, hintText: "2024-12-21")),
       Expanded(child: CustomTextField(hintText: "10:00", controller: examRoutineItem?.startTimeController,)),
       Expanded(child: CustomTextField(hintText: "13:00",controller: examRoutineItem?.endTimeController,)),
       Expanded(child: CustomTextField(hintText: "101",controller: examRoutineItem?.roomController,)),

    ],
    );
  }
}
