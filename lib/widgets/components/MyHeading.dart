import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproduct/bloc_state/ThemeState/theme_switch_bloc.dart';
import 'package:myproduct/widgets/components/myText.dart';

class MyHeading extends StatelessWidget {
  double? tSize;
  String heading;
  String? suffixTitle;
  Widget? suffix;

  Function() ontap;
  MyHeading({
    Key? key,
    this.tSize,
    required this.heading,
    this.suffix,
    required this.suffixTitle,
    required this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeSwitchBloc, ThemeSwitchState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.white),
          padding: const EdgeInsets.all(0.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText(
                    text: heading,
                    fw: FontWeight.bold,
                    tcolor: Colors.black,
                    tsize: tSize ?? 16,
                  ),
                  if (suffix != null) suffix!,
                  if (suffixTitle != null)
                    GestureDetector(
                      onTap: ontap,
                      child: MyText(
                        text: suffixTitle ?? '',
                        tcolor: state.selected.primary_1,
                        fw: FontWeight.bold,
                      ),
                    ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
