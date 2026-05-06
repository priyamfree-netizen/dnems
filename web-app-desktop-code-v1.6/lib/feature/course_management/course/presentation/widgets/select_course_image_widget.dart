import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_school/common/widget/custom_image.dart';
import 'package:mighty_school/feature/course_management/course/logic/course_controller.dart';
import 'package:mighty_school/util/dimensions.dart';
import 'package:mighty_school/util/images.dart';

class SelectCourseImageWidget extends StatelessWidget {
  final String? imageUrl;
  const SelectCourseImageWidget({super.key, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<CourseController>(
      builder: (courseController) {
        return InkWell(onTap: ()=> courseController.pickImage(),
          child: Stack(children: [
            ClipRRect(borderRadius: BorderRadius.circular(Dimensions.paddingSizeSmall),
                child: courseController.thumbnail != null ?  GetPlatform.isWeb? Image.network((courseController.thumbnail!.path),
                  width: Dimensions.categoryImageSize, height: Dimensions.categoryImageSize, fit: BoxFit.cover,):
                Image.file(File(courseController.thumbnail!.path),
                  width: Dimensions.categoryImageSize, height: Dimensions.categoryImageSize, fit: BoxFit.cover,):
                 CustomImage(image: imageUrl, height: Dimensions.categoryImageSize,
                     width: Dimensions.categoryImageSize, placeholder: Images.imagePickerIcon)),

          ]),
        );
      }
    );
  }
}
