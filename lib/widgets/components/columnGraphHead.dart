
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproduct/bloc_state/ThemeState/theme_switch_bloc.dart';
import 'package:myproduct/helpers/constants/app_utils.dart';
import 'package:myproduct/widgets/components/myText.dart';
import 'package:myproduct/widgets/components/shimmerLoading.dart';
import 'package:myproduct/widgets/components/upDownPercent.dart';
import 'package:shimmer/shimmer.dart';

class ColumnGraphHead extends StatelessWidget {
  final String mainHeading;
  final double amount;
  final double percent;
  final bool isExpense;
  final bool? up;
  final bool isLoading;
  const ColumnGraphHead(
      {super.key,
      required this.mainHeading,
      required this.amount,
      required this.percent,
      required this.up,
      required this.isLoading,
      required this.isExpense});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeSwitchBloc, ThemeSwitchState>(
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: isLoading
              ? MyShimmerLoading(
                  mainAlignment: MainAxisAlignment.start,
                  height: 50,
                  // width: MediaQuery.sizeOf(context).width * 0.5,
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        MyText(
                          text: mainHeading,
                          fw: FontWeight.bold,
                          tsize: 18,
                        ),
                        UpDownPercent(
                          isExpense: isExpense,
                          up: up,
                          percent: percent,
                        ),
                      ],
                    ),
                    MyText(
                      text:
                          "${state.currency}${AppUtils.amountWitCommas(amount.toStringAsFixed(2))}",
                      tsize: 30,
                      fw: FontWeight.bold,
                      theight: 0.5,
                    )
                  ],
                ),
        );
      },
    );
  }
}
