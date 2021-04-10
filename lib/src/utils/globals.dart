library my_prj.globals;

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_developer/src/data/db_helper_post.dart';
import 'package:intl/intl.dart';

//******************  CONSTANTES GLOBAIS  **********************
const String baseUrl = 'https://run.mocky.io/v3/29ca1a88-ec02-44aa-9d26-214983b174a9';

enum typeRequest {
  GET,
  POST,
  PUT,
  DELETE,
}

enum connectivityStatus {
  WIFI,
  PHONE,
  OFFLINE
}

//******************  VARIÁVEIS GLOBAIS  ********************
var dbBase = DBHelperBase();

final streamJsonController = StreamController.broadcast();

var colorLight = Colors.blueGrey[50];
var colorDark = Colors.blueGrey;
var colorBase = Color(0xFF2cd172);

int timeInMillis = 1616502241000;
var date = DateTime.fromMillisecondsSinceEpoch(timeInMillis);
var formattedDate = DateFormat.yMMMd().format(date); // Apr 8, 2020

DateTime date2 = DateTime.fromMillisecondsSinceEpoch(1486252500000);
var format = DateFormat("yMd");
var dateString = format.format(date2);