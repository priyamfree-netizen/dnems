import 'package:get/get_connect/http/src/response/response.dart';
import 'package:mighty_school/api_handle/api_client.dart';
import 'package:mighty_school/util/app_constants.dart';

class QuestionCategoryRepository {
  final ApiClient apiClient;

  QuestionCategoryRepository({required this.apiClient});
  
  Future<Response?> getQuestionCategory(int page) async {
    return await apiClient.getData("${AppConstants.questionCategory}?page=$page");
  }

  Future<Response?> createQuestionCategory(String? name, String priority) async {
    return await apiClient.postData(AppConstants.questionCategory, {
      "name": name,
      "priority": priority,
    });
  }

  Future<Response?> editQuestionCategory(String? name, String priority, int id) async {
    return await apiClient.postData("${AppConstants.questionCategory}/$id",{
      "name": name,
      "priority": priority,
      "_method":"PUT"
    });
  }

  Future<Response?> deleteQuestionCategory(int id) async {
    return await apiClient.deleteData("${AppConstants.questionCategory}/$id");
  }
}
  