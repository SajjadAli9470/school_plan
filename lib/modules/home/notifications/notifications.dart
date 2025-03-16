import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myproduct/appComponent/feesDetailContainer.dart';
import 'package:myproduct/appComponent/dashboardRectContainer.dart';
import 'package:myproduct/appComponent/dashboardSmallContainer.dart';
import 'package:myproduct/app_theme.dart';
import 'package:myproduct/bloc_state/ThemeState/theme_switch_bloc.dart';
import 'package:myproduct/widgets/components/customDivider.dart';
import 'package:myproduct/widgets/components/myText.dart';
import 'package:myproduct/widgets/components/notificationTile.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _MyDashboardState();
}

class _MyDashboardState extends State<Notifications> with TickerProviderStateMixin  {
   TabController? tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);

    super.initState();
  }

 
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
                            ),10.horizontalSpace,
                              MyText(text: "Notifications",fw: FontWeight.bold,tsize: 20,tcolor: state.selected.white,)
                            ],
                          ),
                     
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.895,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.white),
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                           TabBar(
                  dividerColor: state.selected.grey,
                  unselectedLabelColor: state.selected.grey,
                  labelStyle: AppTheme.bodyLarge.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: state.selected.primary_1),
                  unselectedLabelStyle: AppTheme.bodyLarge.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: state.selected.grey),
                  controller: tabController,
                  tabs: const [
                    Tab(
                      text: "General",
                    ),
                    Tab(
                      text: "Messages",
                    ),
                  ],
                  indicatorSize: TabBarIndicatorSize.tab,
                ),
                
                Expanded(
                  child: TabBarView(controller: tabController, children: const [
                    MyNotifications(),
                    MyMessages(),
                    
                  ]),
                )
              
                         ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

}

class MyNotifications extends StatelessWidget {
  const MyNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.verticalSpace,
             NotificationTile(
              heading: "New Event",
              subtitle: "20 Dec, 2024| 20:49 PM",
            ),
            10.verticalSpace,
            MyDivider(),
            10.verticalSpace,
             NotificationTile(
               heading: "New Events",
              subtitle: "20 Dec, 2024| 20:49 PM",
             ),
            10.verticalSpace,
            MyDivider(),
            10.verticalSpace,
             NotificationTile(
               heading: "New Events",
              subtitle: "20 Dec, 2024| 20:49 PM",
            ),
            10.verticalSpace,
            MyDivider(),
            10.verticalSpace,
             NotificationTile(
               heading: "New Events",
              subtitle: "20 Dec, 2024| 20:49 PM",
            ),
            10.verticalSpace,
            MyDivider(),
            10.verticalSpace,
             NotificationTile(
               heading: "Late Fee",
              subtitle: "20 Dec, 2024| 20:49 PM",
            ),
            10.verticalSpace,
            MyDivider(),
            10.verticalSpace,
             NotificationTile(
               heading: "Late Fee",
              subtitle: "20 Dec, 2024| 20:49 PM",
             ),
            10.verticalSpace,
            MyDivider(),
            10.verticalSpace,
            
           
          ],
        ),
      ),
    );
  }
}

class MyMessages extends StatelessWidget {
  const MyMessages({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.verticalSpace,
             NotificationTile(
              heading: "Admin",
              subtitle: "Lorem Ipsum dolar sit amet...",
            ),
            10.verticalSpace,
            MyDivider(),
            10.verticalSpace,
             NotificationTile(
               heading: "Admin",
              subtitle: "Lorem Ipsum dolar sit amet...",
             ),
            10.verticalSpace,
            MyDivider(),
            10.verticalSpace,
             NotificationTile(
               heading: "Admin",
              subtitle: "Lorem Ipsum dolar sit amet...",
            ),
            10.verticalSpace,
            MyDivider(),
            10.verticalSpace,
             NotificationTile(
               heading: "Admin",
              subtitle: "Lorem Ipsum dolar sit amet...",
            ),
            10.verticalSpace,
            MyDivider(),
            10.verticalSpace,
             NotificationTile(
               heading: "Admin",
              subtitle: "Lorem Ipsum dolar sit amet...",
            ),
            10.verticalSpace,
            MyDivider(),
            10.verticalSpace,
             NotificationTile(
               heading: "Admin",
              subtitle: "Lorem Ipsum dolar sit amet...",
             ),
            10.verticalSpace,
            MyDivider(),
            10.verticalSpace,
            
           
          ],
        ),
      ),
    );
  }
}

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeSwitchBloc, ThemeSwitchState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            10.verticalSpace,
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                  color: state.selected.white,
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                children: [
                  Image.asset("assets/icons/headphone.png"),
                  10.horizontalSpace,
                  MyText(
                    text: "Contact Us",
                    tsize: 20,
                    fw: FontWeight.bold,
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
