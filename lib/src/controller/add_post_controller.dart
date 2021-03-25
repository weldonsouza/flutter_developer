import 'package:flutter/material.dart';
import 'package:flutter_developer/src/model/post.dart';
import 'package:flutter_developer/src/utils/globals.dart';

final formKeyAddPost = GlobalKey<FormState>();
final scaffoldKeyAddPost = GlobalKey<ScaffoldState>();
final TextEditingController addPostController = TextEditingController();

final FocusNode addPostControllerFocus = FocusNode();

saveDataPost() async {
  if (formKeyAddPost.currentState.validate()) {
    //Converter o formato da data
    /*if (dateSelected != null) {
      dateFormatTask = '${DateFormat('dd/MM/yyyy').format(dateSelected)}';
    } else {
      dateFormatTask = '$dataIni';
    }*/

    //Salvar dados no sqlite
/*    var dataSave = await dbBase.savePostDB(
      Post(
        idPost: _dataGet['Result'][i]['ID'],
        codigo: _dataGet['Result'][i]['Codigo'],
        respostas: _dataGet['Result'][i]['Respostas'].toString(),
        dataHora: '${_dataGet['Result'][i]['DataHora']}',
        estaLido: _dataGet['Result'][i]['EstaLido'].toString(),
        autorID: _dataGet['Result'][i]['AutorID'],
        autorNome: _dataGet['Result'][i]['AutorNome'],
        autorImageUrl: _dataGet['Result'][i]['AutorImageUrl'],
        texto: _dataGet['Result'][i]['Texto'],
        versao: _dataGet['Result'][i]['Versao'].toString(),
      ),
    );

    if (dataSave > 0) {
      onMSG(
        scaffoldKeyAddTask,
        '${titleControllerAddTask.text} tarefa salva com sucesso!',
      );

      titleControllerAddTask.text = '';
      descriptionControllerAddTask.text = '';
    }
  } else {
    onMSG(scaffoldKeyAddTask, 'Campos obrigatórios!');
    */
  }
}