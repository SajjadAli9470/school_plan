
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproduct/bloc_state/ThemeState/theme_switch_bloc.dart';
import 'package:myproduct/widgets/components/myText.dart';

class SwitchTile extends StatelessWidget {
  final bool value;

  String title;

  Function(bool) ontap;
  SwitchTile({
    Key? key,
    required this.value,
    required this.title,
    required this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeSwitchBloc, ThemeSwitchState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            // ontap(value);
            // log("I am called");
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width * 0.7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        MyText(
                          maxlines: 2,
                          width: MediaQuery.sizeOf(context).width * 0.7,
                          text: title,
                          tsize: 15.sp,
                          fw: FontWeight.w500,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 50,
                      child: AnimatedToggleSwitch<bool>.rolling(
                        height: 25,
                        iconBuilder: (value, foreground) {
                          return !foreground
                              ? Container()
                              : Container(
                                  decoration: BoxDecoration(
                                      color: value
                                          ? state.selected.white
                                          : state.selected.white,
                                      borderRadius: BorderRadius.circular(10)),
                                );
                        },
                        // active: false,
                        current: value,
                        values: const [false, true],

                        onChanged: ontap,

                        style: ToggleStyle(
                          indicatorColor: !value
                              ? state.selected.primary_1
                              : state.selected.grey.withOpacity(0.2),
                          backgroundColor: value
                              ? state.selected.primary_1
                              : state.selected.grey.withOpacity(0.2),
                          borderColor: Colors.transparent,
                          indicatorBoxShadow: [],
                          boxShadow: !value
                              ? null
                              : [
                                  BoxShadow(
                                    color: Colors.black26,
                                    spreadRadius: 0.1,
                                    blurRadius: 1,
                                    offset: Offset(0, 0),
                                  )
                                ],
                        ),
                      ),
                    ),
                  ],
                )),
              ),
            ],
          ),
        );
      },
    );
  }
}
