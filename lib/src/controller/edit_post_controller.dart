import 'package:flutter/material.dart';
import 'package:flutter_developer/src/controller/global_functions.dart';
import 'package:flutter_developer/src/utils/globals.dart';

final formKeyPost = GlobalKey<FormState>();
final scaffoldKeyPost = GlobalKey<ScaffoldState>();
final TextEditingController editPostController = TextEditingController();
final FocusNode editPostControllerFocus = FocusNode();

//Atualizar Post
updateDataPost(context, id) async {
  if (formKeyPost.currentState.validate()) {
    //Converter o formato da data
    int timestamp = DateTime.now().millisecondsSinceEpoch;

    //Atualizar dados no sqlite
    var dataUpdate = await dbBase.updatePostDB(
      idUpdate: id,
      dataHoraUpdate: timestamp,
      textoUpdate: editPostController.text
    );

    if (dataUpdate > 0) {
      onMSG(
        scaffoldKeyPost,
        'Post alterado com sucesso!',
      );

      editPostController.text = '';

      Future.delayed(Duration(milliseconds: 1000), () {
        Navigator.of(context).pop();
      });
    }
  } else {
    onMSG(scaffoldKeyPost, 'Campos obrigatórios!');
  }
}


//Deletar Post
deletePost(context, id) async {
  if (formKeyPost.currentState.validate()) {
    //Exluir a post
    var dataDelete = await dbBase.deleteBaseDB(id: id);

    if (dataDelete == 1) {
      editPostController.text = '';

      onMSG(scaffoldKeyPost, 'Post excluido com sucesso!');

      Future.delayed(Duration(milliseconds: 1000), () {
        Navigator.of(context).pop();
      });
    }
  }
}
