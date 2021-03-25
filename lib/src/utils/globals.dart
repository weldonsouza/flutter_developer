library my_prj.globals;

import 'dart:async';
import 'package:flutter_developer/src/data/db_helper_post.dart';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';

//******************  CONSTANTES GLOBAIS  **********************
const String baseUrl = 'https://api.mocki.io/v1/7f811b6a/posts';

enum typeRequest {
  GET,
  POST,
  PUT,
  DELETE,
}

//******************  VARIÁVEIS GLOBAIS  ********************
var dbBase = DBHelperBase();

final streamJsonController = StreamController.broadcast();

var colorLight = Colors.blueGrey[50];
var colorDark = Colors.blueGrey;
var colorBase = Color(0xFF2cd172);

bool timeoutException = false;

DateTime dateSelected;
DateTime dateSelectedEdit;
String dataIni = DateFormat('dd/MM/yyyy').format(DateTime.now());
var dateFormat = dateSelected != null
    ? '${DateFormat('dd/MM/yyyy').format(dateSelected)}'
    : '$dataIni';
var dateNow;


int timeInMillis = 1616502241000;
var date = DateTime.fromMillisecondsSinceEpoch(timeInMillis);
var formattedDate = DateFormat.yMMMd().format(date); // Apr 8, 2020


DateTime date2 = DateTime.fromMillisecondsSinceEpoch(1486252500000);
var format = DateFormat("yMd");
var dateString = format.format(date2);