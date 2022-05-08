import 'package:foodies_palpa/data/api/apiclient.dart';
import 'package:foodies_palpa/utils/app_constants.dart';
import 'package:get/get.dart';

class RecommenededProductRepo extends GetxService {
  final ApiClient apiClient;

  RecommenededProductRepo({required this.apiClient});

  Future<Response> getRecommendedProductList() async {
    return await apiClient.getData(AppConstants.recommendedProductUri);
  }
}
