// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:myproduct/bloc_state/ThemeState/theme_switch_bloc.dart';
import 'package:myproduct/widgets/components/myText.dart';

class DashboardRectContainer extends StatelessWidget {
  String heading;
  Function() ontap;
  String svg;
  DashboardRectContainer({
    super.key,
    required this.heading,
    required this.ontap,
    required this.svg,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
        decoration: BoxDecoration(
            boxShadow: [
                      // BoxShadow(
                      //   color: Colors.grey.withOpacity(0.5),
                      //   spreadRadius: 2,
                      //   blurRadius: 10,
                      //   offset: Offset(0, 5), // changes position of shadow
                      // ),
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 0.4,
                        blurRadius: 12,
                        offset: const Offset(0, 1), // changes position of shadow
                      ),
                    ],
            borderRadius: BorderRadius.circular(15), color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                BlocBuilder<ThemeSwitchBloc, ThemeSwitchState>(
                  builder: (context, state) {
                    return Container(
                      height: 35,
                      width: 35,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: state.selected.primary_3,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: SvgPicture.asset(
                          svg,
                          height: 25,
                          width: 25,
                        ),
                      ),
                    );
                  },
                ),
                5.horizontalSpace,
                MyText(text: heading)
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: BlocBuilder<ThemeSwitchBloc, ThemeSwitchState>(
                builder: (context, state) {
                  return Container(
                    padding: const EdgeInsets.all(1),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border:
                            Border.all(color: state.selected.primary_1, width: 2)),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                      color: state.selected.primary_1,
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
