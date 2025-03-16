// import 'package:Monily/app/modules/intro/views/intro_view.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:intl_phone_number_input/intl_phone_number_input.dart';
// import 'package:google_fonts/google_fonts.dart';

// class CustomPhoneField extends StatelessWidget {
//   CustomPhoneField({
//     this.phoneChanged,
//     Key? key,
//     required this.controller,
//     required this.initialValue,
//   }) : super(key: key);

//   final TextEditingController? controller;
//   TextEditingController? controller2;
//   final Function(PhoneNumber)? phoneChanged;
//   final PhoneNumber initialValue;

//   @override
//   Widget build(BuildContext context) {
//     return InternationalPhoneNumberInput(
//       onInputChanged: phoneChanged ??
//           (PhoneNumber number) {
//             print(number.phoneNumber);
//             print(number.dialCode);
//             controller?.text = number.phoneNumber.toString();
//             // phone.text = number.phoneNumber.toString();
//           },
//       onInputValidated: (bool value) {
//         print(value);
//       },
//       textFieldController: controller2,
//       selectorConfig: const SelectorConfig(
//         selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
//         setSelectorButtonAsPrefixIcon: true,
//         leadingPadding: 0,
//         trailingSpace: false,
//         useEmoji: true,
//       ),
//       ignoreBlank: false,
//       autoValidateMode: AutovalidateMode.onUnfocus,
//       selectorTextStyle: GoogleFonts.lexend(
//         fontSize: 14,
//         color: Colors.black.withOpacity(0.8),
//       ),
//       textStyle: GoogleFonts.lexend(
//         fontSize: 14,
//         color: Colors.black.withOpacity(0.8),
//       ),
//       hintText: "Phone",
//       inputDecoration: InputDecoration(
//           hintStyle: GoogleFonts.lexend(
//             fontSize: 14,
//             color: Colors.grey.withOpacity(1),
//           ),
//           fillColor: Colors.grey,
//           contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
//           // border: InputBorder.none,
//           hintText: "Phone Number",
//           enabledBorder: // InputBorder.none
//               OutlineInputBorder(
//             borderRadius: const BorderRadius.all(Radius.circular(15)).w,
//             borderSide: BorderSide(color: Colors.grey.withOpacity(0.1)),
//           ),
//           disabledBorder: // InputBorder.none,
//               OutlineInputBorder(
//             borderRadius: const BorderRadius.all(Radius.circular(15)).w,
//             borderSide: BorderSide(color: Colors.grey.withOpacity(0.1)),
//           ),
//           border: // InputBorder.none,
//               OutlineInputBorder(
//             borderRadius: const BorderRadius.all(Radius.circular(15)).w,
//             borderSide: BorderSide(color: Colors.grey.withOpacity(0.1)),
//           ),
//           errorBorder: // InputBorder.none,
//               OutlineInputBorder(
//             borderRadius: const BorderRadius.all(Radius.circular(15)).w,
//             borderSide: const BorderSide(color: Colors.red),
//           ),
//           focusedBorder: //InputBorder.none,
//               OutlineInputBorder(
//             borderRadius: const BorderRadius.all(Radius.circular(15)).w,
//             borderSide: BorderSide(color: Colors.grey.withOpacity(0.1)),
//           )
//           // contentPadding: EdgeInsets.only(bottom: .7.h)
//           ),
//       initialValue: initialValue,
//       // textFieldController:  controller.phone.value,
//       formatInput: true,
//       keyboardType: TextInputType.number,
//       // inputBorder: OutlineInputBorder(
//       //   borderSide: BorderSide(
//       //     color: Colors.red
//       //   )
//       // ),
//       inputBorder: InputBorder.none,
//       onSaved: (PhoneNumber number) {
//         // print('On Saved: $number');
//       },
//       // focusNode: controller.f2.value,
//       // onFieldSubmitted: (val) {
//       //   controller.f2.value.unfocus();
//       //   FocusScope.of(context).requestFocus(controller.f3.value);
//       // },
//     );
//   }
// }
