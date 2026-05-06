import 'package:get/get_connect/http/src/response/response.dart';
import 'package:mighty_school/api_handle/api_client.dart';
import 'package:mighty_school/feature/payroll_management/due/domain/model/due_payment_body.dart';
import 'package:mighty_school/util/app_constants.dart';

class DueRepository {
  final ApiClient apiClient;

  DueRepository({required this.apiClient});
  
  Future<Response?> getDue() async {
    return await apiClient.getData(AppConstants.dueSalaryPayment);
  }

  Future<Response?> duePayment(DuePaymentBody body) async {
    return await apiClient.postData(AppConstants.dueSalaryPayment, body.toJson());
  }

}
  