import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproduct/app_theme.dart';
import 'package:myproduct/bloc_state/ThemeState/theme_switch_bloc.dart';
import 'package:myproduct/widgets/components/MyTextField.dart';

class BasicDropDown extends StatefulWidget {
  final List<String>? items;
  final String title;
  final bool? enableSearch;
  final double? width;
  final double? height;
  final String? selectedItem;
  final Widget? icon;
  final Color? backGroundColor;
  final Color? textColor;
  final TextStyle? titletextStyle;
  final double? radius;
  final bool Function(DropdownMenuItem<String>, String)? searchMatchFn;
  final void Function(String) funcOnDropdownClick;

  const BasicDropDown({
    super.key,
    this.items,
    this.enableSearch,
    this.searchMatchFn,
    required this.title,
    this.icon,
    this.radius,
    this.titletextStyle,
    this.width,
    this.height,
    required this.selectedItem,
    this.backGroundColor,
    this.textColor,
    required this.funcOnDropdownClick,
  });

  @override
  State<BasicDropDown> createState() => _BasicDropDownState();
}

class _BasicDropDownState extends State<BasicDropDown> {
  final textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeSwitchBloc, ThemeSwitchState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: DropdownButton2<String>(
                customButton: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  height: widget.height ?? 30,
                  width: widget.width ?? 120.sp,
                  decoration: BoxDecoration(
                    // color: widget.backGroundColor,
                    border: Border.all(
                      color:widget.backGroundColor ?? Colors.grey, 
                    ),
                    borderRadius:
                        BorderRadius.all(Radius.circular(widget.radius ?? 15)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        widget.selectedItem == null
                            ? widget.title
                            : (widget.selectedItem!),
                        style: AppTheme.bodyMedium.copyWith(
                            color: widget.selectedItem != null
                                ? widget.textColor ?? AppTheme.black
                                : state.selected.grey,
                            fontSize: 13.sp),
                      ),
                      4.horizontalSpace,
                      widget.icon ??
                          Icon(Icons.keyboard_arrow_down_outlined,
                              color: widget.textColor ?? AppTheme.black,
                              size: 20.sp)
                    ],
                  ),
                ),
                isExpanded: false,
                // hint: Text(
                //   strDuration,
                //   style: AppTheme.titleLarge.copyWith(
                //       fontWeight: FontWeight.w600,
                //       color: textColor ?? AppTheme.black,
                //       fontSize: 11.sp),
                // ),
                // Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     crossAxisAlignment: CrossAxisAlignment.center,
                //     children: [
                //       // 4.horizontalSpace,
                //       Text(
                //         strDuration,
                //         style: AppTheme.titleLarge.copyWith(
                //             fontWeight: FontWeight.w600,
                //             color: textColor ?? AppTheme.black,
                //             fontSize: 11.sp),
                //       ),
                //       // 4.horizontalSpace,
                //       // Icon(
                //       //   Icons.keyboard_arrow_down_outlined,
                //       //   color: textColor ?? AppTheme.black,
                //       //   size: 15,
                //       // )
                //     ]),
                alignment: Alignment.center,
                // icon: const SizedBox(),
                style: AppTheme.bodySmall,
                underline: const SizedBox(),
                dropdownStyleData: DropdownStyleData(
                    maxHeight: 250.sp,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)))),

                items:
                    (widget.items ?? <String>[]).map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value,
                        style: AppTheme.bodyMedium.copyWith(
                            // fontWeight: FontWeight.w600,
                            color: AppTheme.black,
                            fontSize: 12.sp)),
                  );
                }).toList(),
                onChanged: (duration) {
                  widget.funcOnDropdownClick(duration!);
                },
                dropdownSearchData: (widget.enableSearch ?? false)
                    ? DropdownSearchData(
                        searchController: textEditingController,
                        searchInnerWidgetHeight: 50,
                        searchInnerWidget: Container(
                            // height: 50,
                            margin: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: Colors.grey.withOpacity(0.1))),
                            child: MyTextField(
                                hintText: "Search",
                                controller: textEditingController,
                                funcOnChangeAction: (a) {},
                                funcOnIsObsecured: () {})),
                        searchMatchFn: widget.searchMatchFn ??
                            (item, searchValue) {
                              return item.value
                                  .toString()
                                  .toLowerCase()
                                  .contains(searchValue.toLowerCase());
                            },
                      )
                    : null,
                //This to clear the search value when you close the menu
                onMenuStateChange: (widget.enableSearch ?? false)
                    ? (isOpen) {
                        if (!isOpen) {
                          textEditingController.clear();
                        }
                      }
                    : null,
              ),
            ),

            // Container(
            //   width: 190, // width,
            //   height: height ?? 32.h,
            //   padding:
            //       const EdgeInsets.only(left: 2, right: 2, top: 4, bottom: 4).r,
            //   decoration: BoxDecoration(
            //       color: backGroundColor ?? AppTheme.white,
            //       borderRadius: const BorderRadius.all(Radius.circular(18)).w,
            //       border:
            //           Border.all(color: backGroundColor ?? AppTheme.color_E4E4E4)),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     children: [
            //       DropdownButton2<String>(
            //         isExpanded: false,
            //         hint: Text(
            //           strDuration,
            //           style: AppTheme.titleLarge.copyWith(
            //               fontWeight: FontWeight.w600,
            //               color: textColor ?? AppTheme.black,
            //               fontSize: 11.sp),
            //         ),
            //         // Row(
            //         //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         //     crossAxisAlignment: CrossAxisAlignment.center,
            //         //     children: [
            //         //       // 4.horizontalSpace,
            //         //       Text(
            //         //         strDuration,
            //         //         style: AppTheme.titleLarge.copyWith(
            //         //             fontWeight: FontWeight.w600,
            //         //             color: textColor ?? AppTheme.black,
            //         //             fontSize: 11.sp),
            //         //       ),
            //         //       // 4.horizontalSpace,
            //         //       // Icon(
            //         //       //   Icons.keyboard_arrow_down_outlined,
            //         //       //   color: textColor ?? AppTheme.black,
            //         //       //   size: 15,
            //         //       // )
            //         //     ]),
            //         alignment: Alignment.center,
            //         // icon: const SizedBox(),
            //         style: AppTheme.bodySmall,
            //         underline: const SizedBox(),
            //         items: (items ??
            //                 <String>[
            //                   if (!Strings.dropdownOnly6MonthsList.contains(title))
            //                     Strings.last12Months,
            //                   Strings.last6Months,
            //                   if (!Strings.dropdownOnly6MonthsList.contains(title))
            //                     Strings.last30Days
            //                 ])
            //             .map((String value) {
            //           return DropdownMenuItem<String>(
            //             value: value,
            //             child: Text(value,
            //                 style: AppTheme.titleLarge.copyWith(
            //                     fontWeight: FontWeight.w600,
            //                     color: AppTheme.black,
            //                     fontSize: 12.sp)),
            //           );
            //         }).toList(),
            //         onChanged: (duration) {
            //           funcOnDropdownClick(duration!);
            //         },
            //       ),
            //     ],
            //   ),
            // )
          ],
        );
      },
    );
  }
}
