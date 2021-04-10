import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_developer/src/services/connectivity_service.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'src/view/home/home_page.dart';
import 'src/utils/globals.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      StreamProvider<connectivityStatus>(
        create: (context) =>
        ConnectivityService().connectionStatusController.stream,
        catchError: (BuildContext context, e) {
          return null;
        },
        updateShouldNotify: (_, __) => true,
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Set portrait orientation
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    //Ocultar toolbar
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);

    return MaterialApp(
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: [
        const Locale('pt', 'BR') // Portuguese
      ],
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
