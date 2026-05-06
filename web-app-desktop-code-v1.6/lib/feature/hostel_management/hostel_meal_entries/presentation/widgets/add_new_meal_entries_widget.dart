import 'package:flutter/material.dart';
import 'package:mighty_school/common/controller/datepicker_controller.dart';
import 'package:mighty_school/common/widget/custom_button.dart';
import 'package:mighty_school/common/widget/custom_snackbar.dart';
import 'package:mighty_school/common/widget/custom_text_field.dart';
import 'package:mighty_school/common/widget/date_selection_widget.dart';
import 'package:mighty_school/common/widget/responsive_grid_widget.dart';
import 'package:mighty_school/feature/academic_configuration/class/presentation/widgets/select_class_widget.dart';
import 'package:mighty_school/feature/academic_configuration/section/presentation/widgets/select_section_widget.dart';
import 'package:mighty_school/feature/hostel_management/hostel_meal_entries/domain/model/hostel_meal_entry_body.dart';
import 'package:mighty_school/feature/hostel_management/hostel_meal_entries/domain/model/hostel_meal_entry_model.dart';
import 'package:mighty_school/feature/hostel_management/hostel_meal_entries/logic/hostel_meal_entries_controller.dart';
import 'package:mighty_school/feature/hostel_management/hostel_meals/logic/hostel_meals_controller.dart';
import 'package:mighty_school/feature/hostel_management/hostel_meals/presentation/widgets/select_meal_widget.dart';
import 'package:mighty_school/feature/students_information/student/controller/student_controller.dart';
import 'package:mighty_school/feature/students_information/student/presentation/widgets/select_student_widget.dart';
import 'package:mighty_school/util/app_constants.dart';
import 'package:mighty_school/util/dimensions.dart';
import 'package:get/get.dart';

class AddNewHostelMealEntriesWidget extends StatefulWidget {
  final HostelMealEntryItem? mealEntryItem;
  const AddNewHostelMealEntriesWidget({super.key, this.mealEntryItem});

  @override
  State<AddNewHostelMealEntriesWidget> createState() => _AddNewHostelMealEntriesWidgetState();
}

class _AddNewHostelMealEntriesWidgetState extends State<AddNewHostelMealEntriesWidget> {
  TextEditingController priceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column( spacing: Dimensions.paddingSizeDefault, children: [

      ResponsiveMasonryGrid(children: [
        const SelectClassWidget(),
        const SelectSectionWidget(),
        const SelectStudentWidget(),
        const SelectMealWidget(),
        const DateSelectionWidget(),
        CustomTextField(controller: priceController,
          title: "price".tr,
          hintText: "enter_price".tr,
          inputType: TextInputType.number,
          inputFormatters: [AppConstants.numberFormat],
        ),


      ]),



      GetBuilder<HostelMealEntriesController>(builder: (mealEntryController) {
        return CustomButton(text: "confirm".tr, onTap: (){
          int? studentId = Get.find<StudentController>().selectedStudentItem?.id;
          int? mealId = Get.find<HostelMealsController>().selectedMealItem?.id;
          String date = Get.find<DatePickerController>().formatedDate;
          String price = priceController.text.trim();
          if(studentId == null){
            showCustomSnackBar("select_student".tr);
          }else if(mealId == null) {
            showCustomSnackBar("select_meal".tr);
          }else if(price.isEmpty){
            showCustomSnackBar("price_is_required".tr);
          }
          else{
            HostelMealEntryBody mealPlanBody = HostelMealEntryBody(
                studentId: studentId,
                mealId: mealId,
                mealPrice: price,
                date: date);
            if(widget.mealEntryItem != null){
              mealEntryController.editHostelMealEntries(widget.mealEntryItem!.id!, mealPlanBody);
            }else {
              mealEntryController.createHostelMealEntries(mealPlanBody);
            }
          }
        });
      }
      ),
    ],
    );
  }
}
