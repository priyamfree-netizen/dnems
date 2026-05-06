import 'package:flutter/material.dart';
import 'package:mighty_school/common/widget/custom_item_text_widget.dart';
import 'package:mighty_school/common/widget/numbering_widget.dart';
import 'package:mighty_school/feature/administrator/notice/domain/models/user_log_model.dart';
import 'package:mighty_school/helper/date_converter.dart';
import 'package:mighty_school/util/dimensions.dart';

class UserLogItemWidget extends StatelessWidget {
  final UserLogItem? userLogItem;
  final int index;
  const UserLogItemWidget({super.key, this.userLogItem, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(spacing: Dimensions.paddingSizeExtraSmall, children: [
        Row(crossAxisAlignment: CrossAxisAlignment.start, spacing: Dimensions.paddingSizeSmall, children: [
          NumberingWidget(index: index),
          Expanded(child: CustomItemTextWidget(text: userLogItem?.user?.name??'')),
          Expanded(child: CustomItemTextWidget(text: userLogItem?.detail??'', maxLines: 4,)),
          Expanded(child: CustomItemTextWidget(text: DateConverter.dateTimeIs(DateTime.parse(userLogItem!.updatedAt!)))),
        ],
        ),
      ],
    );
  }
}
