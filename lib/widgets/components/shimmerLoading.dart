import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproduct/bloc_state/ThemeState/theme_switch_bloc.dart';
import 'package:shimmer/shimmer.dart';

class MyShimmerLoading extends StatelessWidget {
  final double? width;
  final double? height;
  final double? radius;
  final Color? color;
  final MainAxisAlignment? mainAlignment;
  const MyShimmerLoading(
      {super.key, this.width, this.height, this.radius, this.color, this.mainAlignment});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeSwitchBloc, ThemeSwitchState>(
      builder: (context, state) {
        return Container(
          // width:width ?? MediaQuery.sizeOf(context).width,
          // alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
          child: Shimmer.fromColors(
                  child: Container(
                    decoration: BoxDecoration(
                        color: color ?? Colors.grey.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(radius ?? 10)),
                    height: height ?? 30,
                    width: width ?? MediaQuery.sizeOf(context).width * 0.7,
                  ),
                  baseColor:  state.selected.grey.withOpacity(0.2),
                  highlightColor:  state.selected.white.withOpacity(0.1)),
        );
      },
    );
  }
}
