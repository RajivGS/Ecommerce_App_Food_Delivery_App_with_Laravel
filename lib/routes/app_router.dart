// ignore_for_file: unnecessary_string_interpolations

import 'package:foodies_palpa/pages/food/popular_food_detail.dart';
import 'package:foodies_palpa/pages/food/recommended_food_detail.dart';
import 'package:get/get.dart';

import '../pages/home/main_food_page.dart';

class RouteHelper {
  static const String initial = '/';
  static const String popularFood = '/popular-food';
  static const String recommendedFood = '/recommended-food';

  static String getInitial() => '$initial';
  static String getPopularFood(
    int pageId,
  ) =>
      '$popularFood?pageId=$pageId';
  static String getRecommendedFood() => '$recommendedFood';

  static List<GetPage> routes = [
    GetPage(
      name: getInitial(),
      page: () => const MainFoodPage(),
    ),
    GetPage(
      name: popularFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        return PopularFoodDetail(pageId: int.parse(pageId!));
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
        name: getRecommendedFood(), page: () => const RecommendedFoodDetail()),
  ];
}
