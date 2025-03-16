import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproduct/bloc_state/ThemeState/theme_switch_bloc.dart';
import 'package:myproduct/widgets/components/myButton.dart';
import 'package:myproduct/widgets/components/myText.dart';

class MyBanner extends StatelessWidget {
  const MyBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeSwitchBloc, ThemeSwitchState>(
      builder: (context, state) {
        return Container(
          height: 150.sp,
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    'assets/talent/bannerbg.png',
                  ))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    maxlines: 2,
                    text: "Find a job \nQuickly!",
                    tsize: 22.sp,
                    fw: FontWeight.bold,
                    tcolor: Colors.white,
                  ),
                  20.verticalSpace,
                  MyButton(
                      height: 30,
                      radius: 100,
                      fontWeight: FontWeight.bold,
                      mainAlign: MainAxisAlignment.center,
                      width: 100,
                      tsize: 12.sp,
                      bgcolor: Colors.white,
                      tcolor: state.selected.primary_1,
                      disable: false,
                      isLoading: false,
                      text: "See All Jobs",
                      ontap: () {
                        
                      }),
                ],
              ),
              // 20.verticalSpace,
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    height: 120.sp,
                    // width: MediaQuery.sizeOf(context).width,
                    "assets/talent/home_banner_model.png",
                    fit: BoxFit.fill,
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
