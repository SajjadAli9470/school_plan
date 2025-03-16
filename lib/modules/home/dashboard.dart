import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myproduct/appComponent/dashboardRectContainer.dart';
import 'package:myproduct/appComponent/dashboardSmallContainer.dart';
import 'package:myproduct/bloc_state/ThemeState/theme_switch_bloc.dart';
import 'package:myproduct/modules/home/calenders/eventCalenders.dart';
import 'package:myproduct/modules/home/eventsManagment/myevents.dart';
import 'package:myproduct/modules/home/feesManagment/feesDetails.dart';
import 'package:myproduct/modules/home/notifications/notifications.dart';
import 'package:myproduct/widgets/components/myText.dart';

class MyDashboard extends StatefulWidget {
  const MyDashboard({super.key});

  @override
  State<MyDashboard> createState() => _MyDashboardState();
}

class _MyDashboardState extends State<MyDashboard> {
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
                      child: Column(
                        children: [
                          Container(
                            // padding: EdgeInsets.all(
                            //     MediaQuery.of(context).viewInsets.bottom == 0
                            //         ? 30
                            //         : 10),
                            // height: MediaQuery.of(context).viewInsets.bottom == 0
                            //     ? size.height * 0.30
                            //     : size.height * 0.15,
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(1),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: state.selected.white),
                                      borderRadius: BorderRadius.circular(100)),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Image.asset(
                                      "assets/png/dummy-school.png",
                                      height: 80,
                                      width: 80,
                                    ),
                                  ),
                                ),
                                10.horizontalSpace,
                                MyText(
                                  text: "Abc School",
                                  fw: FontWeight.bold,
                                  tsize: 30,
                                  tcolor: state.selected.white,
                                )
                              ],
                            ),
                          ),
                          30.verticalSpace,
                        ],
                      ),
                    ),
                    Container(
                      // height: MediaQuery.of(context).size.height * 0.6,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.white),
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30))),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                DashboardSmallContainer(
                                  heading: "Performance",
                                  value: "0.39%",
                                  bgColor: state.selected.primary_2,
                                ),
                                DashboardSmallContainer(
                                  heading: "Fee Dues",
                                  value: "Rs 6400",
                                  bgColor: state.selected.primary_3,
                                )
                              ],
                            ),
                            30.verticalSpace,
                            Column(
                              children: [
                                DashboardRectContainer(
                                  heading: "Fee Managment",
                                  ontap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(builder: (cxt) {
                                      return const FeesDetails();
                                    }));
                                  },
                                  svg: "assets/svg/fee.svg",
                                ),
                                10.verticalSpace,
                                DashboardRectContainer(
                                  heading: "Events",
                                  ontap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(builder: (cxt) {
                                      return const EventManagments();
                                    }));
                                  },
                                  svg: "assets/svg/event.svg",
                                ),
                                10.verticalSpace,
                                DashboardRectContainer(
                                  heading: "Performance Overview",
                                  ontap: () {},
                                  svg: "assets/svg/performance.svg",
                                ),
                                10.verticalSpace,
                                DashboardRectContainer(
                                  heading: "Notifications & Communication",
                                  ontap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(builder: (cxt) {
                                      return const Notifications();
                                    }));
                                  },
                                  svg: "assets/svg/notification.svg",
                                ),
                                10.verticalSpace,
                                DashboardRectContainer(
                                  heading: "More Info",
                                  ontap: () {
                                     Navigator.of(context)
                                        .push(MaterialPageRoute(builder: (cxt) {
                                      return const EventCalendarScreen();
                                    }));
                                  },
                                  svg: "assets/svg/moreinfo.svg",
                                ),
                                10.verticalSpace,
                              ],
                            )
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
