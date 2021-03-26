import 'package:flutter/material.dart';
import 'package:flutter_developer/src/components/custom_text_field.dart';
import 'package:flutter_developer/src/controller/edit_post_controller.dart';
import 'package:flutter_developer/src/controller/global_functions.dart';
import 'package:flutter_developer/src/utils/globals.dart';

class PostEdit extends StatefulWidget {
  int id;
  String textPost;

  PostEdit({this.id, this.textPost, Key key})
      : super(key: key);

  @override
  _PostEditState createState() => _PostEditState();
}

class _PostEditState extends State<PostEdit> {
  @override
  void initState() {
    super.initState();
    editPostController.text = widget.textPost;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKeyPost,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Editar Post',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.bold,
            fontSize: mediaQuery(context, 0.06),
          ),
        ),
      ),
      body: Form(
        key: formKeyPost,
        child: Stack(
          children: [
           Positioned(
              child: Align(
                alignment: FractionalOffset.bottomRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 16),
                      child: _button('Editar', Colors.green),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 16),
                      child: _button('Excluir', Colors.red),
                    ),
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  CustomTextField(
                    marginTop: 16,
                    marginBottom: 5,
                    controller: editPostController,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    focusNode: editPostControllerFocus,
                    validate: validatePost,
                    maxLines: 10,
                    colorBord: colorDark.withOpacity(0.4),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _button(title, color) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 10,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        child: Material(
          color: color,
          child: InkWell(
            onTap: () {
              editPostControllerFocus.unfocus();

              if (title == 'Editar') {
                updateDataPost(context, widget.id);
              } else {
                deletePost(context, widget.id);
              }
            },
            child: Container(
              width: mediaQuery(context, 0.42),
              height: 45,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
              ),
              alignment: Alignment.center,
              child: Text(
                '$title',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: mediaQuery(context, 0.04),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
