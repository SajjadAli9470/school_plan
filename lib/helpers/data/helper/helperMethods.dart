import 'dart:developer';

import 'package:intl/intl.dart';

isEmptyOrNull(String? data) {
  // log("Data :${data}");
  return (data ?? '').isEmpty;
}

String calculateTimeDuration(DateTime startDate, DateTime endDate) {
  Duration difference = endDate.difference(startDate);
  int daysDifference = difference.inDays;

  if (daysDifference < 30) {
    return '$daysDifference days';
  } else if (daysDifference < 90) {
    int months = daysDifference ~/ 30;
    return '$months month${months > 1 ? 's' : ''}';
  } else if (daysDifference < 180) {
    return '3 months';
  } else if (daysDifference < 365) {
    return '6 months';
  } else {
    int years = daysDifference ~/ 365;
    return '$years year${years > 1 ? 's' : ''}';
  }
}

DateFormat formatterMMMMyyyyy = DateFormat('MMMM yyyy');

List<String> filterTrends = ['Last 6 months', 'Last 12 months'];

List<DateTime> generateMonthList(
    {required DateTime startDate, required DateTime endDate}) {
  List<DateTime> months = [];
  // log(startDate.isBefore(endDate).toString());
  if (startDate.isBefore(endDate)) {
    DateTime current = DateTime(startDate.year, startDate.month);

    while (current.isBefore(endDate) || current.isAtSameMomentAs(endDate)) {
      months.add(current);
      current = DateTime(current.year, current.month + 1);
    }
    months.sort(
      (a, b) => b.compareTo(a),
    );

    return months;
  } else {
    return [];
  }
}

// double calculatePercentageChange(double value1, double value2) {
//   // Calculate the percentage change

//   final greateValue = value2; // value1 > value2 ? value1 : value2;
//   final lessValue = value1; // value1 < value2 ? value1 : value2;

//   double percentageChange = ((greateValue - lessValue) * 100 / greateValue);
//   log("----------Percentages------------");
//   log(" Values 2 : ${greateValue.toString()}");
//   log(" Values 1 : ${lessValue.toString()}");
//   log("Percentage :  ${percentageChange.toString()}");

//   return 100 - percentageChange;
// }

double calculatePercentageChange(double value1, double value2) {
  // Calculate the percentage difference
  double percentageDifference =
      (value2 == 0 || value1 == 0) ? 100 : ((value2 - value1) / value2) * 100;
  // log("value 1 : $value1 Value 2:$value2");
  log(percentageDifference.toString());
  // Return the result
  return percentageDifference.isNaN ? 0.0 : percentageDifference;
}

// int getLastDateOfMonth(DateTime lastDateOfMonth) {
//   // Determine the last date of the month
//   // DateTime lastDateOfMonth = DateTime(year, month + 1, 0);

//   // Define month names list
//   List<String> monthNames = [
//     'January', 'February', 'March', 'April', 'May', 'June',
//     'July', 'August', 'September', 'October', 'November', 'December'
//   ];

//   // Extract day, month, and year from the DateTime object
//   int day = lastDateOfMonth.day;
//   int lastMonth = lastDateOfMonth.month;
//   int lastYear = lastDateOfMonth.year;

//   // Get the month name from the monthNames list
//   String monthName = monthNames[lastMonth - 1]; // Adjust for zero-based index

//   // Determine the suffix for the day (e.g., "st", "nd", "rd", or "th")
//   String suffix = 'th';
//   if (day == 1 || day == 21 || day == 31) {
//     suffix = 'st';
//   } else if (day == 2 || day == 22) {
//     suffix = 'nd';
//   } else if (day == 3 || day == 23) {
//     suffix = 'rd';
//   }

//   // Return the formatted date string
//   return day;
// }

String convertYearMonth(String inputDate) {
  // Split the input date string into year and month parts
  List<String> parts = inputDate.split('-');

  // Map month numbers to their respective names
  Map<String, String> monthMap = {
    '01': 'Jan',
    '02': 'Feb',
    '03': 'Mar',
    '04': 'Apr',
    '05': 'May',
    '06': 'Jun',
    '07': 'Jul',
    '08': 'Aug',
    '09': 'Sep',
    '10': 'Oct',
    '11': 'Nov',
    '12': 'Dec',
  };

  // Get the month name from the map
  String monthName = monthMap[parts[1]] ?? 'Unknown';

  // Extract the last two digits of the year
  String year = parts[0].substring(2);

  // Construct the formatted date string
  String formattedDate = '$monthName $year';

  return formattedDate;
}

DateTime getLastSixMonthsStartingDate(DateTime inputDate) {
  // Subtract 6 months from the input date
  DateTime lastSixMonthsDate = inputDate.subtract(const Duration(days: 30 * 6));

  // Get the starting date of the month for the calculated date
  return DateTime(lastSixMonthsDate.year, lastSixMonthsDate.month, 1);
}


void exceptionHandling(){
  try {
    
  } catch (e) {
    
  }
}
