import 'package:get/get_connect/http/src/response/response.dart';
import 'package:mighty_school/api_handle/api_client.dart';
import 'package:mighty_school/feature/account_management/contra/domain/model/contra_model.dart';
import 'package:mighty_school/util/app_constants.dart';

class ContraRepository{
  final ApiClient apiClient;
  ContraRepository({required this.apiClient});


  Future<Response?> contraTransfer(ContraBody body) async {
    return await apiClient.postData(AppConstants.contraTransfer, body.toJson());
  }

}