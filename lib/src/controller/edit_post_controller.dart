import 'package:flutter/material.dart';

final formKeyPost = GlobalKey<FormState>();
final scaffoldKeyPost = GlobalKey<ScaffoldState>();
final TextEditingController editPostController = TextEditingController();
final FocusNode editPostControllerFocus = FocusNode();

//Atualizar Post
/*
updateDataTask(context, idTask) async {
  if (titleControllerTask.text.isNotEmpty &&
      descriptionControllerTask.text.isNotEmpty) {
    //Converter o formato da data
    if (dateSelected != null) {
      dateFormatTask = '${DateFormat('dd/MM/yyyy').format(dateSelected)}';
    } else {
      dateFormatTask = '$dataIni';
    }

    //Atualizar dados no sqlite
    var dataUpdate = await dbBase.updateBaseDB(
      BaseModel(
        id: int.parse(idTask),
        title: titleControllerTask.text,
        description: descriptionControllerTask.text,
        date: dateFormatTask,
        maker: userMaker,
      ),
    );

    if (dataUpdate > 0) {
      onMSG(
        scaffoldKeyTask,
        '${descriptionControllerTask.text} alterado com sucesso!',
      );

      idTask = '';
      titleControllerTask.text = '';
      descriptionControllerTask.text = '';

      Future.delayed(Duration(milliseconds: 1000), () {
        Navigator.of(context).pop();
      });
    }
  } else {
    onMSG(scaffoldKeyTask, 'Campos obrigatórios!');
  }
}
*/

//Deletar Post
/*
deleteTask(context, idTask) async {
  if (titleControllerTask.text.isNotEmpty &&
      descriptionControllerTask.text.isNotEmpty) {
    //Exluir a tarefa
    var dataDelete = await dbBase.deleteBaseDB(idTask);

    if (dataDelete == 1) {
      titleControllerTask.text = '';
      descriptionControllerTask.text = '';

      onMSG(scaffoldKeyTask,
          '${descriptionControllerTask.text} excluido com sucesso!');

      Future.delayed(Duration(milliseconds: 1000), () {
        Navigator.of(context).pop();
      });
    }
  }
}
*/
