import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_school/common/widget/custom_contaner.dart';
import 'package:mighty_school/feature/authentication/logic/authentication_controller.dart';
import 'package:mighty_school/feature/parent_module/parents/logic/menu_controller.dart';
import 'package:mighty_school/helper/route_helper.dart';
import 'package:mighty_school/util/dimensions.dart';
import 'package:mighty_school/util/styles.dart';

class MainMenuItemWidget extends StatelessWidget {
  final MenuItemModel item;
  final bool isLogout;
  const MainMenuItemWidget({super.key, required this.item, this.isLogout = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: item.route != null ?(){
      Get.toNamed(item.route!);
    } : (){
      Get.find<AuthenticationController>().clearSharedData();
        Get.offAndToNamed(RouteHelper.getSignInRoute());
    },
      child: CustomContainer(showShadow: false, horizontalPadding: 5, verticalPadding: 10,
        borderRadius: 5,border: Border.all(width: .12, color: Theme.of(context).primaryColor),
        child: Column(spacing: Dimensions.paddingSizeSmall, children: [
          CustomContainer(
            showShadow: false,
            horizontalPadding: 8, verticalPadding: 7, borderRadius: Dimensions.paddingSizeExtraSmall,
            color: Get.isDarkMode? Theme.of(context).highlightColor : Theme.of(context).primaryColor.withValues(alpha: .125),
            child: Icon(item.icon,size: Dimensions.iconSizeExtraLarge, color: Get.isDarkMode? Colors.white : Theme.of(context).primaryColor,),),
          Text(item.title.tr, style: textRegular.copyWith( fontSize: Dimensions.fontSizeSmall,
             height: 1.2),
            maxLines: 2, overflow: TextOverflow.ellipsis,textAlign: TextAlign.center,)
        ],
        ),
      ),
    );
  }
}
