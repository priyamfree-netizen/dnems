

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_school/common/widget/custom_button.dart';
import 'package:mighty_school/common/widget/custom_contaner.dart';
import 'package:mighty_school/common/widget/date_selection_widget.dart';
import 'package:mighty_school/feature/sms/sent_sms/logic/sent_sms_controller.dart';
import 'package:mighty_school/util/dimensions.dart';

class SearchSmsReportWidget extends StatelessWidget {
  const SearchSmsReportWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
      child: CustomContainer(
        child: Row(crossAxisAlignment: CrossAxisAlignment.end, spacing: Dimensions.paddingSizeDefault,children: [
          Expanded(child: DateSelectionWidget(title: "from_date".tr)),
          Expanded(child: DateSelectionWidget(end: true, title: "to_date".tr)),
          SizedBox(width: 90, child: CustomButton(onTap: (){
            Get.find<SentSmsController>().getSmsReport(1);
          }, text: "search"),),
        ]),
      ),
    );
  }
}
