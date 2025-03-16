import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../constants/Globals.dart';
import '../api/Api.dart';

class RestServices {
  static RestServices? _instance;

  factory RestServices() => _instance ??= RestServices._();

  RestServices._();

}

String getApiFormatDate({required DateTime date}) {
  return "${date.year}-${date.month > 9 ? date.month : "0${date.month}"}-${date.day > 9 ? date.day : "0${date.day}"}";
}


