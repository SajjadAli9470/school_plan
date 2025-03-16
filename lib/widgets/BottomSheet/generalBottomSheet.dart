// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproduct/bloc_state/ThemeState/theme_switch_bloc.dart';
import 'package:myproduct/widgets/components/customDivider.dart';
import 'package:myproduct/widgets/components/myButton.dart';
import 'package:myproduct/widgets/components/myText.dart';

class MyConfirmationWidget extends StatefulWidget {
  BuildContext context;
  String label;
  String text;
  String doneLabel;
  String cancelLabel;
  Widget? icon;
  bool? isdelete;
  bool? inColumns;

  MyConfirmationWidget({
    Key? key,
    required this.context,
    required this.label,
    required this.text,
    required this.doneLabel,
    required this.cancelLabel,
    this.inColumns,
    this.icon,
    this.isdelete,
  }) : super(key: key);

  @override
  State<MyConfirmationWidget> createState() => _MyConfirmationWidgetState();
}

class _MyConfirmationWidgetState extends State<MyConfirmationWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeSwitchBloc, ThemeSwitchState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: state.selected.white,
              borderRadius: BorderRadius.circular(40)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.label.isNotEmpty)
                Column(
                  children: [
                    widget.icon ?? SizedBox(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: MyText(
                        align: TextAlign.center,
                        text: widget.label,
                        tsize: 20.sp,
                        tcolor: (widget.isdelete ?? false)
                            ? state.selected.danger
                            : state.selected.primary_1,
                        fw: FontWeight.bold,
                      ),
                    ),
                    10.verticalSpace,
                    MyDivider(
                      width: MediaQuery.sizeOf(context).width * 0.25,
                    ),
                  ],
                ),
              20.verticalSpace,
              Padding(
                padding: const EdgeInsets.symmetric(
                  // horizontal: 22.0,
                  vertical: 0,
                ),
                child: MyText(
                  align: TextAlign.center,
                  text: widget.text,
                  tsize: 15.sp,
                  tcolor: state.selected.black,
                  fw: FontWeight.w400,
                ),
              ),
              10.verticalSpace,
              Padding(
                padding: const EdgeInsets.symmetric(
                  // horizontal: 10.0,
                  vertical: 12,
                ),
                child: ((widget.inColumns) ?? false)
                    ? Column(
                        children: [
                          MyButton(
                              radius: 100,
                              height: 40.sp,
                              tcolor: state.selected.white,
                              fontWeight: FontWeight.bold,
                              bgcolor: state.selected.primary_1,
                              width: MediaQuery.of(context).size.width * 0.45,
                              disable: false,
                              isLoading: false,
                              tsize: 13.sp,
                              text: widget.doneLabel,
                              ontap: () => Navigator.of(context).pop(true)),
                          10.verticalSpace,
                          MyButton(
                              height: 40.sp,
                              radius: 100,
                              tcolor: state.selected.primary_1,
                              fontWeight: FontWeight.bold,
                              bgcolor:
                                  state.selected.primary_1.withOpacity(0.1),
                              width: MediaQuery.of(context).size.width * 0.45,
                              disable: false,
                              isLoading: false,
                              tsize: 13.sp,
                              text: widget.cancelLabel,
                              ontap: () => Navigator.of(context).pop(false)),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          MyButton(
                              height: 40.sp,
                              radius: 100,
                              tcolor: state.selected.primary_1,
                              fontWeight: FontWeight.bold,
                              bgcolor:
                                  state.selected.primary_1.withOpacity(0.1),
                              width: MediaQuery.of(context).size.width * 0.4,
                              disable: false,
                              isLoading: false,
                              tsize: 13.sp,
                              text: widget.cancelLabel,
                              ontap: () => Navigator.of(context).pop(false)),
                          MyButton(
                              height: 40.sp,
                              radius: 100,
                              tcolor: state.selected.white,
                              fontWeight: FontWeight.bold,
                              bgcolor: state.selected.primary_1,
                              tsize: 13.sp,
                              width: MediaQuery.of(context).size.width * 0.4,
                              disable: false,
                              isLoading: false,
                              text: widget.doneLabel,
                              ontap: () => Navigator.of(context).pop(true)),
                        ],
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}
