import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproduct/widgets/components/myText.dart';

class MyDivider extends StatelessWidget {
  String? text;
  Color? color;
  Color? tcolor;
  double? gap;
  double? width;
  double? tsize;
  MyDivider({
    Key? key,
    this.text,
    this.color,
    this.tcolor,
    this.gap,
    this.tsize,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: width ?? MediaQuery.sizeOf(context).width * 0.45,
            height: 3,
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: color ?? Colors.grey.withOpacity(0.3)))),
          ),
          // Divider(
          //   color: color,
          // ),
          if (text != null)
            Row(
              children: [
                (gap ?? 5).horizontalSpace,
                MyText(
                  text: text ?? '',
                  fw: FontWeight.bold,
                  tsize: tsize ?? 20,
                  tcolor: tcolor,
                ),
                (gap ?? 5).horizontalSpace,
              ],
            ),
          Container(
            width: width ?? MediaQuery.sizeOf(context).width * 0.45,
            height: 3,
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: color ?? Colors.grey.withOpacity(0.3)))),
          ),
        ],
      ),
    );
  }
}
