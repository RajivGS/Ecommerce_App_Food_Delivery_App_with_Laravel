// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  final Color? color;
  final String text;
  TextOverflow overflow;

  double size;
  double height;
  SmallText({
    Key? key,
    this.color = const Color(0xff000000),
    required this.text,
    this.height = 1.2,
    this.overflow = TextOverflow.visible,
    this.size = 12,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: true,
      style: TextStyle(
        color: color,
        //overflow: overflow,
        fontWeight: FontWeight.w400,
        fontFamily: 'Roboto',
        fontSize: size,
        height: height,
      ),
    );
  }
}
