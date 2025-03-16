
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproduct/bloc_state/NavigationBloc/navigation_bloc.dart';
import 'package:myproduct/bloc_state/ThemeState/theme_switch_bloc.dart';
import 'package:myproduct/widgets/components/myText.dart';
import 'package:myproduct/widgets/components/showImage.dart';

class MyHeader extends StatelessWidget {
  const MyHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, nstate) {
          return BlocBuilder<ThemeSwitchBloc, ThemeSwitchState>(
            builder: (context, state) {
               return Container(
                    padding: EdgeInsets.only(
                        left: 10, right: 10, top: 15, bottom: 10),
                    decoration: BoxDecoration(
                        color: state.selected.white,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                    // height: 130.h,
                    width: MediaQuery.sizeOf(context).width,
                    child: Align(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  showImage(
                                      height: 45,
                                      width: 45,
                                      url: '',
                                      ontap: () {}),
                                  5.horizontalSpace,
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.47,
                                    child: MyText(
                                      text: "Name",
                                      fw: FontWeight.bold,
                                      tsize: 20,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                  onTap: () {
                                   
                                  },
                                  child: Container(
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          border: Border.all(
                                              color: state.selected.grey
                                                  .withOpacity(0.3))),
                                      child: Image.asset(
                                          height: 25,
                                          "assets/icons/notification.png"))),
                              20.horizontalSpace,
                              GestureDetector(
                                  onTap: () {
                                   
                                  },
                                  child: Container(
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          border: Border.all(
                                              color: state.selected.grey
                                                  .withOpacity(0.3))),
                                      child: Image.asset(
                                          height: 25,
                                          "assets/icons/setting.png"))),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                
            },
          );
        },
      ),
    );
  }
}
