import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproduct/app_theme.dart';
import 'package:myproduct/bloc_state/ThemeState/theme_switch_bloc.dart';
import 'package:myproduct/helpers/constants/app_utils.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DateRangeSelector extends StatefulWidget {
  final PickerDateRange selectedRange;
  const DateRangeSelector({super.key, required this.selectedRange});

  @override
  State<DateRangeSelector> createState() => _DateRangeSelectorState();
}

class _DateRangeSelectorState extends State<DateRangeSelector> {
  PickerDateRange dateRange = PickerDateRange(DateTime.now(), DateTime.now());
  DateRangePickerController controller = DateRangePickerController();

  @override
  void initState() {
    dateRange = widget.selectedRange;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeSwitchBloc, ThemeSwitchState>(
      builder: (context, state) {
        return Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.7,
          decoration: BoxDecoration(
              color: state.selected.background,
              borderRadius: BorderRadius.circular(10)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Stack(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: DateSelectionView(
                          (dateRange).startDate ?? DateTime.now(),
                          (dateRange).endDate ?? DateTime.now(),
                          text: "Selected Date Range",
                          onTap: () {},
                          color: state.selected.primary_1,
                          textColor1: state.selected.white,
                          textColor2: state.selected.white),
                    ),
                    Expanded(
                      child: SfTheme(
                        data: SfThemeData(
                            dateRangePickerThemeData:
                                SfDateRangePickerThemeData(
                                    headerBackgroundColor:
                                        state.selected.primary_1,
                                    selectionTextStyle: AppTheme.bodyMedium,
                                    startRangeSelectionColor:
                                        state.selected.primary_1,
                                    endRangeSelectionColor:
                                        state.selected.primary_1,
                                    selectionColor: state.selected.primary_1,
                                    rangeSelectionColor: state
                                        .selected.primary_1
                                        .withOpacity(0.2),
                                    todayHighlightColor: Colors.black,
                                    todayTextStyle: AppTheme.bodyLarge)),
                        child: SfDateRangePicker(
                          toggleDaySelection: true,
                          controller: controller,
                          backgroundColor: state.selected.white,
                          navigationMode: DateRangePickerNavigationMode.scroll,
                          navigationDirection:
                              DateRangePickerNavigationDirection.vertical,
                          enableMultiView: true,
                          showActionButtons: true,

                          showTodayButton: true,
                          // toggleDaySelection: true,
                          maxDate: DateTime.now(),
                          onSelectionChanged:
                              (DateRangePickerSelectionChangedArgs value) {
                            dateRange = value.value;
                            setState(() {});
                          },
                          onCancel: () {
                            Navigator.of(context).pop();
                          },
                          onSubmit: (value) {
                            // return value;
                            Navigator.of(context).pop(value);
                          },
                          // extendableRangeSelectionDirection:
                          //     ExtendableRangeSelectionDirection.both,
                          selectionMode: DateRangePickerSelectionMode.range,
                          initialSelectedRange: PickerDateRange(
                            widget.selectedRange.startDate,
                            widget.selectedRange.endDate,
                          ),
                          headerStyle: const DateRangePickerHeaderStyle(
                              textAlign: TextAlign.center,
                              textStyle: TextStyle(
                                  // fontSize: 15,
                                  // color: AppTheme.colorAccent,
                                  // fontWeight: FontWeight.bold
                                  )),

                          monthCellStyle: DateRangePickerMonthCellStyle(
                            weekendTextStyle: TextStyle(
                              color: state.selected.grey,
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
          ),
        );
      },
    );
  }
}

getDateRangePicker(
  BuildContext context,
  PickerDateRange range,
) {
  return showGeneralDialog(
      context: context,
      pageBuilder: (context, a, b) {
        return SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: Scaffold(
                backgroundColor: Colors.transparent,
                body: Center(child: DateRangeSelector(selectedRange: range))),
          ),
        );
      });
}

class _MonthCellDecoration extends Decoration {
  const _MonthCellDecoration(
      {this.borderColor,
      this.backgroundColor,
      required this.showIndicator,
      this.indicatorColor});

  final Color? borderColor;
  final Color? backgroundColor;
  final bool showIndicator;
  final Color? indicatorColor;

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _MonthCellDecorationPainter(
        borderColor: borderColor,
        backgroundColor: backgroundColor,
        showIndicator: showIndicator,
        indicatorColor: indicatorColor);
  }
}

/// [_MonthCellDecorationPainter] used to paint month cell decoration.
class _MonthCellDecorationPainter extends BoxPainter {
  _MonthCellDecorationPainter(
      {this.borderColor,
      this.backgroundColor,
      required this.showIndicator,
      this.indicatorColor});

  final Color? borderColor;
  final Color? backgroundColor;
  final bool showIndicator;
  final Color? indicatorColor;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Rect bounds = offset & configuration.size!;
    _drawDecoration(canvas, bounds);
  }

  void _drawDecoration(Canvas canvas, Rect bounds) {
    final Paint paint = Paint()..color = backgroundColor!;
    canvas.drawRRect(
        RRect.fromRectAndRadius(bounds, const Radius.circular(5)), paint);
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 1;
    if (borderColor != null) {
      paint.color = borderColor!;
      canvas.drawRRect(
          RRect.fromRectAndRadius(bounds, const Radius.circular(5)), paint);
    }

    if (showIndicator) {
      paint.color = indicatorColor!;
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(Offset(bounds.right - 6, bounds.top + 6), 2.5, paint);
    }
  }
}

DateSelectionView(
  DateTime startDate,
  DateTime endDate, {
  required Function() onTap,
  Widget? centerIcon,
  String? text,
  Color? color,
  Color? textColor1,
  double? fsize1,
  double? fsize2,
  Color? textColor2,
}) {
  return BlocBuilder<ThemeSwitchBloc, ThemeSwitchState>(
    builder: (context, state) {
      return Container(
        padding: EdgeInsets.all(5.sp),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: state.selected.grey.withOpacity(0.1)),
            color: color ?? state.selected.white),
        child: Column(
          children: [
            if (text != null)
              Text(
                text,
                style: AppTheme.bodyMedium.copyWith(color: textColor2),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: onTap,
                  child: dateFromToView(
                      "Date from", AppUtils.formatMMDDYY(startDate.toString()),
                      textColor1: textColor1,
                      textColor2: textColor2,
                      fsize1: fsize1,
                      fsize2: fsize2),
                ),
                centerIcon ??
                    Container(
                      height: 18.sp,
                      width: 18.sp,
                      padding: REdgeInsets.all(2).r,
                      decoration: BoxDecoration(
                        color: textColor2 ?? state.selected.primary_1,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50)).w,
                      ),
                      child: Icon(
                        Icons.arrow_forward_rounded,
                        color: color ?? state.selected.white,
                        size: 15.sp,
                      ),
                    ),
                GestureDetector(
                  onTap: onTap,
                  child: dateFromToView(
                      "Date till", AppUtils.formatMMDDYY(endDate.toString()),
                      textColor1: textColor1,
                      textColor2: textColor2,
                      fsize1: fsize1,
                      fsize2: fsize2),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}

dateFromToView(String title, String date,
    {Color? textColor1, Color? textColor2, double? fsize1, double? fsize2}) {
  return BlocBuilder<ThemeSwitchBloc, ThemeSwitchState>(
    builder: (context, state) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: AppTheme.titleLarge.copyWith(
                  color: textColor1 ?? state.selected.textBlack,
                  fontSize: fsize1 ?? 12.sp,
                  fontWeight: FontWeight.normal)),
          Text(date,
              style: AppTheme.titleLarge.copyWith(
                  color: textColor2 ?? state.selected.black,
                  fontSize: fsize2 ?? 14.sp,
                  fontWeight: FontWeight.bold)),
        ],
      );
    },
  );
}
