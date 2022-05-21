import 'package:flutter/material.dart';

import '../utils/utilities.dart';
import 'widgets.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text: text, size: Dimensions.font26),
        SizedBox(height: Dimensions.height10),

        // Commenet Section
        Row(children: [
          Wrap(
              children: List.generate(
                  5,
                  (index) => const Icon(Icons.star,
                      color: AppColors.mainColor, size: 15))),
          SizedBox(width: Dimensions.height10),
          SmallText(text: "4.5"),
          SizedBox(width: Dimensions.height10),
          SmallText(text: "1287 "),
          SizedBox(width: Dimensions.width10),
          SmallText(text: "comments"),
        ]),
        SizedBox(height: Dimensions.height20),

        // Time and Distance
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
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
          ],
        )
      ],
    );
  }
}
