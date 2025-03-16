
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproduct/app_theme.dart';
import 'package:myproduct/bloc_state/ThemeState/theme_switch_bloc.dart';
import 'package:myproduct/helpers/constants/app_utils.dart';
import 'package:myproduct/widgets/components/myText.dart';

class MonthSelector extends StatefulWidget {
  final DateTime selectedDate;
  const MonthSelector({super.key, required this.selectedDate});

  @override
  State<MonthSelector> createState() => _MonthSelectorState();
}

class _MonthSelectorState extends State<MonthSelector> {
  int year = DateTime.now().year;
  int month = DateTime.now().month;
  int yearCur = DateTime.now().year;
  int monthCur = DateTime.now().month;
  getSelected() {
    year = widget.selectedDate.year;
    month = widget.selectedDate.month;
    setState(() {});
  }

  @override
  void initState() {
    getSelected();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeSwitchBloc, ThemeSwitchState>(
      builder: (context, state) {
        return Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.5,
          decoration: BoxDecoration(
              color: state.selected.white,
              borderRadius: BorderRadius.circular(10)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    20.verticalSpace,
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                              onTap: year < 1950
                                  ? null
                                  : () {
                                      year--;
                                      month =
                                          (year == yearCur && month > monthCur)
                                              ? 1
                                              : month;
                                      setState(() {});
                                    },
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: !(year < 1950)
                                    ? state.selected.black
                                    : state.selected.grey.withOpacity(0.5),
                              )),
                          Text(
                            year.toString(),
                            style: AppTheme.titleLarge,
                          ),
                          GestureDetector(
                              onTap: year == yearCur
                                  ? null
                                  : () {
                                      year++;
                                      month =
                                          (year == yearCur && month > monthCur)
                                              ? 1
                                              : month;
                                      setState(() {});
                                    },
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: year != yearCur
                                    ? state.selected.black
                                    : state.selected.grey.withOpacity(0.5),
                              )),
                        ],
                      ),
                    ),
                    Container(
                      // height: MediaQuery.of(context).size.height * 0.3,
                      // color: Colors.red,
                      padding: const EdgeInsets.all(10.0),
                      child: GridView.builder(
                          shrinkWrap: true,
                          // reverse: true,
                          // physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 2,
                            mainAxisSpacing: 1,
                          ),
                          itemCount: fullMonthNames.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: (year == yearCur && index + 1 > monthCur)
                                  ? null
                                  : () {
                                      setState(() {
                                        month = index + 1;
                                      });

                                      // log("tap on : ${fullMonthNames[index]}");
                                      // // log("Month : $month - $monthCur");
                                      // log("${(year == yearCur && index + 1 > monthCur)}");
                                    },
                              child: Center(
                                child: Container(
                                  width: 200,
                                  padding: EdgeInsets.all(10),
                                  margin: EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: month != index + 1
                                              ? state.selected.grey
                                                  .withOpacity(0.2)
                                              : state.selected.white),
                                      color: month == index + 1
                                          ? state.selected.primary_1
                                          : null,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: MyText(
                                    text: fullMonthNames[index],
                                    tsize: 13,
                                    align: TextAlign.center,
                                    tcolor: (year == yearCur &&
                                            index + 1 > monthCur)
                                        ? state.selected.grey
                                        : month == index + 1
                                            ? state.selected.white
                                            : null,
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("Cancel")),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pop(DateTime(year, month + 1, 0));
                              },
                              child: Text("OK"))
                        ],
                      ),
                    )
                  ],
                ),

                // Positioned(
                //     bottom: 15,
                //     left: 20,
                //     child: rotationIcon(
                //         onTap: () {

                //           setState(() {});
                //         },
                //         rotatingIcon: Icon(
                //           Icons.restore,
                //           color: AppTheme.colorAccent,
                //         )))
              ],
            ),
          ),
        );
      },
    );
  }
}
