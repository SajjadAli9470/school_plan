// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:myproduct/bloc_state/ThemeState/theme_switch_bloc.dart';
import 'package:myproduct/widgets/components/myText.dart';

class NotificationTile extends StatelessWidget {
  String heading;
  String subtitle;
  NotificationTile({
    Key? key,
    required this.heading,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeSwitchBloc, ThemeSwitchState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              // Container(
              //   padding: EdgeInsets.all(5),
              //   width: 70,
              //   height: 70,
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(100),
              //       color: state.selected.primary_1.withOpacity(0.1)),
              //   child: Image.asset("assets/icons/speaker.png"),
              // ),
              // 10.horizontalSpace,
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      text: heading,
                      tsize: 16,
                      fw: FontWeight.bold,
                    ),
                    10.verticalSpace,
                    MyText(
                      text: subtitle,
                      tsize: 13,
                      fw: FontWeight.bold,
                      tcolor: state.selected.grey,
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
