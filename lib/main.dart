import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:nurul_hanis_ibrahim_exercise_4/UserData.dart';
import 'dart:convert';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  State1 createState() => State1();
}

Future<List<UserData>> readJsonData() async {
  //read json file
  final jsonData =
      await rootBundle.rootBundle.loadString('jsonfile/userinfo.json');
  //decode json data as list
  final list = json.decode(jsonData) as List<dynamic>;

  //map json and initialize using DataModel
  return list.map((e) => UserData.fromJson(e)).toList();
}

class State1 extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
        ),
        body: FutureBuilder(
            future: readJsonData(),
            builder: (context, data) {
              if (data.hasError) {
                return Center(child: Text("${data.error}"));
              } else if (data.hasData) {
                var items = data.data as List<UserData>;
                return ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 5,
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        child: Container(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  padding: EdgeInsets.fromLTRB(0, 10, 10, 0),
                                  child: Icon(
                                    Icons.supervised_user_circle,
                                    size: 60,
                                    color: Colors.indigo,
                                  ),
                                ),
                                Expanded(
                                    child: (Container(
                                  alignment: Alignment.topLeft,
                                  width: 50,
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.only(left: 10, right: 8),
                                        child: Text(
                                          items[index].firstname.toString(),
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.only(left: 10, right: 8),
                                        child: Text(
                                          items[index].lastname.toString(),
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              left: 10, right: 10),
                                          child: Text(
                                            items[index].username.toString(),
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.indigo,
                                            ),
                                          )),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Text(
                                          items[index].status.toString(),
                                          style: TextStyle(
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Text(
                                          items[index].lastSeenTime.toString(),
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )))
                              ],
                            )),
                      );
                    });
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }
}
