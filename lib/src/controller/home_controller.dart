import 'dart:convert';

import 'package:flutter_developer/src/controller/global_functions.dart';
import 'package:flutter_developer/src/model/post.dart';
import 'package:flutter_developer/src/utils/globals.dart';

List<dynamic> getBase = [];
dynamic _dataGet = [];
var dataSave;

//Consumimdo API externa
Future<dynamic> getJson() async {
  var response = await makeRequest(baseUrl, typeRequest.GET);

  if(response != null){
    try {
      _dataGet = json.decode(response);

      for (int i = 0; i < _dataGet['Result'].length; i++) {
        //Salvar dados no sqlite
        await dbBase.savePostDB(
          Post(
            idPost: _dataGet['Result'][i]['ID'],
            codigo: _dataGet['Result'][i]['Codigo'],
            respostas: _dataGet['Result'][i]['Respostas'],
            dataHora: _dataGet['Result'][i]['DataHora'],
            estaLido: _dataGet['Result'][i]['EstaLido'].toString(),
            autorID: _dataGet['Result'][i]['AutorID'],
            autorNome: _dataGet['Result'][i]['AutorNome'],
            autorImageUrl: _dataGet['Result'][i]['AutorImageUrl'],
            texto: _dataGet['Result'][i]['Texto'],
            versao: _dataGet['Result'][i]['Versao'],
          ),
        );
      }

      return _dataGet;
    } catch (e) {
      return null;
    }
  } else {
    return null;
  }
}
