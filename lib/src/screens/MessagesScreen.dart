import 'dart:convert';
import 'package:badges/badges.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class MessagesScreen extends StatelessWidget {
  Future<dynamic> _getChatsListData() async {
    final httpResponse = await http.Client().get('https://randomuser.me/api?results=10');
    final parsedJson = jsonDecode(httpResponse.body);
    return parsedJson;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getChatsListData(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        switch(snapshot.connectionState) {
          case ConnectionState.done: {
            final userList = snapshot.data['results'];

            return ListView.separated(
              separatorBuilder: (context, index) => Divider(
                color: Colors.grey,
              ),
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              itemCount: userList.length,
              itemBuilder: (BuildContext context, int index) {
                final row = userList[index];

                return Container(
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: CircleAvatar(
                          minRadius: 30,
                          backgroundImage: NetworkImage(row['picture']['thumbnail']),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(row['name']['first'],
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5,),
                              Text('${row['phone']}: ${row['picture']['medium']}',
                                softWrap: false,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey.shade600
                                ),
                              ),
                            ],
                          ),
                        )
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Text('12:23',
                              style: TextStyle(
                                color: Colors.greenAccent.shade400
                              ),
                            ),
                            SizedBox(height: 8,),
                            Badge(
                              elevation: 0,
                              padding: EdgeInsets.all(4),
                              badgeColor: Colors.greenAccent.shade400,
                              badgeContent: Text('50',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }
          default: {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        }
      },
    );
  }
}