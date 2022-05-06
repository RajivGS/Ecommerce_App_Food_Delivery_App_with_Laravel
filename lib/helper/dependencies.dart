// once we create the class for api client we'll call that class inside init method adn then call init method from our main function

import 'package:foodies_palpa/controllers/popular_product_controller.dart';
import 'package:foodies_palpa/controllers/recommended_product_controller.dart';
import 'package:foodies_palpa/data/repository/popular_product_repo.dart';
import 'package:foodies_palpa/data/repository/recommended_product_repo.dart';
import 'package:foodies_palpa/utils/app_constants.dart';
import 'package:get/get.dart';

import '../data/api/apiclient.dart';

Future<void> init() async {
//api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

// repos
  Get.lazyPut(() => PopularProductRepo(Get.find()));
  Get.lazyPut(() => RecommenededProductRepo(Get.find()));

//controllers
  Get.lazyPut(() => PopularProductController(Get.find()));
  Get.lazyPut(() => RecommendedProductController(Get.find()));
}
