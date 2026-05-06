
import 'package:flutter/material.dart';
import 'package:mighty_school/common/widget/custom_image.dart';
import 'package:mighty_school/feature/administrator/system_settings/controller/system_settngs_controller.dart';
import 'package:mighty_school/feature/profile/domain/model/profile_model.dart';
import 'package:mighty_school/feature/profile/logic/profile_controller.dart';
import 'package:mighty_school/helper/responsive_helper.dart';
import 'package:mighty_school/helper/route_helper.dart';
import 'package:mighty_school/util/dimensions.dart';
import 'package:get/get.dart';
import 'package:mighty_school/util/images.dart';

class LogoSection extends StatelessWidget {
  const LogoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
        initState: (val){
          if(Get.find<ProfileController>().profileModel == null){
            Get.find<ProfileController>().getProfileInfo();
          }
        },
      builder: (profileController) {
          bool isDesktop = ResponsiveHelper.isDesktop(context);
        return GetBuilder<SystemSettingsController>(
            builder: (systemSettingsController) {
              ProfileModel? profileModel = profileController.profileModel;
              String roleType = profileModel?.data?.role ?? '';
            return Center(child: InkWell(onTap: () => Get.toNamed(RouteHelper.getDashboardRoute()),
              child: Padding(padding: EdgeInsets.all(isDesktop? Dimensions.paddingSizeDefault : 0),
                child: roleType == "SAAS Admin"? const CustomImage(image: Images.logo, localAsset: true, height: 45,):
                CustomImage(height: 45, image: systemSettingsController.logoUrl,),
              ),
            ),
            );
          }
        );
      }
    );
  }
}
