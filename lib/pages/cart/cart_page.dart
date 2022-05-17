import 'package:flutter/material.dart';
import 'package:foodies_palpa/controllers/cart_controller.dart';
import 'package:foodies_palpa/pages/home/main_food_page.dart';
import 'package:foodies_palpa/utils/app_constants.dart';
import 'package:foodies_palpa/utils/colors.dart';
import 'package:foodies_palpa/utils/dimensions.dart';
import 'package:foodies_palpa/widgets/app_icon.dart';
import 'package:foodies_palpa/widgets/big_text.dart';
import 'package:foodies_palpa/widgets/small_text.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //************Back Home and Cart Icon **************/
          Positioned(
            left: Dimensions.width20,
            right: Dimensions.width20,
            top: Dimensions.height20 * 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.arrow_back,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  iconSize: Dimensions.iconSize24,
                ),
                SizedBox(width: Dimensions.width20 * 5),
                GestureDetector(
                  onTap: (() {
                    Get.to(() => MainFoodPage());
                  }),
                  child: AppIcon(
                    icon: Icons.home_outlined,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    iconSize: Dimensions.iconSize24,
                  ),
                ),
                AppIcon(
                  icon: Icons.shopping_cart,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  iconSize: Dimensions.iconSize24,
                )
              ],
            ),
          ),
          //************ List of Products in Cart **************/
          Positioned(
            top: Dimensions.height20 * 5.5,
            left: Dimensions.width20,
            right: Dimensions.width20,
            bottom: 0,
            child: SizedBox(
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: GetBuilder<CartController>(builder: (cartController) {
                  return ListView.builder(
                      itemCount: cartController.getItems.length,
                      itemBuilder: (_, index) {
                        return Container(
                          margin: EdgeInsets.only(top: Dimensions.height15),
                          height: 100,
                          width: double.maxFinite,
                          child: Row(
                            children: [
                              //************** List Image **************/
                              Container(
                                width: Dimensions.height20 * 5,
                                height: Dimensions.height20 * 5,
                                margin: EdgeInsets.only(
                                    bottom: Dimensions.height10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.radius20),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(AppConstants.baseUrl +
                                        AppConstants.uploadUrl +
                                        cartController.getItems[index].img!),
                                  ),
                                ),
                              ),
                              SizedBox(width: Dimensions.width10),
                              // ************** Image List Details **************/
                              Expanded(
                                child: SizedBox(
                                  height: Dimensions.height20 * 5,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      BigText(
                                          text: cartController
                                              .getItems[index].name!,
                                          color: Colors.black54),
                                      SmallText(
                                          text: "Spicy", color: Colors.black54),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          BigText(
                                            text: cartController
                                                .getItems[index].price!
                                                .toString(),
                                            color: Colors.redAccent,
                                          ),
                                          //  ************** Add or Remove Number of Product from the Cart **************

                                          Container(
                                            padding: EdgeInsets.only(
                                              top: Dimensions.height10,
                                              bottom: Dimensions.height10,
                                              left: Dimensions.width10 / 3,
                                              right: Dimensions.width10 / 2.5,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      Dimensions.radius20),
                                              color: Colors.white,
                                            ),
                                            child: Row(children: [
                                              GestureDetector(
                                                  onTap: () {
                                                    //         popularProduct.setQuantity(false);
                                                  },
                                                  child: Icon(Icons.remove,
                                                      color:
                                                          AppColors.signColor)),
                                              SizedBox(
                                                  width:
                                                      Dimensions.width10 / 2.5),
                                              //show number of  product in the cart from inCartItem
                                              BigText(text: "0"),
                                              SizedBox(
                                                  width:
                                                      Dimensions.width10 / 2.5),
                                              GestureDetector(
                                                  onTap: () {
                                                    //           popularProduct.setQuantity(true);
                                                  },
                                                  child: Icon(Icons.add,
                                                      color:
                                                          AppColors.signColor)),
                                            ]),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      });
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
