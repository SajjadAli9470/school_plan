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
import 'package:myproduct/widgets/components/MyTextField.dart';
import 'package:myproduct/widgets/components/customFormField.dart';
import 'package:myproduct/widgets/components/myButton.dart';
import 'package:myproduct/widgets/components/myDropDown.dart';
import 'package:myproduct/widgets/components/myText.dart';

class PayNow extends StatefulWidget {
  const PayNow({super.key});

  @override
  State<PayNow> createState() => _MyDashboardState();
}

class _MyDashboardState extends State<PayNow> {
  final _date = TextEditingController();
  final _totalFees = TextEditingController();
  String? bankName;
  final _accountName = TextEditingController();
  final _iban = TextEditingController();
  final _branch = TextEditingController();

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
                                text: "Pay Online",
                                fw: FontWeight.bold,
                                tsize: 20,
                                tcolor: state.selected.white,
                              )
                            ],
                          ),
                          //  Icon(Icons.calendar_month,color: state.selected.white,)
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
                            CustomFormField(
                                item: MyTextField(
                                    hintText: "01 Nov 2024",
                                    controller: _date,
                                    suffix: GestureDetector(
                                      onTap: () {
                                        /// Current locale is TH.
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
                                      child: Icon(
                                        Icons.calendar_month_outlined,
                                        color: state.selected.grey,
                                      ),
                                    ),
                                    funcOnChangeAction: (v) {},
                                    funcOnIsObsecured: () {}),
                                title: "Date"),
                            10.verticalSpace,
                            CustomFormField(
                                item: MyTextField(
                                    hintText: "Rs 16,600",
                                    controller: _totalFees,
                                    // suffix: GestureDetector(child: Icon(Icons.calendar_month_outlined,color: state.selected.grey,),),
                                    funcOnChangeAction: (v) {},
                                    funcOnIsObsecured: () {}),
                                title: "Total Fees"),
                            10.verticalSpace,
                            CustomFormField(
                                item: Column(
                                  children: [
                                    CustomFormField(
                                        fw: FontWeight.normal,
                                        item: BasicDropDown(
                                            width: size.width * 0.89,
                                            height: 45,
                                            radius: 10,
                                            backGroundColor: state.selected.grey
                                                .withOpacity(0.3),
                                            title: "Bank Al Habib ",
                                            selectedItem: bankName,
                                            funcOnDropdownClick: (v) {}),
                                        title: "Bank Name"),
                                    10.verticalSpace,
                                    CustomFormField(
                                        fw: FontWeight.normal,
                                        item: MyTextField(
                                            roundBorder: true,
                                            hintText: "Lorem ipsum",
                                            controller: _accountName,
                                            // suffix: GestureDetector(child: Icon(Icons.calendar_month_outlined,color: state.selected.grey,),),
                                            funcOnChangeAction: (v) {},
                                            funcOnIsObsecured: () {}),
                                        title: "Account Name"),
                                    10.verticalSpace,
                                    CustomFormField(
                                        fw: FontWeight.normal,
                                        item: MyTextField(
                                            roundBorder: true,
                                            hintText: "xxxx xxxx xxxx xxxx",
                                            controller: _iban,
                                            // suffix: GestureDetector(child: Icon(Icons.calendar_month_outlined,color: state.selected.grey,),),
                                            funcOnChangeAction: (v) {},
                                            funcOnIsObsecured: () {}),
                                        title: "Account Number/IBAN"),
                                    10.verticalSpace,
                                    CustomFormField(
                                        fw: FontWeight.normal,
                                        item: MyTextField(
                                            roundBorder: true,
                                            hintText: "Choose one",
                                            controller: _branch,
                                            // suffix: GestureDetector(child: Icon(Icons.calendar_month_outlined,color: state.selected.grey,),),
                                            funcOnChangeAction: (v) {},
                                            funcOnIsObsecured: () {}),
                                        title: "Branch Name"),
                                  ],
                                ),
                                title: "Pay With"),
                            20.verticalSpace,
                            MyButton(
                              bgcolor: state.selected.primary_1,
                              disable: false,
                              isLoading: false,
                              text: "PAY NOW",
                              ontap: () {},
                              fixedPosition: true,
                              icon: Icon(
                                Icons.arrow_forward,
                                color: state.selected.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
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
