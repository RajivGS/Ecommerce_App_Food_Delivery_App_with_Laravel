import 'package:flutter/material.dart';
import 'package:foodies_palpa/pages/home/food_page_body.dart';
import 'package:foodies_palpa/utils/colors.dart';
import 'package:foodies_palpa/utils/dimensions.dart';
import 'package:foodies_palpa/widgets/big_text.dart';
import 'package:foodies_palpa/widgets/small_text.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //showing the header
          Container(
            margin: EdgeInsets.symmetric(
                vertical: Dimensions.height30, horizontal: Dimensions.width20),
            padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    BigText(text: "Nepal", color: AppColors.mainColor),
                    Row(
                      children: [
                        SmallText(text: "Tansen", color: Colors.black54),
                        const Icon(Icons.arrow_drop_down_rounded)
                      ],
                    ),
                  ],
                ),
                Center(
                  child: Container(
                    width: Dimensions.height45,
                    height: Dimensions.height45,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius15),
                        color: AppColors.mainColor),
                    child: const Icon(Icons.search, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          //showing the body
          const Expanded(
            child: SingleChildScrollView(
              child: FoodPageBody(),
            ),
          )
        ],
      ),
    );
  }
}
