// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:myproduct/bloc_state/ThemeState/theme_switch_bloc.dart';
import 'package:myproduct/modules/home/feesManagment/paynow.dart';
import 'package:myproduct/widgets/components/myButton.dart';
import 'package:myproduct/widgets/components/myText.dart';

class FeesDetailsContainer extends StatelessWidget {
  String heading;
  Function() ontap;
  String amount;
  String date;
  bool paid;
  FeesDetailsContainer({
    super.key,
    required this.heading,
    required this.ontap,
    required this.amount,
    required this.date,
    required this.paid,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeSwitchBloc, ThemeSwitchState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: ontap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            decoration: BoxDecoration(
                boxShadow: const [
                  // BoxShadow(
                  //   color: Colors.grey.withOpacity(0.5),
                  //   spreadRadius: 2,
                  //   blurRadius: 10,
                  //   offset: Offset(0, 5), // changes position of shadow
                  // ),
                  // BoxShadow(
                  //   color: Colors.black.withOpacity(0.2),
                  //   spreadRadius: 0.4,
                  //   blurRadius: 12,
                  //   offset: const Offset(0, 1), // changes position of shadow
                  // ),
                ],
                borderRadius: BorderRadius.circular(15),
                color: state.selected.primary_3),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [

                //     Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         MyText(text: heading,tcolor: state.selected.black.withOpacity(0.6),tsize: 15,),
                //         10.verticalSpace,

                //          Row(children: [
                //     MyText(text: amount,tcolor: state.selected.black.withOpacity(1),tsize: 20,),
                //     10.horizontalSpace,
                //     Container(
                //       padding: const EdgeInsets.symmetric(horizontal: 10),
                //       height: 20,
                //       decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(100),
                //         color: paid ? state.selected.green : state.selected.red
                //       ),
                //       child: Center(child: MyText(text: paid ? "Paid" : "Unpaid",tcolor:state.selected.white ,tsize: 13,)),
                //     )
                //     ],),
                //       ],
                //     ),
                //     Column(
                //       children: [
                //         MyText(text: date,tcolor: state.selected.black.withOpacity(0.6),tsize: 15,),
                //               10.verticalSpace,
                //           Icon(Icons.keyboard_arrow_down_rounded,color: state.selected.primary_6,)
                //       ],
                //     ),

                //   ],
                // ),

                ExpansionTile(
                  tilePadding: EdgeInsets.zero,
                  showTrailingIcon: false,
                  title: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyText(
                              text: heading,
                              tcolor: state.selected.black.withOpacity(0.6),
                              tsize: 15,
                            ),
                            10.verticalSpace,
                            Row(
                              children: [
                                MyText(
                                  text: amount,
                                  tcolor: state.selected.black.withOpacity(1),
                                  tsize: 20,
                                ),
                                10.horizontalSpace,
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  height: 20,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: paid
                                          ? state.selected.green
                                          : state.selected.red),
                                  child: Center(
                                      child: MyText(
                                    text: paid ? "Paid" : "Unpaid",
                                    tcolor: state.selected.white,
                                    tsize: 13,
                                  )),
                                )
                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            MyText(
                              text: date,
                              tcolor: state.selected.black.withOpacity(0.6),
                              tsize: 15,
                            ),
                            10.verticalSpace,
                            Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: state.selected.primary_6,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  children: [
                    10.verticalSpace,
                    // const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyText(text: "Total Fee"),
                        MyText(text: "Rs 14,500")
                      ],
                    ),
                    10.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyText(text: "Extra Fee"),
                        MyText(text: "Rs 2000")
                      ],
                    ),
                    10.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyText(text: "Late Charges"),
                        MyText(text: "Rs 600")
                      ],
                    ),
                    10.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyText(text: "Discount(20%)"),
                        MyText(text: "Rs 2000")
                      ],
                    ),
                    10.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyText(text: "Total Fee"),
                        MyText(text: "Rs 2000")
                      ],
                    ),
                    20.verticalSpace,

                    MyButton(
                        bgcolor: state.selected.primary_1,
                        disable: false,
                        isLoading: false,
                        text: "PAY NOW",
                        ontap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (cxt) {
                            return const PayNow();
                          }));
                        })
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
