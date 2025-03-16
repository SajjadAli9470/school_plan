import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproduct/bloc_state/ThemeState/theme_switch_bloc.dart';
import 'package:myproduct/widgets/components/customDivider.dart';
import 'package:myproduct/widgets/components/myText.dart';

class MyExpansionTile extends StatelessWidget {
  final String title;
  final String subtitle;
  const MyExpansionTile({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeSwitchBloc, ThemeSwitchState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: state.selected.grey.withOpacity(0.1)),
          child: ExpansionTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              collapsedShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              // trailing: Icon(
              //   Icons.arrow_drop_down,
              //   color: state.selected.primary_1,
              // ),
              backgroundColor: state.selected.grey.withOpacity(0.1),
              children: [
                MyDivider(
                  width: MediaQuery.of(context).size.width * 0.4,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MyText(
                        tsize: 14.sp,
                        maxlines: 20,
                        text:subtitle),
                  ),
                )
              ],
              title: MyText(
                text: title,
                fw: FontWeight.bold,
                tsize: 15.sp,
              )),
        );
      },
    );
  }
}
