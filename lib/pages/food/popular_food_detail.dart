// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:foodies_palpa/controllers/popular_product_controller.dart';
import 'package:foodies_palpa/pages/home/main_food_page.dart';
import 'package:foodies_palpa/utils/app_constants.dart';
import 'package:foodies_palpa/utils/colors.dart';
import 'package:foodies_palpa/utils/dimensions.dart';
import 'package:foodies_palpa/widgets/app_column.dart';
import 'package:foodies_palpa/widgets/app_icon.dart';
import 'package:foodies_palpa/widgets/big_text.dart';
import 'package:foodies_palpa/widgets/expandable_text.dart';
import 'package:get/get.dart';

class PopularFoodDetail extends StatelessWidget {
  final int pageId;

  const PopularFoodDetail({
    Key? key,
    required this.pageId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<PopularProductController>().popularProductList[pageId];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        //Background image

        Positioned(
          left: 0,
          right: 0,
          child: Container(
            width: double.maxFinite,
            height: Dimensions.popularfoodImgSize,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(AppConstants.baseUrl +
                    AppConstants.uploadUrl +
                    product.img!),
              ),
            ),
          ),
        ),

        //Icon Widget

        Positioned(
          top: Dimensions.height45,
          left: Dimensions.width20,
          right: Dimensions.width20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                  onTap: () {
                    Get.to(() => MainFoodPage());
                  },
                  child: AppIcon(icon: Icons.arrow_back_ios)),
              AppIcon(icon: Icons.shopping_cart_checkout_outlined),
            ],
          ),
        ),
        // introduction of food
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          top: Dimensions.popularfoodImgSize - Dimensions.height45,
          child: Container(
            padding: EdgeInsets.only(
                left: Dimensions.width20,
                right: Dimensions.width20,
                top: Dimensions.height20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(Dimensions.radius20),
                  topLeft: Radius.circular(Dimensions.radius20)),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppColumn(text: product.name!),
                SizedBox(height: Dimensions.height10),
                BigText(text: "Introduce"),
                SizedBox(height: Dimensions.height10),

                // Expandable text widget
                Expanded(
                    child: SingleChildScrollView(
                  child: ExpandableTextWidget(text: product.description!),
                ))
              ],
            ),
          ),
        )
      ]),
      bottomNavigationBar: Container(
        height: Dimensions.bottomHeightBar,
        padding: EdgeInsets.only(
            top: Dimensions.height30,
            bottom: Dimensions.height30,
            left: Dimensions.width20,
            right: Dimensions.width20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(Dimensions.radius20 * 2),
              topLeft: Radius.circular(Dimensions.radius20 * 2)),
          color: AppColors.buttonBackgroundColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Add or Remove Number of Product
            Container(
              padding: EdgeInsets.only(
                  top: Dimensions.height20,
                  bottom: Dimensions.height20,
                  left: Dimensions.width20,
                  right: Dimensions.width20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white,
              ),
              child: Row(children: [
                const Icon(Icons.remove, color: AppColors.signColor),
                SizedBox(width: Dimensions.width10 / 2),
                BigText(text: "0"),
                SizedBox(width: Dimensions.width10 / 2),
                const Icon(Icons.add, color: AppColors.signColor),
              ]),
            ),
            Container(
              padding: EdgeInsets.only(
                  top: Dimensions.height20,
                  bottom: Dimensions.height20,
                  left: Dimensions.width20,
                  right: Dimensions.width20),
              child: BigText(
                text: "\$10 | Add to Cart",
                color: Colors.white,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: AppColors.mainColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
