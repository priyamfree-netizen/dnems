import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_school/common/widget/custom_button.dart';
import 'package:mighty_school/common/widget/custom_contaner.dart';
import 'package:mighty_school/common/widget/custom_snackbar.dart';
import 'package:mighty_school/feature/academic_configuration/class/controller/class_controller.dart';
import 'package:mighty_school/feature/academic_configuration/class/presentation/widgets/select_class_widget.dart';
import 'package:mighty_school/feature/academic_configuration/group/presentation/widgets/select_group_widget.dart';
import 'package:mighty_school/feature/exam_management/exam/presentation/widgets/exam_selection_widget.dart';
import 'package:mighty_school/feature/exam_management/exam_result/controller/exam_result_controller.dart';
import 'package:mighty_school/feature/exam_management/exam_result/presentation/widgets/result_summery_widget.dart';
import 'package:mighty_school/util/dimensions.dart';

class ExamResultSearchWidget extends StatelessWidget {
  const ExamResultSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<ExamResultController>(
      builder: (examResultController) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
          child: Column(
            children: [
              CustomContainer(
                child: Row(crossAxisAlignment: CrossAxisAlignment.end,  spacing : Dimensions.paddingSizeSmall, children: [
                  const Expanded(child: SelectClassWidget()),
                  const Expanded(child: SelectGroupWidget(callStudentApi: true)),
                  const Expanded(child: ExamSelectionWidget()),

                  Padding(padding: const EdgeInsets.only(bottom: 9),
                      child: SizedBox(width: 90, child: examResultController.isLoading?
                      const Center(child: CircularProgressIndicator()):
                      CustomButton(onTap: (){
                        if (Get.find<ClassController>().selectedClassItem?.id == null){
                          showCustomSnackBar("select_class".tr);
                        }
                        else{
                          examResultController.getExamResult(1);
                        }
                      }, text: "search".tr)))
                ],),
              ),
              if(examResultController.examResultModel != null)
              const ResultSummeryWidget()
            ],
          ),
        );
      }
    );
  }
}
