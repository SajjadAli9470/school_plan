
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:myproduct/app_theme.dart';

class MyText extends StatelessWidget {
  final int? maxlines;
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
  Function()? ontap;
  MyText(
      {super.key,
      required this.text,
      this.width,
      this.ontap,
      this.maxlines,
      this.tsize,
      this.theight,
      this.height,
      this.tcolor,
      this.radius,
      this.align,
      this.fw,
      this.overflow,
      this.isAutoSize});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: height,
        width: width,
        child: (isAutoSize ?? false)
            ? AutoSizeText(
                text,
                maxLines: maxlines ?? null,
                style: AppTheme.bodyLarge.copyWith(
                  color: tcolor,
                  fontSize: tsize,
                  height: theight,
                  fontWeight: fw ?? FontWeight.normal,
                  overflow: overflow,
                ),
                textAlign: align ?? TextAlign.left,
              )
            : Text(
                text,
                maxLines: maxlines ?? null,
                style: AppTheme.bodyLarge.copyWith(
                  height: theight,
                  color: tcolor,
                  fontSize: tsize,
                  fontWeight: fw ?? FontWeight.normal,
                  overflow: overflow,
                ),
                textAlign: align ?? TextAlign.left,
              ),
      ),
    );
  }
}
