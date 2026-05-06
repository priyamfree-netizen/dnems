import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_school/common/layout/custom_dialog_widget.dart';
import 'package:mighty_school/common/widget/confirmation_dialog.dart';
import 'package:mighty_school/common/widget/edit_delete_section.dart';
import 'package:mighty_school/common/widget/numbering_widget.dart';
import 'package:mighty_school/feature/question_bank/question_category/domain/model/question_category_model.dart';
import 'package:mighty_school/feature/question_bank/question_category/logic/question_category_controller.dart';
import 'package:mighty_school/feature/question_bank/question_category/presentation/widgets/create_new_question_category_widget.dart';
import 'package:mighty_school/util/dimensions.dart';
import 'package:mighty_school/util/styles.dart';


class QuestionCategoryItemWidget extends StatelessWidget {
  final QuestionCategoryItem? questionCategoryItem;
  final int index;
  const QuestionCategoryItemWidget({super.key, this.questionCategoryItem, required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(spacing: Dimensions.paddingSizeDefault, children: [
      NumberingWidget(index: index),
        Expanded(child: Text("${questionCategoryItem?.name}", style: textMedium.copyWith(fontSize: Dimensions.fontSizeSmall))),
        EditDeleteSection(horizontal: true, onEdit: (){
          Get.dialog(CustomDialogWidget(title: "question_category".tr,
              child: CreateNewQuestionCategoryWidget(questionCategoryItem: questionCategoryItem)));
        },
          onDelete: (){
          Get.dialog(ConfirmationDialog(
            title: "question_category",
              content: "question_category".tr,
              onTap: (){
              Get.back();
            Get.find<QuestionCategoryController>().deleteQuestionCategory(questionCategoryItem!.id!);
          }));

        },)
      ]);
  }
}