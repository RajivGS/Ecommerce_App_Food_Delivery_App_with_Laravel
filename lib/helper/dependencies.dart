// once we create the class for api client we'll call that class inside init method adn then call init method from our main function

import 'package:foodies_palpa/controllers/cart_controller.dart';
import 'package:foodies_palpa/controllers/popular_product_controller.dart';
import 'package:foodies_palpa/controllers/recommended_product_controller.dart';
import 'package:foodies_palpa/data/repository/cart_repo.dart';
import 'package:foodies_palpa/data/repository/popular_product_repo.dart';
import 'package:foodies_palpa/data/repository/recommended_product_repo.dart';
import 'package:foodies_palpa/utils/app_constants.dart';
import 'package:get/get.dart';

import '../data/api/apiclient.dart';

Future<void> init() async {
//Api Client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.baseUrl));

// Repository
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo());

//Controllers
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(() => RecommendedProductController(
        recommendedProductRepo: Get.find(),
      ));
}
