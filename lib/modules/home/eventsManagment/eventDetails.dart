import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproduct/bloc_state/ThemeState/theme_switch_bloc.dart';
import 'package:myproduct/widgets/components/myText.dart';

class EventDetails extends StatefulWidget {
  const EventDetails({super.key});

  @override
  State<EventDetails> createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeSwitchBloc, ThemeSwitchState>(
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  Image.asset("assets/png/dummy-bg.png"),
                  10.verticalSpace,
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                      children: [
                        Icon(
                          Icons.access_time_rounded,
                          color: state.selected.primary_1,
                        ),
                        3.horizontalSpace,
                        MyText(
                          text: '06 Nov 24, 09:00 AM',
                          tcolor: state.selected.primary_1,
                        ),
                      ],
                    ),
                    20.verticalSpace,
                    MyText(text: "The Standard Lorem ipsum passage"),
                    10.verticalSpace,
                    MyText(
                      tsize: 13,
                      text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ')
                                
                      ],
                    ),
                  )
                  ],
              ),
              Positioned(
                top: 40,
                left: 20,
                child: GestureDetector(
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
                              ),)
            ],
          ),
        );
      },
    );
  }
}
