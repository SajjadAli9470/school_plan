// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproduct/bloc_state/ThemeState/theme_switch_bloc.dart';
import 'package:myproduct/widgets/components/myText.dart';


class TextAndArrow extends StatelessWidget {
  final String? selected;
  final Function() ontap;
  final bool disable;
  const TextAndArrow({
    Key? key,
    this.selected,
    required this.ontap,
    required this.disable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:disable?(){}: ontap,
      child: BlocBuilder<ThemeSwitchBloc, ThemeSwitchState>(
        builder: (context, state) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            width: MediaQuery.sizeOf(context).width * 0.4,
            decoration: BoxDecoration(
                color: state.selected.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(15)),
            height: 48,
            child: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyText(
                  text: selected ?? "Select",
                  tsize: 15,
                  tcolor: disable?state.selected.grey :state.selected.black,
                  fw: FontWeight.bold,
                ),
                Icon(Icons.keyboard_arrow_down_outlined)
              ],
            )),
          );
        },
      ),
    );
  }
}
