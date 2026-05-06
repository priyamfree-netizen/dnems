import 'package:get/get_connect/http/src/response/response.dart';
import 'package:mighty_school/api_handle/api_client.dart';
import 'package:mighty_school/util/app_constants.dart';

class QuestionBankChapterRepository {
  final ApiClient apiClient;

  QuestionBankChapterRepository({required this.apiClient});
  
  Future<Response?> getQuestionBankChapter(int page, {int? subjectId}) async {
    return await apiClient.getData("${AppConstants.questionBankChapter}?page=$page&perPage=100&subject_id=$subjectId");
  }

  Future<Response?> createQuestionBankChapter(String name, int subjectId) async {
    return await apiClient.postData(AppConstants.questionBankChapter, {"name": name, "subject_id": subjectId});
  }

  Future<Response?> editQuestionBankChapter(String name, int subjectId, int id) async {
    return await apiClient.postData("${AppConstants.questionBankChapter}/$id", {"name": name, "subject_id": subjectId, "_method": "put"});
  }

  Future<Response?> deleteQuestionBankChapter(int id) async {
    return await apiClient.deleteData("${AppConstants.questionBankChapter}/$id");
  }
}
  