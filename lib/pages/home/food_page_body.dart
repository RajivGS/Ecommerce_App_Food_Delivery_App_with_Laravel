import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:foodies_palpa/utils/colors.dart';
import 'package:foodies_palpa/utils/dimensions.dart';
import 'package:foodies_palpa/widgets/app_column.dart';
import 'package:foodies_palpa/widgets/big_text.dart';
import 'package:foodies_palpa/widgets/icon__and_text._widget.dart';
import 'package:foodies_palpa/widgets/small_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currentPageValue = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = Dimensions.pageViewContainer;
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      //Slider Section
      SizedBox(
          height: Dimensions.pageView,
          child: PageView.builder(
            controller: pageController,
            itemCount: 5,
            itemBuilder: (context, index) {
              return _buildPageItem(index);
            },
          )),
      //dots
      DotsIndicator(
          dotsCount: 5,
          position: _currentPageValue,
          decorator: DotsDecorator(
              activeColor: AppColors.mainColor,
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)))),
      // Popular Text
      SizedBox(height: Dimensions.height30),
      Container(
        margin: EdgeInsets.only(left: Dimensions.width30),
        child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
          BigText(text: "Popular"),
          SizedBox(width: Dimensions.width10),
          Container(
            margin: const EdgeInsets.only(bottom: 3),
            child: BigText(text: ".", color: Colors.black26),
          ),
          SizedBox(width: Dimensions.width10),
          Container(
              margin: const EdgeInsets.only(bottom: 2),
              child: SmallText(text: "Food pairing", color: Colors.black26)),
        ]),
      ),
      //List of Food and Images

      ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 10,
        itemBuilder: ((context, index) {
          return Container(
            margin: EdgeInsets.only(
                left: Dimensions.width20,
                right: Dimensions.width20,
                bottom: Dimensions.height10),
            child: Row(
              children: [
                // Image Section
                Container(
                    height: Dimensions.listViewImgSize,
                    width: Dimensions.listViewImgSize,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius20),
                        color: Colors.white38,
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/image/food0.png")))),
                //Text Container
                Expanded(
                  child: Container(
                    height: Dimensions.listVireTextContainerSize,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(Dimensions.radius20),
                          bottomRight: Radius.circular(Dimensions.radius20)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: Dimensions.width10, right: Dimensions.width10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BigText(text: "Nutritious fruit meal in Nepal"),
                          SizedBox(height: Dimensions.height10),
                          SmallText(text: "With Nepalese Characteristics"),
                          SizedBox(height: Dimensions.height10),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconAndTextWidget(
                                    icon: Icons.circle_sharp,
                                    text: "Normal",
                                    iconColor: AppColors.iconColor1),
                                IconAndTextWidget(
                                    icon: Icons.location_on,
                                    text: "1.7Km",
                                    iconColor: AppColors.mainColor),
                                IconAndTextWidget(
                                    icon: Icons.access_time_rounded,
                                    text: "32min",
                                    iconColor: AppColors.iconColor2),
                              ]),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        }),
      ),
    ]);
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _currentPageValue.floor()) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTans = _height * (1 - currScale) / 2;

      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTans, 0);
    } else if (index == _currentPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
      var currTans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTans, 0);
    } else if (index == _currentPageValue.floor() - 1) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: _height,
            margin: EdgeInsets.symmetric(horizontal: Dimensions.width10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color: index.isEven
                    ? const Color(0xFF69c5df)
                    : const Color(0xFF9294cc),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/image/food0.png"),
                )),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextController,
              margin: EdgeInsets.symmetric(
                  horizontal: Dimensions.width30,
                  vertical: Dimensions.height15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xFFe8e8e8),
                      blurRadius: 5.0,
                      offset: Offset(0, 5),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(-5, 0),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(5, 0),
                    ),
                  ]),
              child: Container(
                  padding: EdgeInsets.symmetric(
                      vertical: Dimensions.height15,
                      horizontal: Dimensions.width15),
                  child: const AppColumn(
                    text: "Newari Side",
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
