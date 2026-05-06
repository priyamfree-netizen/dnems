import 'package:get/get.dart';
import 'package:mighty_school/feature/profile/logic/profile_controller.dart';

class PermissionHelper {
  static bool hasPermission(String permission) {
    final controller = Get.find<ProfileController>();
    return controller.hasPermission(permission);
  }

}