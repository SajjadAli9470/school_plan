// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:myproduct/bloc_state/ThemeState/theme_switch_bloc.dart';
import 'package:myproduct/widgets/components/myText.dart';

class DashboardSmallContainer extends StatelessWidget {
  String heading;
  String value;
  Color bgColor;
  DashboardSmallContainer({
    super.key,
    required this.heading,
    required this.value,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeSwitchBloc, ThemeSwitchState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          width: MediaQuery.sizeOf(context).width * 0.42,
          decoration: BoxDecoration(
            
              borderRadius: BorderRadius.circular(15), color: bgColor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(
                text: heading,
                tsize: 13,
                tcolor: state.selected.black.withOpacity(0.7),
              ),
              10.verticalSpace,
              MyText(
                text: value,
                tsize: 20,
                fw: FontWeight.w600,
                tcolor: state.selected.black,
              ),
            ],
          ),
        );
      },
    );
  }
}
