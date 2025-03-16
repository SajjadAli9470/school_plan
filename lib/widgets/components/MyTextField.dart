import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproduct/app_theme.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final String? labelText;
  final TextEditingController controller;
  final Widget? prefix;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatter;
  final Function()? ontap;
  final Function(String)? onFieldSubmitted;
  final bool isObsecured;
  final bool? readonly;
  void Function(String? textChanged) funcOnChangeAction;
  void Function() funcOnIsObsecured;
  String? errorText;
  final int maxLines;
  TextInputType inputType;
  final FocusNode? focus;
  final bool? ispassword;
  final Widget? suffix;
  final TextStyle? labelStyle;
  final BoxConstraints? prefixIconConstraints;
  final TextStyle? textStyle;
  final String? Function(String?)? validate;
  final Color? bgColor;
  final bool? roundBorder;

  MyTextField({
    this.suffix,
    this.roundBorder,
    this.labelText,
    this.textStyle,
    this.readonly,
    this.prefix,
    this.ontap,
    this.bgColor,
    this.prefixIconConstraints,
    this.onFieldSubmitted,
    this.inputFormatter,
    this.ispassword,
    this.focus,
    this.maxLength,
    this.labelStyle,
    this.errorText,
    super.key,
    this.validate,
    required this.hintText,
    required this.controller,
    required this.funcOnChangeAction,
    this.inputType = TextInputType.text,
    this.isObsecured = false,
    required this.funcOnIsObsecured,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 56,
      // width: 365,
      // padding: EdgeInsets.symmetric(horizontal: 7, vertical: 8),
      // decoration: BoxDecoration(
      //     color: Colors.grey, borderRadius: BorderRadius.circular(15)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // clipBehavior: Clip.none,
        // alignment: Alignment.centerLeft,
        children: [
          // Container(
          //   height: 56,
          //   padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          //   decoration: BoxDecoration(
          //       color: Colors.white, borderRadius: BorderRadius.circular(15)),
          // ),
          Container(
            // height: 40,
            child: TextFormField(
              forceErrorText: errorText,
              onFieldSubmitted: onFieldSubmitted,
              validator: validate ??
                  (value) {
                    return null;
                  },
              onTap: ontap,
              controller: controller,
              readOnly: readonly ?? false,
              obscureText: isObsecured,
              obscuringCharacter: "●",
              focusNode: focus,
              maxLines: maxLines,
              maxLength: maxLength,
              inputFormatters: inputFormatter ??
                  [
                    if (inputType == TextInputType.number)
                      FilteringTextInputFormatter.digitsOnly
                  ],
              keyboardType: inputType,
              style: textStyle ??
                  AppTheme.titleSmall.copyWith(
                    color: AppTheme.black,
                    fontSize: 15.sp,
                    // fontWeight: FontWeight.w300
                  ),
              decoration: InputDecoration(
                  prefixIconConstraints: prefixIconConstraints,
                  filled: true,
                  // fillColor: bgColor ?? Colors.grey.withOpacity(0.1),
                  hintText: hintText,
                  labelText: labelText,
                  hintStyle: labelStyle ??
                      AppTheme.titleSmall.copyWith(
                        color: AppTheme.grey,
                        fontSize: 13.sp,
                      ),
                  floatingLabelAlignment: FloatingLabelAlignment.start,
                  contentPadding:
                       EdgeInsets.symmetric(horizontal: roundBorder==true ? 10 : 2, vertical: 10),
                  labelStyle: labelStyle ??
                      AppTheme.titleSmall.copyWith(
                        color: AppTheme.grey,
                        fontSize: 13.sp,
                        // fontWeight: FontWeight.w600
                      ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  prefixIcon: prefix == null
                      ? null
                      : Container(
                          height: 20,
                          padding: const EdgeInsets.all(10.0),
                          child: prefix,
                        ), //,

                  suffixIcon: suffix ??
                      (!(ispassword ?? false)
                          ? null
                          : GestureDetector(
                              onTap: funcOnIsObsecured,
                              child: ispassword ?? false
                                  ? isObsecured
                                      ? const Icon(Icons.visibility_off_rounded)
                                      : const Icon(Icons.visibility_rounded)
                                  : const SizedBox(
                                      width: 0,
                                      height: 0,
                                    ))),
                  enabledBorder: // InputBorder.none
                    roundBorder ==true ? OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(15)).w,
                    borderSide: BorderSide(
                        color: bgColor ?? Colors.grey.withOpacity(0.3)),
                  )  : UnderlineInputBorder(
                    // borderRadius: const BorderRadius.all(Radius.circular(15)).w,
                    borderSide: BorderSide(
                        color: bgColor ?? Colors.grey.withOpacity(0.3)),
                  ),
                  disabledBorder: // InputBorder.none,
                  roundBorder ==true ? OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(15)).w,
                    borderSide: BorderSide(
                        color: bgColor ?? Colors.grey.withOpacity(0.3)),
                  ) :
                      UnderlineInputBorder(
                    // borderRadius: const BorderRadius.all(Radius.circular(15)).w,
                    borderSide: BorderSide(
                        color: bgColor ?? Colors.grey.withOpacity(0.3)),
                  ),
                  border: // InputBorder.none,
                  roundBorder ==true ? OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(15)).w,
                    borderSide: BorderSide(
                        color: bgColor ?? Colors.grey.withOpacity(0.3)),
                  ) :
                      UnderlineInputBorder(
                    // borderRadius: const BorderRadius.all(Radius.circular(15)).w,
                    borderSide: BorderSide(
                        color: bgColor ?? Colors.grey.withOpacity(0.3)),
                  ),
                  errorBorder: // InputBorder.none,
                  roundBorder ==true ? OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(15)).w,
                    borderSide: const BorderSide(
                        color: Colors.red),
                  ) :
                      const UnderlineInputBorder(
                    // borderRadius: const BorderRadius.all(Radius.circular(15)).w,
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  focusedBorder: //InputBorder.none,
                  roundBorder ==true ? OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(15)).w,
                    borderSide: BorderSide(
                        color: bgColor ?? Colors.grey.withOpacity(0.3)),
                  ) :
                      UnderlineInputBorder(
                    // borderRadius: const BorderRadius.all(Radius.circular(15)).w,
                    borderSide: BorderSide(
                        color: bgColor ?? Colors.grey.withOpacity(0.3)),
                  )
                  // labelText: hintText,
                  ),
              onChanged: funcOnChangeAction,
            ),
          ),
        ],
      ),
    );
  }
}

InputDecoration customInputDecoration(
    {required Color bgColor,
    required String hintText,
    TextStyle? labelStyle,
    Widget? prefix,
    Widget? suffix,
    bool? isObsecured,
    Function()? funcOnIsObsecured,
    bool? ispassword}) {
  return InputDecoration(
      filled: true,
      fillColor: bgColor ?? Colors.grey.withOpacity(0.1),
      hintText: hintText,
      hintStyle: labelStyle ??
          AppTheme.titleSmall.copyWith(
            color: AppTheme.grey,
            fontSize: 13.sp,
          ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      labelStyle: labelStyle ??
          AppTheme.titleSmall.copyWith(
            color: AppTheme.grey,
            fontSize: 13.sp,
            // fontWeight: FontWeight.w600
          ),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      prefixIcon: prefix == null
          ? null
          : Container(
              height: 20,
              padding: const EdgeInsets.all(10.0),
              child: prefix,
            ), //,

      suffixIcon: suffix ??
          ((isObsecured ?? false) == false
              ? null
              : GestureDetector(
                  onTap: funcOnIsObsecured,
                  child: ispassword ?? false
                      ? (isObsecured ?? false)
                          ? const Icon(Icons.visibility_off_rounded)
                          : const Icon(Icons.visibility_rounded)
                      : const SizedBox(
                          width: 0,
                          height: 0,
                        ))),
      enabledBorder: // InputBorder.none
          OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(15)).w,
        borderSide: BorderSide(color: bgColor ?? Colors.grey.withOpacity(0.1)),
      ),
      disabledBorder: // InputBorder.none,
          OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(15)).w,
        borderSide: BorderSide(color: bgColor ?? Colors.grey.withOpacity(0.1)),
      ),
      border: // InputBorder.none,
          OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(15)).w,
        borderSide: BorderSide(color: bgColor ?? Colors.grey.withOpacity(0.1)),
      ),
      errorBorder: // InputBorder.none,
          OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(15)).w,
        borderSide: const BorderSide(color: Colors.red),
      ),
      focusedBorder: //InputBorder.none,
          OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(15)).w,
        borderSide: BorderSide(color: bgColor ?? Colors.grey.withOpacity(0.1)),
      )
      // labelText: hintText,
      );
}
