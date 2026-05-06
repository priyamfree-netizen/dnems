import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_school/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:mighty_school/common/widget/custom_app_bar.dart';
import 'package:mighty_school/common/widget/section_header_with_path_widget.dart';
import 'package:mighty_school/feature/students_information/student_migration/presentation/widgets/student_branch_migration_widget.dart';
import 'package:mighty_school/util/dimensions.dart';

class StudentBranchMigrationScreen extends StatefulWidget {
  const StudentBranchMigrationScreen({super.key});

  @override
  State<StudentBranchMigrationScreen> createState() => _StudentBranchMigrationScreenState();
}

class _StudentBranchMigrationScreenState extends State<StudentBranchMigrationScreen> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: CustomAppBar(title: "student_branch_migration".tr),
        body: CustomWebScrollView(slivers: [

           SliverToBoxAdapter(child:
           Column(children: [
             SectionHeaderWithPath(sectionTitle: "student_branch_migration".tr),
               const Padding(padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
                 child: StudentBranchMigrationWidget(),
               ),
             ],
           ))
        ],),
    );
  }
}
