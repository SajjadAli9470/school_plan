import 'package:flutter/material.dart';
import 'package:myproduct/widgets/components/myText.dart';
import 'package:toastification/toastification.dart';

showCustomToast({
  required BuildContext context,
  required int statusCode,
  required String title,
  String? subtitle,
}) {
  final myColor = statusCode == 1
      ? Colors.green
      : statusCode == 2
          ? Colors.red
          : statusCode == 3
              ? Colors.orange
              : Colors.blue;
  toastification.dismissAll();

  toastification.show(
    context: context, // optional if you use ToastificationWrapper
    type: statusCode == 1
        ? ToastificationType.success
        : statusCode == 2
            ? ToastificationType.error
            : statusCode == 3
                ? ToastificationType.warning
                : ToastificationType.info,
    style: ToastificationStyle.flatColored,
    autoCloseDuration: const Duration(seconds: 5),
    title: MyText(
      text: title,
      tsize: 12,
      tcolor: Colors.black,
      fw: FontWeight.bold,
    ),

    // you can also use RichText widget for title and description parameters
    description: subtitle != null
        ? MyText(
            text: subtitle,
            tsize: 12,
            tcolor: Colors.black,
          )
        : null,
    alignment: Alignment.topRight,
    direction: TextDirection.ltr,
    animationDuration: const Duration(milliseconds: 300),
    animationBuilder: (context, animation, alignment, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
    icon: Icon(statusCode == 1
        ? Icons.check_circle_rounded
        : statusCode == 2
            ? Icons.error
            : statusCode == 3
                ? Icons.warning_rounded
                : Icons.info),
    showIcon: true,
    primaryColor: myColor,
    // backgroundColor: myColor.withOpacity(0.1),
    foregroundColor: Colors.black,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    borderRadius: BorderRadius.circular(12),
    // borderSide: BorderSide(color: myColor),

    boxShadow: const [
      BoxShadow(
        color: Color(0x07000000),
        blurRadius: 16,
        offset: Offset(0, 16),
        spreadRadius: 0,
      )
    ],
    showProgressBar: false,
    closeButtonShowType: CloseButtonShowType.none,
    closeOnClick: false,
    pauseOnHover: true,
    dragToClose: true,
    applyBlurEffect: true,
    callbacks: ToastificationCallbacks(
      onTap: (toastItem) => print('Toast ${toastItem.id} tapped'),
      onCloseButtonTap: (toastItem) {
        toastItem.stop();
      },
      onAutoCompleteCompleted: (toastItem) =>
          print('Toast ${toastItem.id} auto complete completed'),
      onDismissed: (toastItem) => print('Toast ${toastItem.id} dismissed'),
    ),
  );
}
