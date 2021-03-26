import 'package:flutter/material.dart';
import 'package:flutter_developer/src/controller/global_functions.dart';
import 'package:flutter_developer/src/model/post.dart';
import 'package:flutter_developer/src/utils/globals.dart';

final formKeyAddPost = GlobalKey<FormState>();
final scaffoldKeyAddPost = GlobalKey<ScaffoldState>();
final TextEditingController addPostController = TextEditingController();

final FocusNode addPostControllerFocus = FocusNode();

saveDataPost({idPost, codigo, respostas, dataHora, estaLido, autorID, autorNome,
  autorImageUrl, texto, versao}) async {

  if (formKeyAddPost.currentState.validate()) {
    //Converter o formato da data
    int timestamp = DateTime.now().millisecondsSinceEpoch;

    //Salvar dados no sqlite
    var dataSave = await dbBase.savePostDB(
      Post(
        idPost: 'df34adc1-a3b5-45d7-b552-4e399fc6b1c4',
        codigo: 'PS004',
        respostas: 0,
        dataHora: timestamp,
        estaLido: 'true',
        autorID: '817ddb6b-c385-42e8-9d49-50132e7a2bf3',
        autorNome: 'Bianca Costa',
        autorImageUrl: 'https://randomuser.me/api/portraits/women/3.jpg',
        texto: addPostController.text,
        versao: 1,
      ),
    );

    if (dataSave > 0) {
      onMSG(scaffoldKeyAddPost, 'Seu post foi salvo com sucesso!');

      addPostController.text = '';
    }
  } else {
    onMSG(scaffoldKeyAddPost, 'Campo obrigatório!');
  }
}
