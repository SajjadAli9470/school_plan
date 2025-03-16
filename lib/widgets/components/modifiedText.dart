import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:myproduct/widgets/components/myText.dart';

class MyTextList extends StatelessWidget {
  List<MyModifiedText> list;
  MyTextList({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...list.map(
          (e) => MyText(
            ontap: e.ontap,
            text: e.text,
            align: e.align,
            fw: e.fw,
            height: e.height,
            isAutoSize: e.isAutoSize,
            radius: e.radius,
            overflow: e.overflow,
            tcolor: e.tcolor,
            theight: e.theight,
            tsize: e.tsize,
            width: e.width,
          ),
        )
      ],
    );
  }
}

class MyModifiedText {
  final String text;
  final double? width;
  final double? tsize;
  final double? height;
  final double? theight;
  final FontWeight? fw;
  final TextOverflow? overflow;
  final bool? isAutoSize;
  final Color? tcolor;
  final double? radius;
  final TextAlign? align;
  final Function()? ontap;

  MyModifiedText(
      {required this.text,
      this.width,
      this.tsize,
      this.height,
      this.theight,
      this.ontap,
      this.fw,
      this.overflow,
      this.isAutoSize,
      this.tcolor,
      this.radius,
      this.align});
}
