
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproduct/app_theme.dart';
import 'package:myproduct/bloc_state/ThemeState/theme_switch_bloc.dart';
import 'package:myproduct/widgets/components/CustomChip.dart';
import 'package:myproduct/widgets/components/MyTextField.dart';

class MultipleSelectionDropDown extends StatefulWidget {
  final List<String>? items;
  final String title;
  final bool? enableSearch;
  final double? width;
  final double? height;
  final List<String> selectedItem;
  final Color? backGroundColor;
  final Color? textColor;
  final Function(int) onDeleted;
  final TextStyle? titletextStyle;
  final bool Function(DropdownMenuItem<String>, String)? searchMatchFn;
  final Function(String?)? funcOnDropdownClick;

  const MultipleSelectionDropDown({
    Key? key,
    this.items,
    this.searchMatchFn,
    this.enableSearch,
    required this.title,
    this.titletextStyle,
    required this.onDeleted,
    this.width,
    this.height,
    required this.selectedItem,
    this.backGroundColor,
    this.textColor,
    required this.funcOnDropdownClick,
  }) : super(key: key);

  @override
  State<MultipleSelectionDropDown> createState() =>
      _MultipleSelectionDropDownState();
}

class _MultipleSelectionDropDownState extends State<MultipleSelectionDropDown> {
  final textEditingController = TextEditingController();
  // List<IdnameModel> selectedItems = [];
  @override
  void initState() {
    // selectedItems = widget.selectedItem;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeSwitchBloc, ThemeSwitchState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Row(
            //   children: [
            //     Text(
            //       totalUnpaid,
            //       style: AppTheme.bodyMedium.copyWith(
            //           fontWeight: FontWeight.w600,
            //           color: AppTheme.color_777879,
            //           fontSize: 20.sp),
            //     ),
            //     SizedBox(
            //       width: 5,
            //     ),
            //     Text(
            //       title,
            //       style: titletextStyle ??
            //           AppTheme.bodyMedium.copyWith(
            //               fontWeight: FontWeight.w700,
            //               color: AppTheme.black,
            //               fontSize: 20.sp),
            //     ),
            //   ],
            // ),
            Container(
              child: DropdownButton2<String>(
                customButton: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  constraints: BoxConstraints(
                    minHeight: widget.height ?? 30,
                  ),
                  width: widget.width ?? 120.sp,
                  decoration: BoxDecoration(
                    color: widget.backGroundColor,
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      widget.selectedItem.isEmpty
                          ? Text(
                              widget.title,
                              style: AppTheme.bodyMedium.copyWith(
                                  // fontWeight: FontWeight.w600,
                                  color: widget.selectedItem.isEmpty
                                      ? widget.textColor ?? AppTheme.grey
                                      : state.selected.grey,
                                  fontSize: 13.sp),
                            )
                          : true
                              ? Container(
                                  width: (widget.width ?? 120.sp) - 50,
                                  child: Wrap(
                                    runSpacing: 2,
                                    spacing: 2,
                                    children: [
                                      ...widget.selectedItem.map((e) => My_Chip(
                                            label: e,
                                            onDeleted: widget.onDeleted,
                                            index:
                                                widget.selectedItem.indexOf(e),
                                          ))
                                    ],
                                  ),
                                )
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ...widget.selectedItem.map(
                                      (item) {
                                        return Container(
                                          child: Text(
                                            widget.selectedItem.indexOf(item) ==
                                                    widget.selectedItem.length -
                                                        1
                                                ? "${item}"
                                                : "${item}, ",
                                            textAlign: TextAlign.start,
                                            style: AppTheme.bodyMedium.copyWith(
                                                // fontWeight: FontWeight.w600,
                                                color: AppTheme.black,
                                                fontSize: 12.sp),
                                            maxLines: 5,
                                          ),
                                        );
                                      },
                                    ).toList(),
                                  ],
                                ),
                      // Text(
                      //   selectedItems.isEmpty?  widget.title : (selectedItems.name),
                      //   style: AppTheme.bodyMedium.copyWith(
                      //       fontWeight: FontWeight.w600,
                      //       color: widget.selectedItem != null
                      //           ? widget.textColor ?? AppTheme.black
                      //           : state.selected.grey,
                      //       fontSize: 15.sp),
                      // ),
                      4.horizontalSpace,
                      Icon(
                        Icons.keyboard_arrow_down_outlined,
                        color: widget.textColor ?? AppTheme.black,
                        size: 20.sp,
                      )
                    ],
                  ),
                ),
                selectedItemBuilder: (context) {
                  return widget.selectedItem.map(
                    (item) {
                      return Container(
                        alignment: AlignmentDirectional.center,
                        child: Text(
                          widget.selectedItem.join(', '),
                          style: AppTheme.bodyMedium.copyWith(
                              // fontWeight: FontWeight.w600,
                              color: AppTheme.black,
                              fontSize: 12.sp),
                          maxLines: 1,
                        ),
                      );
                    },
                  ).toList();
                },
                isExpanded: false,
                // hint: Text(
                //   strDuration,
                //   style: AppTheme.bodyMedium.copyWith(
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
                //         style: AppTheme.bodyMedium.copyWith(
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
                underline: SizedBox(),
                dropdownStyleData: DropdownStyleData(
                    maxHeight: 250.sp,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)))),

                items:
                    (widget.items ?? <String>[]).map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: StatefulBuilder(builder: (context, menuSetState) {
                      final isSelected = widget.selectedItem.contains(value);
                      return InkWell(
                        onTap: () {
                          isSelected
                              ? widget.selectedItem.remove(value)
                              : widget.selectedItem.add(value);
                          //This rebuilds the StatefulWidget to update the button's text
                          setState(() {});
                          //This rebuilds the dropdownMenu Widget to update the check mark
                          menuSetState(() {});
                        },
                        child: Container(
                          height: double.infinity,
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            children: [
                              if (isSelected)
                                const Icon(Icons.check_box_outlined)
                              else
                                const Icon(Icons.check_box_outline_blank),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Text(value,
                                    style: AppTheme.bodyMedium.copyWith(
                                        // fontWeight: FontWeight.w600,
                                        color: AppTheme.black,
                                        fontSize: 12.sp)),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  );
                }).toList(),
                onChanged: widget.funcOnDropdownClick,
                //  (duration) {
                //   // widget.funcOnDropdownClick.call((duration!));
                // },
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
                        searchMatchFn: widget.searchMatchFn ?? (item, searchValue) {
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
            //           style: AppTheme.bodyMedium.copyWith(
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
            //         //         style: AppTheme.bodyMedium.copyWith(
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
            //                 style: AppTheme.bodyMedium.copyWith(
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
