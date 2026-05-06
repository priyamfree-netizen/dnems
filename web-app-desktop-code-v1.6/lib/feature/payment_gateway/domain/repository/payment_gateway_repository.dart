import 'package:get/get_connect/http/src/response/response.dart';
import 'package:mighty_school/api_handle/api_client.dart';
import 'package:mighty_school/util/app_constants.dart';
import 'package:mighty_school/feature/payment_gateway/domain/model/payment_gateway_model.dart';


class PaymentGatewayRepository {
  final ApiClient apiClient;

  PaymentGatewayRepository({required this.apiClient});
  
  Future<Response?> getPaymentGateway() async {
    return await apiClient.getData(AppConstants.digitalPayment);
  }


  Future<Response?> editPaymentGateway(PaymentGatewayItem item) async {
    return await apiClient.postData("${AppConstants.digitalPayment}/${item.id}",item.toJson());
  }

  Future<Response?> updateStatus(int id) async {
    return await apiClient.getData("${AppConstants.schoolPaymentGatewayStatusUpdate}/$id");
  }



}
  