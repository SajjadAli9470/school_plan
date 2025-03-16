
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproduct/bloc_state/ThemeState/theme_switch_bloc.dart';
import 'package:myproduct/widgets/components/myText.dart';

class SocialBox extends StatelessWidget {
  final String label;
  final String? centerWord;
  final bool showIconOnly;
  final double? width;
  final double? height;
  final double? radius;
  Function() ontap;
  final bool disable;
  SocialBox(
      {super.key,
      required this.label,
      required this.disable,
      this.radius,
      required this.ontap,
      this.centerWord,
      required this.showIconOnly,
      this.width,
      this.height});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeSwitchBloc, ThemeSwitchState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: disable ? () {} : ontap,
          child: Opacity(
            opacity: disable ? 0.3 : 1,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
              width: width ?? MediaQuery.sizeOf(context).width * 0.7,
              // height: height ?? 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(radius ?? 10),
                  border:
                      Border.all(color: state.selected.grey.withOpacity(0.3))),
              child: showIconOnly
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                            height: 20,
                            "assets/talent/auth/${label.toLowerCase()}.png"),
                        if (!showIconOnly)
                          Container(
                            child: Row(
                              children: [
                                10.verticalSpace,
                                Container(
                                  width: (width ??
                                          MediaQuery.sizeOf(context).width *
                                              0.7) *
                                      0.7,
                                  child: MyText(
                                    text:
                                        "Continue ${centerWord ?? "with"} ${label}",
                                    fw: FontWeight.bold,
                                    tsize: 15.sp,
                                    isAutoSize: true,
                                  ),
                                ),
                              ],
                            ),
                          )
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: (width ??
                                  MediaQuery.sizeOf(context).width * 0.7) *
                              0.15,
                        ),
                        Image.asset(
                            height: 20,
                            "assets/talent/auth/${label.toLowerCase()}.png"),
                        if (!showIconOnly)
                          Container(
                            child: Row(
                              children: [
                                10.horizontalSpace,
                                Container(
                                  width: (width ??
                                          MediaQuery.sizeOf(context).width *
                                              0.7) *
                                      0.7,
                                  child: MyText(
                                    text:
                                        "Continue ${centerWord ?? "with"} ${label}",
                                    fw: FontWeight.bold,
                                    tsize: 13.sp,
                                    isAutoSize: true,
                                  ),
                                ),
                              ],
                            ),
                          )
                      ],
                    ),
            ),
          ),
        );
      },
    );
  }
}
