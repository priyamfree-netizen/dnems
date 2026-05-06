import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_school/common/widget/custom_image.dart';
import 'package:mighty_school/feature/cms_management/cms_settings/controller/frontend_settings_controller.dart';
import 'package:mighty_school/helper/route_helper.dart';
import 'package:mighty_school/util/dimensions.dart';

class LogoSectionWidget extends StatelessWidget {
  const LogoSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FrontendSettingsController>(
      initState: (value){
        if(Get.find<FrontendSettingsController>().settingModel == null){
          Get.find<FrontendSettingsController>().getPublicSetting();
        }
      },
      builder: (settingController) {
        return InkWell(onTap: (){
          Get.toNamed(RouteHelper.getInitialRoute());
        }, child: Padding(padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeSmall),
          child: CustomImage(image: settingController.logo, height: 35),
        ));
      }
    );
  }
}
