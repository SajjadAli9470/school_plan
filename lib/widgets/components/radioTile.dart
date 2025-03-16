
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproduct/bloc_state/ThemeState/theme_switch_bloc.dart';
import 'package:myproduct/widgets/components/customRadio.dart';
import 'package:myproduct/widgets/components/myText.dart';

class RadioTile extends StatelessWidget {
  final String value;
  final String group;
  String title;
  String? subtitle;
  Function(dynamic) ontap;
  RadioTile({
    Key? key,
    required this.value,
    required this.group,
    required this.title,
    this.subtitle,
    required this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeSwitchBloc, ThemeSwitchState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            ontap(value);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  width: 50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomRadio(
                        groupValue: group,
                        value: value,
                        onChanged: ontap,
                      )
                      // Radio(
                      //     activeColor: state.selected.primary_1,
                      //     value: value,
                      //     groupValue: group,
                      //     onChanged: ontap),
                    ],
                  )),
              Container(
                width: MediaQuery.sizeOf(context).width * 0.7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        MyText(
                          maxlines: 2,
                          text: title,
                          tsize: 15.sp,
                          fw: FontWeight.bold,
                        ),
                      ],
                    ),
                    10.verticalSpace,
                    MyText(
                      text: subtitle ?? '',
                      tsize: 13.sp,
                      fw: FontWeight.normal,
                      maxlines: 20,
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
