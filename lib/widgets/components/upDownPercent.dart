// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproduct/widgets/components/myText.dart';
class UpDownPercent extends StatelessWidget {
  final bool? up;
  final double percent;
  final bool isExpense;
  UpDownPercent({
    Key? key,
    required this.up,
    required this.percent, required this.isExpense,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return up == null
        ? Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          )
        : Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color:isExpense?
              
              up!
                  ?Colors.red.withOpacity(0.2) 
                  : Colors.green.withOpacity(0.2)
               :
               up!
                  ? Colors.green.withOpacity(0.2)
                  : Colors.red.withOpacity(0.2),
            ),
            child: Row(
              children: [
                Icon(
                 false? up! ? Icons.arrow_downward : Icons.arrow_upward: up! ? Icons.arrow_upward : Icons.arrow_downward,
                  color: isExpense?
              
              up!
                  ?Colors.red.withOpacity(1) 
                  : Colors.green.withOpacity(1)
               :
               up!
                  ? Colors.green.withOpacity(1)
                  : Colors.red.withOpacity(1),
                  size: 18,
                ),
                2.horizontalSpace,
                MyText(
                  text:
                      "${percent >= 0 ? percent.toStringAsFixed(1) : (percent * -1).toStringAsFixed(1)}%",
                  tcolor: isExpense?
              
              up!
                  ?Colors.red.withOpacity(1) 
                  : Colors.green.withOpacity(1)
               :
               up!
                  ? Colors.green.withOpacity(1)
                  : Colors.red.withOpacity(1),
                  tsize: 18,
                  fw: FontWeight.bold,
                )
              ],
            ),
          );
  }
}
