// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:myproduct/bloc_state/ThemeState/theme_switch_bloc.dart';
import 'package:myproduct/widgets/components/myText.dart';

class EventContainer extends StatelessWidget {
  String heading;
  String text;
  String date;
  Function() ontap;
  String image;
  EventContainer({
    super.key,
    required this.heading,
    required this.text,
    required this.date,
    required this.ontap,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeSwitchBloc, ThemeSwitchState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: ontap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: state.selected.grey.withOpacity(0.2),),
                
                 color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(text: heading),
                5.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    BlocBuilder<ThemeSwitchBloc, ThemeSwitchState>(
                      builder: (context, state) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            fit: BoxFit.fill,
                             height: 100,
                        width: 100,
                            image,
                          ),
                        );
                      },
                    ),
                    5.horizontalSpace,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.access_time_rounded,color: state.selected.primary_1,),3.horizontalSpace,
                            MyText(
                              text: date,
                              tcolor: state.selected.primary_1,
                            ),
                          ],
                        ),
                        5.verticalSpace,
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width*0.55,
                          child: MyText(text: text,tsize: 13,fw: FontWeight.w200,)),
                      ],
                    )
                  ],
                ),
                
              ],
            ),
          ),
        );
      },
    );
  }
}
