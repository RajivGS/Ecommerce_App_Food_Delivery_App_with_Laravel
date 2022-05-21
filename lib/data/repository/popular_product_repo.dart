import 'package:get/get_connect.dart';
import 'package:get/state_manager.dart';

import '../../utils/utilities.dart';
import '../data.dart';

class PopularProductRepo extends GetxService {
  final ApiClient apiClient;
  PopularProductRepo({required this.apiClient});

  Future<Response> getPopularProductList() async {
    return await apiClient.getData(AppConstants.popularProductUri);
  }
}
