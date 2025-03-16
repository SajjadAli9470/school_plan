import 'dart:developer';

import 'package:flutter_libphonenumber/flutter_libphonenumber.dart';

String formatToInternational(String phoneNumber) {
  try {
    // Remove any non-digit characters from the phone number
    String sanitizedNumber = phoneNumber.replaceAll(RegExp(r'\D'), '');
    final countryData = CountryManager().countries;
    // Identify the country based on the phone code
    CountryWithPhoneCode? matchedCountry = countryData.firstWhere(
      (country) => sanitizedNumber.startsWith(country.phoneCode.toString()),
      orElse: () =>
          throw Exception('Country not found for number: $phoneNumber'),
    );

    // Extract the local number by removing the phone code
    String localNumber = sanitizedNumber;
    // .substring(matchedCountry.phoneCode.toString().length);

    // Choose the appropriate mask
    String mask = matchedCountry.phoneMaskMobileInternational;

    // Replace '0' in the mask with actual digits from the local number
    String formattedNumber = '';
    int localIndex = 0;
    for (int i = 0; i < mask.length; i++) {
      if (mask[i] == '0' && localIndex < localNumber.length) {
        formattedNumber += localNumber[localIndex];
        localIndex++;
      } else {
        formattedNumber += mask[i];
      }
    }
    log("Mask : $mask");
    log("Number : $phoneNumber");
    log("Formattesd : $formattedNumber");
    return formattedNumber;
  } catch (e) {
    return phoneNumber;
  }
}

CountryWithPhoneCode? givePhoneDetails(String phoneNumber) {
  try {
    log("Getted PhoneNumber : ${phoneNumber}");

    // Remove any non-digit characters from the phone number
    String sanitizedNumber = phoneNumber.replaceAll(RegExp(r'\D'), '');
    log("Getted sanitize : ${sanitizedNumber}");
    final countryData = CountryManager().countries;
    // Identify the country based on the phone code
    CountryWithPhoneCode? matchedCountry = countryData.firstWhere(
      (country) => sanitizedNumber.startsWith(country.phoneCode.toString()),
      orElse: () =>
          throw Exception('Country not found for number: $phoneNumber'),
    );

    // Extract the local number by removing the phone code
    String localNumber = sanitizedNumber;
    // .substring(matchedCountry.phoneCode.toString().length);

    // Choose the appropriate mask
    String mask = matchedCountry.phoneMaskMobileInternational;

    // Replace '0' in the mask with actual digits from the local number
    // String formattedNumber = '';
    // int localIndex = 0;
    // for (int i = 0; i < mask.length; i++) {
    //   if (mask[i] == '0' && localIndex < localNumber.length) {
    //     formattedNumber += localNumber[localIndex];
    //     localIndex++;
    //   } else {
    //     formattedNumber += mask[i];
    //   }
    // }
    log("Mask : $mask");
    log("Number : $phoneNumber");
    // log("Formattesd : $formattedNumber");

    return matchedCountry;
  } catch (e) {
    return null;
  }
}
