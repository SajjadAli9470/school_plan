import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as path;

extension on int {
  String get priceString {
    final numberString = toString();
    final numberDigits = List.from(numberString.split(''));
    int index = numberDigits.length - 3;

    while (index > 0) {
      numberDigits.insert(index, ',');

      index -= 3;
    }
    return numberDigits.join();
  }
}

extension NumExtensions on num {
  bool get isInt => (this % 1) == 0;
}

class AppUtils {
  static DateTime getPreviousMonthsStartDate(
      DateTime currentDate, int prevMonths) {
    int year = currentDate.year;
    int month = currentDate.month - prevMonths;

    while (month <= 0) {
      year -= 1;
      month += 12;
    }
    log("Starting point : ${DateTime(year, month, 1)} --------- Ending points ${currentDate}");
    return DateTime(year, month, 1);
  }

  static humanReadableNumber(int numberToFormat) {
    return NumberFormat.compactCurrency(
      decimalDigits: 0,
      // locale: 'en_IN',
      symbol: '',
    ).format(numberToFormat);
  }

  static hideKeyboard(BuildContext context) {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static showSuccessDialog(
      BuildContext context, String title, String desc, bool goBack) {
    // AwesomeDialog(
    //   context: context,
    //   dialogType: DialogType.SUCCES,
    //   animType: AnimType.BOTTOMSLIDE,
    //   title: title,
    //   dialogBackgroundColor: AppTheme.mainColor,
    //   titleTextStyle: AppTheme.titleWhite.copyWith(color: Colors.green),
    //   desc: desc,
    //   btnOkOnPress: () {
    //     if (goBack) {
    //       final HomeController homeController = Get.put(HomeController());
    //       homeController.activeIndex.value = 0;
    //       Get.delete<AddController>();
    //     } else if (title == Strings.userRegistered) {
    //       final AuthController authController = Get.put(AuthController());
    //       authController.userIsRegistered.value = true;
    //     } else if (title == Strings.userUpdated) {
    //       final ProfileController profileController =
    //           Get.put(ProfileController());
    //       profileController.accountIsUpdating.value = false;
    //       profileController.isProfileEditing.value = false;
    //     }
    //   },
    // ).show();
  }

  static showErrorDialog(BuildContext context, String error) {
    // AwesomeDialog(
    //   context: context,
    //   dialogType: DialogType.ERROR,
    //   animType: AnimType.BOTTOMSLIDE,
    //   title: 'Something went wrong',
    //   dialogBackgroundColor: AppTheme.mainColor,
    //   titleTextStyle: AppTheme.titleWhite.copyWith(color: Colors.red),
    //   desc: 'error was: $error',
    //   btnOkOnPress: () {
    //     // final HomeController homeController = Get.put(HomeController());
    //     // homeController.activeIndex.value = 0;
    //     // Get.delete<AddController>();
    //   },
    // ).show();
  }

  static showLoginDialog(BuildContext context, String error) {
    // AwesomeDialog(
    //   context: context,
    //   dialogType: DialogType.INFO,
    //   animType: AnimType.BOTTOMSLIDE,
    //   title: 'Please Login First',
    //   dialogBackgroundColor: AppTheme.mainColor,
    //   titleTextStyle: AppTheme.titleWhite.copyWith(color: AppTheme.buttonBlack),
    //   desc: 'Please Login First to use this feature',
    //   descTextStyle: AppTheme.caption.copyWith(color: AppTheme.boxShadow),
    //   btnOkOnPress: () {
    //     // final HomeController homeController = Get.put(HomeController());
    //     // homeController.activeIndex.value = 0;
    //     // Get.delete<AddController>();
    //   },
    // ).show();
  }

  static getTimeInAgoFormat(String time) {
    // return StringExtensions.displayTimeAgoFromTimestamp(time);
  }
// DateTime.parse("2023-01-01")

  // static String startDate =
  //     DateFormat('yyyy-MM-dd').format(DateTime(2020,DateTime.january,1));
  // static String startDate =
  //     DateFormat('yyyy-MM-dd').format(DateTime(DateTime.now().year,DateTime.january,1));
  // original -------

  static String currentYearStDt = DateFormat('yyyy-MM-dd')
      .format(DateTime(DateTime.now().year, DateTime.january, 1));

  static String currentMonth = DateFormat('yyyy-MM-dd')
      .format(DateTime(DateTime.now().year, DateTime.now().month, 1));

  static String currentQuarter = DateFormat('yyyy-MM-dd')
      .format(DateTime.now().subtract(Duration(days: 90)));

  static String prevYearStDt = DateFormat('yyyy-MM-dd')
      .format(DateTime(DateTime.now().year - 1, DateTime.january, 1));

  static String prevEndDate = DateFormat('yyyy-MM-dd').format(
      DateTime(DateTime.now().year - 1, DateTime.january, 1).add(Duration(
          days: DateTime.now()
              .difference(DateTime(DateTime.now().year, 01, 01))
              .inDays)));

  // static String currentYearStDt =
  //     DateFormat('yyyy-MM-dd').format(DateTime(2023, DateTime.january, 1));

  // static String startDate =
  //     DateFormat('yyyy-MM-dd').format(DateTime(2023, DateTime.january, 1));

  static String startDate =
      DateFormat('yyyy-MM-dd').format(DateTime(2022, DateTime.january, 1));

  static String formatDate(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  // static String endDate =
  //     DateFormat('yyyy-MM-dd').format(DateTime(2023));

  // static String endDate =
  //     DateFormat('yyyy-MM-dd').format(DateTime(2023, DateTime.december, 30));

  static String endDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

  static String formatMMDDYY(String inputDate) {
    return DateFormat('dd MMM, yyyy').format(DateTime.parse(inputDate));
  }

  static String formatMMM(String inputDate) {
    return DateFormat('MMM').format(DateTime.parse(inputDate));
  }

  static String formatMMMYYYY(String inputDate) {
    return DateFormat('MMM  yyyy').format(DateTime.parse(inputDate));
  }

  static String formatDD(String inputDate) {
    return DateFormat('dd').format(DateTime.parse(inputDate));
  }

  static String formatDDMMYYHHMM(String inputDate) {
    return DateFormat('dd MMM, yyyy | hh:mm').format(DateTime.parse(inputDate));
  }

  static String formatMMDDYYHHMM(String inputDate) {
    return DateFormat('MMM dd, yyyy | hh:mm').format(DateTime.parse(inputDate));
  }

  static String formatMMDDYYUSA(String inputDate) {
    return DateFormat('MMM dd, yyyy | hh:mm').format(DateTime.parse(inputDate));
  }

  static String formatDDMMYYHHMMSS(String inputDate) {
    return DateFormat('dd MMM, yyyy | hh:mm:ss')
        .format(DateTime.parse(inputDate));
  }
  // static String formatMMDDYYHHMMSS(String inputDate) {
  //   print(inputDate);
  //   return DateFormat('dd MMM, yyyy | hh:mm:ss').format(DateTime.parse(inputDate));
  // }

  static RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  static String Function(Match) mathFunc = (Match match) => '${match[1]},';

  static String amountWitCommas(String amount) {
    try {
      // log(" Amount to convert : ${amount.isEmpty}");
      // log(amount.toString());

      // final amm = double.tryParse(amount.isEmpty ? "0" : amount) ?? 0;
      String ammountt = amount.isEmpty ? "0.0" : amount;
      // if (amm < 0) {
      //   ammountt = (amm * -1).toString();
      // }

      if (ammountt.length <= 3) return ammountt;
      if (isDouble(amount)) {
        var splitAmount = ammountt.split('.');

        return '${int.parse(splitAmount[0]).priceString}.${splitAmount[1]}';
      }

      // log(" Updated Amount Amount  : ${int.parse(ammountt).priceString} ");
      return int.parse(ammountt).priceString;
    } catch (e) {
      return amount;
    }
  }

  static bool isDouble(String number) {
    if (int.tryParse(number) == null) {
      if (double.parse(number).isFinite) return true;
    }
    return false;
  }

  static String daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    var value = (to.difference(from).inHours / 24).round();
    return value >= 0
        ? 'Due in $value days'
        : 'Overdue ${value.toString().replaceAll('-', '')} days';
  }

  static int countDaysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    int value = (to.difference(from).inHours / 24).round();
    return value;
  }
}

String formatDateRange(String startDateStr, String endDateStr) {
  // log(startDateStr.toString());
  // Define date format
  DateFormat formatter = DateFormat('yyyy-MM-dd');

  // Parse input strings to DateTime objects
  DateTime startDate = formatter.parse(startDateStr);
  DateTime endDate = formatter.parse(endDateStr);

  // Format DateTime objects to the desired format
  DateFormat outputFormat = DateFormat('dd MMM');
  String formattedStartDate = outputFormat.format(startDate);
  String formattedEndDate = outputFormat.format(endDate);

  // Concatenate formatted dates with a hyphen to represent the range
  return '$formattedStartDate - $formattedEndDate ${startDate.year}';
}

List<String> halfMonthNames = [
  'Jan',
  'Feb',
  'Mar',
  'Apr',
  'May',
  'Jun',
  'Jul',
  'Aug',
  'Sep',
  'Oct',
  'Nov',
  'Dec'
];
List<String> fullMonthNames = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'Septemper',
  'October',
  'November',
  'December'
];

String getHalfMonthName(int monthIndex) {
  if (monthIndex < 1 || monthIndex > 12) {
    throw ArgumentError('Invalid month index. It should be between 1 and 12.');
  }

  int adjustedIndex = monthIndex - 1;

  // Return the half-month name
  return halfMonthNames[adjustedIndex];
}

String getfullMonthName(int monthIndex) {
  if (monthIndex < 1 || monthIndex > 12) {
    throw ArgumentError('Invalid month index. It should be between 1 and 12.');
  }

  int adjustedIndex = monthIndex - 1;

  // Return the half-month name
  return fullMonthNames[adjustedIndex];
}

String getInitials(String name) {
  if (name.isNotEmpty) {
    List<String> names = name.split(' ');
    log(names.toString());
    String firstName = names[0];
    String lastName = names.length == 1
        ? name.length > 1
            ? name[1]
            : ''
        : names[1];
    String initials = firstName[0].toUpperCase() + lastName[0].toUpperCase();
    return initials;
  } else {
    return "";
  }
}

String extensionIcon(String ext) {
  return "assets/extIcon/$ext.png";
}

List<String> extIcons = [
  // "csv",
  // "docx",
  "jpeg",
  "jpg",
  'mp4',
  // ,"json"

  "pdf",
  "png",
  "webp"
  // ,"svg"
  // ,"xls"
];
List<String> videoExtIcons = [
  'mp4',

  // ,"xls"
];
List<String> imageIcons = [
  // "csv",
  "jpeg", "jpg", "png", "webp"
];

bool checkFileExtension(String filePath, List<String> allowedExtensions) {
  // Check if the file exists
  // if (!File(filePath).existsSync()) {
  //   return false;
  // }

  // Get the file extension
  String fileExtension = path.extension(filePath);

  log("Path : $filePath");
  log("File Extension : $allowedExtensions");

  // Check if the file extension is in the list of allowed extensions
  return allowedExtensions
      .contains(fileExtension.replaceAll(".", "").toLowerCase());
}

String getExtension(String filePath) {
  // Check if the file exists
  // if (!File(filePath).existsSync()) {
  //   return false;
  // }

  // Get the file extension
  String fileExtension = path.extension(filePath);

  // log("File Extension : $fileExtension");

  // Check if the file extension is in the list of allowed extensions
  return fileExtension.replaceAll(".", "").toLowerCase();
}

Color hexToColor(String hexColor) {
  hexColor = hexColor.replaceAll("#", "");
  if (hexColor.length == 6) {
    hexColor = "FF$hexColor";
  }
  return Color(int.parse(hexColor, radix: 16));
}
