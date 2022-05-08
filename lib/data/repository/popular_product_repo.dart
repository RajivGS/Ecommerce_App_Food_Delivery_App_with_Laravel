import 'package:foodies_palpa/data/api/apiclient.dart';
import 'package:foodies_palpa/utils/app_constants.dart';
import 'package:get/get_connect.dart';
import 'package:get/state_manager.dart';

class PopularProductRepo extends GetxService {
  final ApiClient apiClient;
  PopularProductRepo({required this.apiClient});

  Future<Response> getPopularProductList() async {
    return await apiClient.getData(AppConstants.popularProductUri);
  }
}
