import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myproduct/appComponent/feesDetailContainer.dart';
import 'package:myproduct/appComponent/dashboardRectContainer.dart';
import 'package:myproduct/appComponent/dashboardSmallContainer.dart';
import 'package:myproduct/bloc_state/ThemeState/theme_switch_bloc.dart';
import 'package:myproduct/widgets/components/myText.dart';

class FeesDetails extends StatefulWidget {
  const FeesDetails({super.key});

  @override
  State<FeesDetails> createState() => _MyDashboardState();
}

class _MyDashboardState extends State<FeesDetails> {
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
                              ),10.horizontalSpace,
                                MyText(text: "Fee Details",fw: FontWeight.bold,tsize: 20,tcolor: state.selected.white,)
                              ],
                            ),
                             GestureDetector(
                              onTap: (){
                                 CupertinoRoundedDatePicker.show(
                                          context,
                                          fontFamily: "Mali",
                                          textColor: Colors.black,
                                          // era: EraMode.BUDDHIST_YEAR,

                                          borderRadius: 16,
                                          initialDatePickerMode:
                                              CupertinoDatePickerMode.date,
                                          onDateTimeChanged: (newDateTime) {
                                            //
                                          },
                                        );
                              },
                              child: Icon(Icons.calendar_month,color: state.selected.white,))

                         
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
                        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                           FeesDetailsContainer(
                            amount: "Rs 16,600",
                            date: "06 May",
                            ontap: (){},
                            heading: "School Fee for January",
                            paid: false,
                           ),
                           10.verticalSpace,
                           FeesDetailsContainer(
                            amount: "Rs 16,600",
                            date: "06 May",
                            ontap: (){},
                            heading: "School Fee for January",
                            paid: false,
                           ),
                           10.verticalSpace,
                           FeesDetailsContainer(
                            amount: "Rs 16,600",
                            date: "06 May",
                            ontap: (){},
                            heading: "School Fee for January",
                            paid: false,
                           ),
                           10.verticalSpace,
                           FeesDetailsContainer(
                            amount: "Rs 16,600",
                            date: "06 May",
                            ontap: (){},
                            heading: "School Fee for January",
                            paid: false,
                           ),
                           10.verticalSpace,
                           FeesDetailsContainer(
                            amount: "Rs 16,600",
                            date: "06 May",
                            ontap: (){},
                            heading: "School Fee for January",
                            paid: false,
                           ),
                           10.verticalSpace,
                           FeesDetailsContainer(
                            amount: "Rs 16,600",
                            date: "06 May",
                            ontap: (){},
                            heading: "School Fee for January",
                            paid: false,
                           ),
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