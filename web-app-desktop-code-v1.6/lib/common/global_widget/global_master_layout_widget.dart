import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_school/common/global_widget/logo_section.dart';
import 'package:mighty_school/common/global_widget/sidebar_footer_section_widget.dart';
import 'package:mighty_school/common/widget/custom_search.dart';
import 'package:mighty_school/feature/administrator/system_settings/controller/system_settngs_controller.dart';
import 'package:mighty_school/feature/profile/domain/model/profile_model.dart';
import 'package:mighty_school/feature/profile/logic/profile_controller.dart';
import 'package:mighty_school/feature/sidebar/controller/side_menu_bar_controller.dart';
import 'package:mighty_school/helper/responsive_helper.dart';
import 'package:mighty_school/util/app_constants.dart';
import 'package:mighty_school/util/dimensions.dart';

class GlobalSideMenu extends StatefulWidget {
  final Widget child;
  const GlobalSideMenu({super.key, required this.child});

  @override
  State<GlobalSideMenu> createState() => _GlobalSideMenuState();
}

class _GlobalSideMenuState extends State<GlobalSideMenu> {
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    Get.find<SystemSettingsController>().getGeneralSetting();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return GetBuilder<SideMenuBarController>(builder: (sideMenuController) {
      final bool isDesktop = ResponsiveHelper.isDesktop(context);

      return GetBuilder<SystemSettingsController>(builder: (systemSettingsController) {

        return GetBuilder<ProfileController>(builder: (profileController) {
          ProfileModel? profileModel = profileController.profileModel;
          String roleType = profileModel?.data?.role ?? '';
          Color sidebarColor = roleType == AppConstants.sassAdmin
              ? Theme.of(context).primaryColorDark
              : systemSettingsController.sidebarColor;



          log("role: $roleType");

          return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [


            if (isDesktop)
              AnimatedContainer(
                width: sideMenuController.isExpanded ? 265 : 0,
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOut,
                color: sidebarColor,
                child: sideMenuController.isExpanded ? Column(children: [

                  const LogoSection(),
                  Padding(padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: CustomSearch(hintText: "search".tr,
                          onSearch: () => sideMenuController.filterMenu(searchController.text),
                          onChange: (val) => sideMenuController.filterMenu(val), // Auto search
                          reset: () => sideMenuController.filterMenu(""),
                          searchController: searchController)),
                  const SizedBox(height: Dimensions.paddingSizeSmall),

                  Expanded(child: SingleChildScrollView(
                      child: Column(children: [
                        ...sideMenuController.sideMenuItems,
                      ]))),


                  SidebarFooterSectionWidget(roleType: roleType),
                ]) : null),


            Expanded(child: widget.child),
          ]);
          });
        });
      },
    );
  }
}
