import 'package:get/get_connect/http/src/response/response.dart';
import 'package:mighty_school/api_handle/api_client.dart';
import 'package:mighty_school/util/app_constants.dart';

class QuestionBankClassRepository {
  final ApiClient apiClient;

  QuestionBankClassRepository({required this.apiClient});
  
  Future<Response?> getQuestionBankClass(int page) async {
    return await apiClient.getData("${AppConstants.questionBankClass}?perPage=20&page=$page");
  }

  Future<Response?> createQuestionBankClass(String name) async {
    return await apiClient.postData(AppConstants.questionBankClass , {"name" : name});
  }

  Future<Response?> editQuestionBankClass(int id, String name) async {
    return await apiClient.postData("${AppConstants.questionBankClass}/$id", {"id" : id, "name" : name, "_method" : "PUT"});
  }

  Future<Response?> deleteQuestionBankClass(int id) async {
    return await apiClient.deleteData("${AppConstants.questionBankClass}/$id");
  }
}
  