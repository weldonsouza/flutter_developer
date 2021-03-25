import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_developer/src/utils/globals.dart';
import 'package:http/http.dart' as http;

///------------------------------ Funções gerais -------------------------------
//Função generica para calcular o tamanho da tela
mediaQuery(BuildContext context, double value, {String direction}) {
  MediaQueryData mediaQuery = MediaQuery.of(context);
  direction = direction ?? 'H';
  Size size = mediaQuery.size;
  if (direction.toUpperCase() == 'H') {
    return size.width * value;
  } else {
    return size.height * value;
  }
}

//SnackBar
onMSG(scaffoldKey, msg, {behavior = SnackBarBehavior.fixed}) {
  scaffoldKey.currentState.showSnackBar(
    SnackBar(
      //behavior: SnackBarBehavior.floating,
      behavior: behavior,
      content: Text(msg),
      duration: Duration(seconds: 3),
    ),
  );
}

String validatePost(value) {
  if (value.isEmpty) {
    return null;
  } else if(value.length < 5){
    return 'Seu post deve ter mais de 5 caracteres.';
  }

  return null;
}
///------------------------ Função de requisições globais ----------------------
//Função gernerica de requisições
makeRequest(url, type, {context, body, headers}) async {
  var response;

  try {
    switch (type) {
      case typeRequest.GET:
        response = await http.get('$url').timeout(Duration(seconds: 5));
        break;
      case typeRequest.POST:
        response = await http.post('$url', body: body).timeout(Duration(seconds: 5));
        break;
      case typeRequest.PUT:
        response = await http.put('$url').timeout(Duration(seconds: 5));
        break;
      case typeRequest.DELETE:
        response = await http.put('$url').timeout(Duration(seconds: 5));
        break;
    }

    return response.body;
  } on TimeoutException catch (e) {
    return null;
  } on Error catch (e) {
    return null;
  } on SocketException catch (_) {
    return null;
  }
}
