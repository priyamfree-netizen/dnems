import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_school/common/layout/custom_dialog_widget.dart';
import 'package:mighty_school/common/widget/custom_contaner.dart';
import 'package:mighty_school/common/widget/numbering_widget.dart';
import 'package:mighty_school/feature/fees_management/paid_info/domain/model/paid_report_model.dart';
import 'package:mighty_school/feature/fees_management/paid_info/presentation/widgets/paid_details_info_widget.dart';
import 'package:mighty_school/helper/responsive_helper.dart';
import 'package:mighty_school/util/dimensions.dart';
import 'package:mighty_school/util/styles.dart';

class PaidReportItemWidget extends StatelessWidget {
  final PaidReportInfo? paidReportInfo;
  final int index;
  const PaidReportItemWidget({super.key, this.paidReportInfo, required this.index});

  @override
  Widget build(BuildContext context) {
    return ResponsiveHelper.isDesktop(context)?
    Row(spacing: Dimensions.paddingSizeSmall, children: [
      NumberingWidget(index: index),
      Expanded(child: Text('${paidReportInfo?.student?.registerNo}', style: textRegular.copyWith())),
      Expanded(child: Text('${paidReportInfo?.student?.firstName} ${paidReportInfo?.student?.lastName}', style: textRegular.copyWith())),
      Expanded(child: Text('${paidReportInfo?.invoiceId}', style: textRegular.copyWith())),
      Expanded(child: Text('${paidReportInfo?.totalPayable}', style: textRegular.copyWith())),
      Expanded(child: Text('${paidReportInfo?.totalPaid}', style: textRegular.copyWith())),

      IconButton(onPressed: ()=> Get.dialog(CustomDialogWidget(
        title: "details".tr,
          child: PaidDetailsInfoWidget(info: paidReportInfo,))),
        icon: Icon(Icons.arrow_forward_ios_rounded, size: 16,
          color: Theme.of(context).hintColor),
      ),

    ],):
    CustomContainer(borderRadius: Dimensions.paddingSizeExtraSmall,

      child: Column(spacing: Dimensions.paddingSizeSmall, children: [
        Text('${paidReportInfo?.student?.registerNo}', style: textRegular.copyWith()),
        Text('${paidReportInfo?.student?.firstName} ${paidReportInfo?.student?.lastName}',
            style: textRegular.copyWith()),
        Text('${paidReportInfo?.invoiceId}', style: textRegular.copyWith()),
        Text('${paidReportInfo?.totalPayable}', style: textRegular.copyWith()),
        Text('${paidReportInfo?.totalPaid}', style: textRegular.copyWith()),

        IconButton(onPressed: ()=> Get.dialog(CustomDialogWidget(
            title: "details".tr,
            child: PaidDetailsInfoWidget(info: paidReportInfo,))),
          icon: Icon(Icons.arrow_forward_ios_rounded, size: 16,
              color: Theme.of(context).hintColor),
        ),
      ],),
    );
  }
}
