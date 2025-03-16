import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproduct/app_theme.dart';
import 'package:myproduct/widgets/components/shimmerLoader.dart';

class MyButton extends StatelessWidget {
  final String text;
  final double? width;
  final double? tsize;
  bool? fixedPosition;
  final double? height;
  final Color? bgcolor;
  Color? loadingColor;
  final Color? tcolor;
  final bool? allowShadow;
  final double? radius;
  final Color? borderColor;
  final bool isLoading;
  final bool disable;
  final bool? isColumn;
  Widget? icon;
  final FontWeight? fontWeight;
  final MainAxisAlignment? mainAlign;

  final Function() ontap;

  MyButton(
      {super.key,
      this.icon,
      this.radius,
      this.fixedPosition,
      this.borderColor,
      this.loadingColor,
      this.allowShadow,
      required this.disable,
      required this.isLoading,
      required this.text,
      this.mainAlign,
      this.width,
      this.isColumn,
      this.fontWeight,
      this.height,
      this.bgcolor,
      this.tcolor,
      required this.ontap,
      this.tsize});

  @override
  Widget build(BuildContext context) {
  final widthGet = width ?? MediaQuery.sizeOf(context).width;
    return GestureDetector(
      onTap: disable ? () {} : ontap,
      child: Container(
        height: height ?? 50,
        width:widthGet ,
        decoration: BoxDecoration(
            boxShadow: (allowShadow ?? false)
                ? [
                    // BoxShadow(
                    //   color: Colors.grey.withOpacity(0.5),
                    //   spreadRadius: 2,
                    //   blurRadius: 10,
                    //   offset: Offset(0, 5), // changes position of shadow
                    // ),
                    BoxShadow(
                      color: Colors.white.withOpacity(1),
                      spreadRadius: 10,
                      blurRadius: 10,
                      offset: const Offset(0, 1), // changes position of shadow
                    ),
                  ]
                : null,
            border:
                borderColor != null ? Border.all(color: borderColor!) : null,
            color: disable ? Colors.grey.withOpacity(0.3) : bgcolor,
            borderRadius: BorderRadius.circular(radius ?? 10)),
        child: isLoading
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ShimmerLoading(
                    color: loadingColor ?? Colors.white,
                  ),
                ],
              )
            : fixedPosition==true ? 

             Row(children: [
              SizedBox(
                width: (widthGet)*0.5,
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [Text(
                    text,
                    style: AppTheme.bodyLarge.copyWith(
                        fontWeight: fontWeight ?? FontWeight.normal,
                        color: disable
                            ? Colors.grey.withOpacity(0.8)
                            : tcolor ?? Colors.white,
                        fontSize: tsize),
                  ),],) ,
              ),
              SizedBox(
                width: (widthGet)*0.3,
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                       if (icon != null) icon!,
                    
                    ],) ,
              ),

             ],)  
            
            :  Row(
                mainAxisAlignment: mainAlign ?? MainAxisAlignment.center,
                children: [
                  Text(
                    text,
                    style: AppTheme.bodyLarge.copyWith(
                        fontWeight: fontWeight ?? FontWeight.normal,
                        color: disable
                            ? Colors.grey.withOpacity(0.8)
                            : tcolor ?? Colors.white,
                        fontSize: tsize),
                  ),
                  20.horizontalSpace,
                  if (icon != null) icon!,
                ],
              ),
      ),
    );
  }
}
