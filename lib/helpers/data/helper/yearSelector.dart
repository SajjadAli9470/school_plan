
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproduct/app_theme.dart';
import 'package:myproduct/bloc_state/ThemeState/theme_switch_bloc.dart';

class YearSelector extends StatefulWidget {
  final DateTime selectedDate;
  const YearSelector({super.key, required this.selectedDate});

  @override
  State<YearSelector> createState() => _YearSelectorState();
}

class _YearSelectorState extends State<YearSelector> {
  // int year = DateTime.now().year;
  // int month = DateTime.now().month;
  // int yearCur = DateTime.now().year;
  // int monthCur = DateTime.now().month;
  int selectedyear = 2000;
  List<int> yearsList = [];
  getSelected() {
    selectedyear = widget.selectedDate.year;
    yearsList = List.generate(25, (int index) => index + 2000, growable: true);
    for (var i = 0; i < 7; i++) {
      yearsList.add(yearsList.last + 1);
    }
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
                    Expanded(
                      child: Container(
                        // height: MediaQuery.of(context).size.height * 0.3,
                        // color: Colors.red,
                        padding: const EdgeInsets.all(10.0),
                        child: GridView.builder(
                            shrinkWrap: true,
                            // reverse: true,
                            physics: ScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: 2,
                              mainAxisSpacing: 1,
                            ),
                            itemCount: yearsList.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedyear = yearsList[index];
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
                                            color:
                                                yearsList[index] != selectedyear
                                                    ? state.selected.grey
                                                        .withOpacity(0.2)
                                                    : state.selected.white),
                                        color: yearsList[index] == selectedyear
                                            ? state.selected.primary_1
                                            : null,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Text(
                                      (yearsList[index]).toString(),
                                      textAlign: TextAlign.center,
                                      style: AppTheme.bodyMedium.copyWith(
                                          color: false
                                              ? state.selected.grey
                                              : yearsList[index] == selectedyear
                                                  ? state.selected.white
                                                  : null),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
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
                                    .pop(DateTime(selectedyear, 1, 1));
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
