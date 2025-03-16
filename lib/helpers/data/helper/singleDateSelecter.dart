import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproduct/app_theme.dart';
import 'package:myproduct/bloc_state/ThemeState/theme_switch_bloc.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class SelectDateRange extends StatefulWidget {
  final bool? onlyMonth;
  final DateTime minDate;
  final DateTime maxDate;
  final DateTime? selectedData;
  const SelectDateRange(
      {super.key,
      required this.minDate,
      required this.maxDate,
      required this.selectedData,
      this.onlyMonth});

  @override
  State<SelectDateRange> createState() => _DateRangeSelectorState();
}

class _DateRangeSelectorState extends State<SelectDateRange> {
  DateTime dateRange = DateTime.now();
  DateRangePickerController controller = DateRangePickerController();

  @override
  void initState() {
    dateRange = widget.minDate;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: BlocBuilder<ThemeSwitchBloc, ThemeSwitchState>(
        builder: (context, state) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Stack(
              children: [
                Column(
                  children: [
                    // Padding(
                    //   padding: EdgeInsets.all(10),
                    //   child: DateSelectionView(DateTime.now(), DateTime.now(),
                    //       text: "Selected Date ",
                    //       onTap: () {},
                    //       color: AppTheme.colorAccent,
                    //       textColor1: Colors.white70,
                    //       textColor2: Colors.white),
                    // ),
                    Expanded(
                      child: SfTheme(
                        data: SfThemeData(
                            dateRangePickerThemeData:
                                SfDateRangePickerThemeData(
                                    headerBackgroundColor: state
                                        .selected.primary_1
                                        .withOpacity(0.6),
                                    selectionTextStyle: AppTheme.bodyMedium
                                        .copyWith(color: state.selected.white),
                                    startRangeSelectionColor:
                                        state.selected.primary_1,
                                    endRangeSelectionColor:
                                        state.selected.primary_1,
                                    selectionColor: state.selected.primary_1,
                                    rangeSelectionColor: state
                                        .selected.primary_1
                                        .withOpacity(0.2),
                                    todayHighlightColor:
                                        state.selected.primary_1,
                                    todayTextStyle: TextStyle(
                                        color: state.selected.primary_1,
                                        fontWeight: FontWeight.bold))),
                        child: SfDateRangePicker(
                          // view: DateRangePickerView.year,
                          // toggleDaySelection: true,

                          controller: controller,
                          initialDisplayDate:
                              widget.selectedData ?? DateTime.now(),
                          // initialSelectedDates: [
                          //   widget.selectedData ?? DateTime.now()
                          // ],
                          backgroundColor: AppTheme.white,
                          navigationMode: DateRangePickerNavigationMode.scroll,
                          navigationDirection:
                              DateRangePickerNavigationDirection.vertical,
                          enableMultiView: true,
                          showActionButtons: true,

                          showTodayButton: true,
                          minDate: dateRange,
                          // toggleDaySelection: true,
                          maxDate: widget.maxDate,
                          onSelectionChanged:
                              (DateRangePickerSelectionChangedArgs value) {
                            dateRange = value.value;
                          },
                          onCancel: () {
                            Navigator.of(context).pop();
                          },
                          onSubmit: (value) {
                            // log(value.toString());
                            // // return value;
                            Navigator.of(context).pop(value);
                          },
                          // extendableRangeSelectionDirection:
                          //     ExtendableRangeSelectionDirection.both,
                          selectionMode: DateRangePickerSelectionMode.single,
                          initialSelectedDate:
                              widget.selectedData ?? DateTime.now(),
                          headerStyle: DateRangePickerHeaderStyle(
                              textAlign: TextAlign.center,
                              textStyle: AppTheme.bodyLarge),

                          monthCellStyle: DateRangePickerMonthCellStyle(
                            weekendTextStyle: AppTheme.bodyLarge.copyWith(
                              color: Colors.grey,
                            ),
                            // todayTextStyle:
                            // TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),

                          showNavigationArrow: true,
                          monthViewSettings:
                              const DateRangePickerMonthViewSettings(
                            enableSwipeSelection: true,
                            viewHeaderHeight: 45,
                            firstDayOfWeek: 1,
                            viewHeaderStyle: DateRangePickerViewHeaderStyle(
                                textStyle: TextStyle(
                                    // fontSize: 15,
                                    // color: Colors.black,
                                    // fontWeight: FontWeight.bold
                                    )),
                            dayFormat: 'EEE',
                          ),
                        ),
                      ),
                    ),
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
          );
        },
      ),
    );
  }
}
