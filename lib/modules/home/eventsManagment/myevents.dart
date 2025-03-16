import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myproduct/appComponent/eventsContaner.dart';
import 'package:myproduct/appComponent/feesDetailContainer.dart';
import 'package:myproduct/appComponent/dashboardRectContainer.dart';
import 'package:myproduct/appComponent/dashboardSmallContainer.dart';
import 'package:myproduct/bloc_state/ThemeState/theme_switch_bloc.dart';
import 'package:myproduct/modules/home/eventsManagment/eventDetails.dart';
import 'package:myproduct/widgets/components/myText.dart';

class EventManagments extends StatefulWidget {
  const EventManagments({super.key});

  @override
  State<EventManagments> createState() => _MyDashboardState();
}

class _MyDashboardState extends State<EventManagments> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<ThemeSwitchBloc, ThemeSwitchState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: Colors.white,
            body: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                // image: DecorationImage(
                //     image: AssetImage("assets/logo.png"),
                //     fit: BoxFit.cover),
                color: state.selected.primary_1,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(1),
                                  decoration: const BoxDecoration(
                                      // border: Border.all(color: state.selected.white),borderRadius: BorderRadius.circular(100)
                                      ),
                                  child: Icon(
                                    Icons.arrow_back_ios,
                                    color: state.selected.white,
                                  ),
                                ),
                              ),
                              10.horizontalSpace,
                              MyText(
                                text: "Events",
                                fw: FontWeight.bold,
                                tsize: 20,
                                tcolor: state.selected.white,
                              )
                            ],
                          ),
                          // GestureDetector(
                          //     onTap: () {
                          //       CupertinoRoundedDatePicker.show(
                          //         context,

                          //         textColor: Colors.black,
                          //         // era: EraMode.BUDDHIST_YEAR,

                          //         borderRadius: 16,
                          //         initialDatePickerMode:
                          //             CupertinoDatePickerMode.date,
                          //         onDateTimeChanged: (newDateTime) {
                          //           //
                          //         },
                          //       );
                          //     },
                          //     child: Icon(
                          //       Icons.calendar_month,
                          //       color: state.selected.white,
                          //     ))
                        ],
                      ),
                    ),
                    Container(
                      // height: MediaQuery.of(context).size.height * 0.6,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          // border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30))),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            EventContainer(
                                heading: 'Lorem Ipsum',
                                text:
                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
                                date: '06 Nov 24, 09:00 AM',
                                ontap: () {
                                  Navigator.of(context)
                                      .push(MaterialPageRoute(builder: (cxt) {
                                    return const EventDetails();
                                  }));
                                },
                                image: "assets/png/dummy-bg.png"),
                            10.verticalSpace,
                            EventContainer(
                                heading: 'Lorem Ipsum',
                                text:
                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
                                date: '06 Nov 24, 09:00 AM',
                               ontap: () {
                                  Navigator.of(context)
                                      .push(MaterialPageRoute(builder: (cxt) {
                                    return const EventDetails();
                                  }));
                                },
                                image: "assets/png/dummy-bg.png"),
                            10.verticalSpace,
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
