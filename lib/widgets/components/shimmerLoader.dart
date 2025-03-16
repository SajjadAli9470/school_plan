
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:myproduct/bloc_state/ThemeState/theme_switch_bloc.dart';

class ShimmerLoading extends StatelessWidget {
  final Color? color;
  final double? width;
  ShimmerLoading({
    Key? key,
    this.width,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeSwitchBloc, ThemeSwitchState>(
      builder: (context, state) {
        return SizedBox(
            width: width,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              child: LoadingAnimationWidget.hexagonDots(
                color: color ?? state.selected.primary_1,
                size: 30,
              ),
            )

            // Shimmer.fromAppTheme(
            //   baseColor: AppTheme.color_777879,
            //   highlightColor: AppTheme.white,
            //   enabled: true,
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: <Widget>[
            //       Container(
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(20),
            //           color: AppTheme.white,
            //         ),
            //         width: double.infinity,
            //         height: 8.0,

            //       ),
            //       const Padding(
            //         padding: EdgeInsets.symmetric(vertical: 2.0),
            //       ),
            //       Container(

            //         width: double.infinity,
            //         height: 8.0,
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(20),
            //           color: AppTheme.white,
            //         ),
            //       ),
            //       const Padding(
            //         padding: EdgeInsets.symmetric(vertical: 2.0),
            //       ),
            //       Container(
            //         width: 40.0,
            //         height: 8.0,
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(20),
            //           color: AppTheme.white,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),

            );
      },
    );
  }
}
