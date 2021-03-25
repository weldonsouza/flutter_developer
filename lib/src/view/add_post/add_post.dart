import 'package:flutter/material.dart';
import 'package:flutter_developer/src/components/custom_text_field.dart';
import 'package:flutter_developer/src/controller/add_post_controller.dart';
import 'package:flutter_developer/src/controller/global_functions.dart';
import 'package:flutter_developer/src/utils/globals.dart';

class AddPost extends StatefulWidget {
  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  @override
  void initState() {
    super.initState();
    addPostController.text = '';
    dateSelected = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKeyAddPost,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Novo Post',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.bold,
            fontSize: mediaQuery(context, 0.06),
          ),
        ),
      ),
      body: Form(
        key: formKeyAddPost,
        child: Stack(
          children: [
            Positioned(
              child: Align(
                alignment: FractionalOffset.bottomRight,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: _button('Salvar', Colors.green),
                ),
              ),
            ),
            CustomTextField(
              labelText: 'Post',
              marginTop: 16,
              marginBottom: 5,
              controller: addPostController,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              focusNode: addPostControllerFocus,
              validate: validatePost,
              maxLines: 10,
              colorBord: colorDark.withOpacity(0.4),
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
              saveDataPost();
            },
            child: Container(
              width: mediaQuery(context, 1),
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
