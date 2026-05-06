import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_school/common/widget/custom_item_text_widget.dart';
import 'package:mighty_school/common/widget/numbering_widget.dart';
import 'package:mighty_school/feature/package_plan/domain/models/package_model.dart';
import 'package:mighty_school/helper/price_converter.dart';
import 'package:mighty_school/util/dimensions.dart';

class PackageItemWidget extends StatelessWidget {
  final PackageItem? packageItem;
  final int index;
  const PackageItemWidget({super.key, this.packageItem, required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(spacing: Dimensions.paddingSizeDefault, children: [
      NumberingWidget(index: index),
        Expanded(child: CustomItemTextWidget(text:"${packageItem?.name}")),
        Expanded(child: CustomItemTextWidget(text: packageItem?.description??'N/A')),
        Expanded(child: CustomItemTextWidget(text: PriceConverter.convertPrice(context, packageItem?.price ?? 0))),
        Expanded(child: CustomItemTextWidget(text: "${packageItem?.durationDays?.toString()??'0'} ${"days".tr}")),

      ],);
  }
}