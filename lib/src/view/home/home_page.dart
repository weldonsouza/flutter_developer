import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_developer/src/controller/global_functions.dart';
import 'package:flutter_developer/src/controller/home_controller.dart';
import 'package:flutter_developer/src/controller/network_test_connectivity.dart';
import 'package:flutter_developer/src/utils/globals.dart';
import 'package:flutter_developer/src/view/add_post/add_post.dart';
import 'package:flutter_developer/src/view/post_edit/post_edit.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    streamJsonController.add(null);
    getJson();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: Row(
              children: <Widget>[
                Container(
                  width: 3,
                  height: mediaQuery(context, 0.075),
                  color: Colors.white,
                  margin: EdgeInsets.only(
                    right: mediaQuery(context, 0.025),
                  ),
                ),
                Text(
                  'Blogging',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.bold,
                    fontSize: mediaQuery(context, 0.075),
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                CupertinoPageRoute(builder: (context) => AddPost()),
              );
            },
            child: Icon(
              Icons.edit_outlined,
            ),
          ),
          body: SafeArea(
            top: true,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  StreamBuilder(
                    stream: streamJsonController.stream,
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                          return Container();
                        case ConnectionState.active:
                          Widget widget;

                          if (snapshot.data != null) {
                            widget = Padding(
                              padding: EdgeInsets.only(top: 10, bottom: 70),
                              child: Column(
                                children: _listJson(snapshot.data),
                              ),
                            );
                          } else {
                            widget = Container();
                          }

                          return widget;
                        default:
                          return Center(
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  colorDark,
                                ),
                              ),
                            ),
                          );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),

        //Barra de informando se tem internet
        NetworkTestConnectivity(),
      ],
    );
  }

  _listJson(snapshot) {
    List<Widget> returnData = [];
    var date;
    var formattedDate;

    for (int i = 0; i < snapshot.length; i++) {

      date = DateTime.fromMillisecondsSinceEpoch(snapshot[i]['dataHora']);
      formattedDate = DateFormat.yMMMd().format(date);

      returnData.add(
        GestureDetector(
          onTap: () {
            if (snapshot[i]['autorID'] == '817ddb6b-c385-42e8-9d49-50132e7a2bf3'){
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => PostEdit(
                    id: snapshot[i]['id'],
                    textPost: snapshot[i]['texto'],
                  ),
                ),
              );
            } else {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(
                      '${snapshot[i]['autorNome']}',
                    ),
                    content: Text(
                      '${snapshot[i]['texto']}',
                      textAlign: TextAlign.justify,
                    ),
                    actions: <Widget>[
                      FlatButton(
                        child: Text(
                          'OK',
                          style: TextStyle(
                            color: Colors.blueGrey,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            }
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Card(
              elevation: 3,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: mediaQuery(context, 1),
                      child: RichText(
                        textAlign: TextAlign.justify,
                        maxLines: snapshot[i]['texto'].length > 280 ? 6 : 7,
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                          text: '${snapshot[i]['texto']}',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: mediaQuery(context, 0.045),
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Gilroy',
                          ),
                        ),
                      ),
                    ),
                    Divider(color: Colors.blueGrey[300]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                              child: CachedNetworkImage(
                                width: 50,
                                height: 50,
                                imageUrl: '${snapshot[i]['autorImageUrl']}',
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) => Center(
                                  child: Container(
                                    width: 25,
                                    height: 25,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.blueGrey,
                                      ),
                                    ),
                                  ),
                                ),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${snapshot[i]['autorNome']}',
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: mediaQuery(context, 0.04),
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Lato',
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    '$formattedDate',
                                    style: TextStyle(
                                      fontSize: mediaQuery(context, 0.032),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            snapshot[i]['autorID'] == '817ddb6b-c385-42e8-9d49-50132e7a2bf3' ?
                              ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(100)),
                              child: Material(
                                color: Colors.white.withOpacity(0.3),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                        builder: (context) => PostEdit(
                                          id: snapshot[i]['id'],
                                          textPost: snapshot[i]['texto'],
                                        ),
                                      ),
                                    );
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Icon(
                                      Icons.edit_sharp,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                            ) : Container(),
                            snapshot[i]['respostas'] == 0 ?
                              Container() : Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Icon(
                                    Icons.mode_comment,
                                    color: Colors.blueGrey,
                                  ),
                                  Text(
                                    '${snapshot[i]['respostas']}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: mediaQuery(context, 0.032),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.done_all,
                                color: snapshot[i]['estaLido'] == 'true'
                                    ? Colors.green
                                    : Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }

    return returnData;
  }
}
