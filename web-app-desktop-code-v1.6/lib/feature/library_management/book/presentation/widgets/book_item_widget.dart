import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_school/common/layout/custom_dialog_widget.dart';
import 'package:mighty_school/common/widget/confirmation_dialog.dart';
import 'package:mighty_school/common/widget/custom_contaner.dart';
import 'package:mighty_school/common/widget/custom_item_text_widget.dart';
import 'package:mighty_school/common/widget/custom_popup_menu.dart';
import 'package:mighty_school/common/widget/numbering_widget.dart';
import 'package:mighty_school/feature/dashboard/controller/dashboard_controller.dart';
import 'package:mighty_school/feature/library_management/book/controller/book_controller.dart';
import 'package:mighty_school/feature/library_management/book/domain/model/book_model.dart';
import 'package:mighty_school/feature/library_management/book/presentation/widgets/create_new_book_widget.dart';
import 'package:mighty_school/helper/responsive_helper.dart';
import 'package:mighty_school/util/dimensions.dart';

class BookItemWidget extends StatelessWidget {
  final BookItem? bookItem;
  final int index;

  const BookItemWidget({super.key, required this.bookItem, required this.index});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<BookController>();

    if (ResponsiveHelper.isDesktop(context)) {
      return Row(spacing: Dimensions.paddingSizeDefault, children: [
        NumberingWidget(index: index),
        Expanded(child: CustomItemTextWidget(text: bookItem?.bookName ?? 'N/A')),
        Expanded(child: CustomItemTextWidget(text: bookItem?.category ?? 'N/A')),
        Expanded(child: CustomItemTextWidget(text: bookItem?.code ?? 'N/A')),
        Expanded(child: CustomItemTextWidget(text: bookItem?.author ?? 'N/A')),
        Expanded(child: CustomItemTextWidget(text: bookItem?.publisher ?? 'N/A')),
        Expanded(child: CustomItemTextWidget(text: bookItem?.bookCopyNo ?? 'N/A')),
        Expanded(child: CustomItemTextWidget(text: bookItem?.provider ?? 'N/A')),
        Expanded(child: CustomItemTextWidget(text: bookItem?.bookself ?? 'N/A')),
        Expanded(child: CustomItemTextWidget(text: bookItem?.rack ?? 'N/A')),

          CustomPopupMenu(menuItems: Get.find<DashboardController>().getPopupMenuList(editDelete: true),
          onSelected: (option) {
            if (option.title == "edit".tr) {
              _onEdit();
            } else if (option.title == "delete".tr) {
              _onDelete(controller);
            }
    }, child: Icon(Icons.more_vert_rounded, color: Theme.of(context).hintColor)),
      ]);
    }

    return Padding(padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeExtraSmall),
      child: CustomContainer(borderRadius: Dimensions.paddingSizeExtraSmall,
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Expanded(child: Column(
              children: [
                CustomItemTextWidget(text: bookItem?.bookName ?? 'N/A'),
                CustomItemTextWidget(text: bookItem?.category ?? 'N/A'),
                CustomItemTextWidget(text: bookItem?.code ?? 'N/A'),
                CustomItemTextWidget(text: bookItem?.author ?? 'N/A'),
                CustomItemTextWidget(text: bookItem?.publisher ?? 'N/A'),
                CustomItemTextWidget(text: bookItem?.bookCopyNo ?? 'N/A'),
                CustomItemTextWidget(text: bookItem?.provider ?? 'N/A'),
                CustomItemTextWidget(text: bookItem?.bookself ?? 'N/A'),
                CustomItemTextWidget(text: bookItem?.rack ?? 'N/A'),

              ],
            )),

          CustomPopupMenu(menuItems: Get.find<DashboardController>().getPopupMenuList(editDelete: true),
              onSelected: (option) {
                if (option.title == "edit".tr) {
                  _onEdit();
                } else if (option.title == "delete".tr) {
                  _onDelete(controller);
                }
              }, child: Icon(Icons.more_vert_rounded, color: Theme.of(context).hintColor)),])),
    );
  }

  void _onDelete(BookController controller) {
    Get.dialog(ConfirmationDialog(title: "book".tr,
      content: "book".tr,
      onTap: () {
      Get.back();
      if (bookItem?.id != null) {
        controller.deleteBook(bookItem!.id!);
      }
      }),
    );
  }

  void _onEdit() {
    Get.dialog(CustomDialogWidget(title: "book".tr,width: 900,
        child: CreateNewBookWidget(bookItem: bookItem)));
  }
}
