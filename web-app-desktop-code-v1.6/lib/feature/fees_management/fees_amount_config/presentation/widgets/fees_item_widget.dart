import 'package:flutter/material.dart';
import 'package:mighty_school/common/widget/custom_item_text_widget.dart';
import 'package:mighty_school/common/widget/numbering_widget.dart';
import 'package:mighty_school/feature/fees_management/fees_amount_config/domain/model/fees_model.dart';
import 'package:mighty_school/helper/price_converter.dart';
import 'package:mighty_school/util/dimensions.dart';

class FeesItemWidget extends StatelessWidget {
  final FeesItem feesItem;
  final int index;
  const FeesItemWidget({super.key, required this.feesItem, required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(spacing: Dimensions.paddingSizeDefault, children: [
      NumberingWidget(index: index),
      Expanded(child: CustomItemTextWidget(text:'${feesItem.feeHead?.name}')),
      Expanded(child: CustomItemTextWidget(text:'${feesItem.classItem?.className}')),
      Expanded(child: CustomItemTextWidget(text:'${feesItem.section?.sectionName}')),
      Expanded(child: CustomItemTextWidget(text:'${feesItem.group?.groupName}')),
      Expanded(child: CustomItemTextWidget(text:PriceConverter.convertPrice(context, feesItem.feeAmount ?? 0))),
    ],
    );
  }
}
