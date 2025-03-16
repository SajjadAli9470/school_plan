import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproduct/bloc_state/ThemeState/theme_switch_bloc.dart';
import 'package:myproduct/widgets/components/myText.dart';

class CustomFormField extends StatelessWidget {
  final Widget item;
  final String title;
  final String? subtitle;
  double? width;
  FontWeight? fw;
  CustomFormField(
      {super.key,
      this.subtitle,
      this.fw,
      required this.item,
      this.width,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeSwitchBloc, ThemeSwitchState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: width ?? MediaQuery.sizeOf(context).width * 0.85,
                  child: MyText(
                    text: title,
                    fw: fw ??FontWeight.bold,
                    tcolor: state.selected.black,
                    tsize: 15.sp,
                    maxlines: 2,
                  ),
                )
              ],
            ),
            10.verticalSpace,
            item,
            3.verticalSpace,
            if (subtitle != null)
              SizedBox(
                width: width ?? MediaQuery.sizeOf(context).width * 0.9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      child: MyText(
                        text: subtitle!,
                        tcolor: state.selected.black,
                        tsize: 9.sp,
                        maxlines: 1,
                      ),
                    )
                  ],
                ),
              ),
          ],
        );
      },
    );
  }
}
