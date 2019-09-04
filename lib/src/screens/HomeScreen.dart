import 'package:flutter/material.dart';
import 'package:flutterwhatsapp/src/screens/CallScreen.dart';
import 'package:flutterwhatsapp/src/screens/StatesScreen.dart';

import 'MessagesScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<FloatingActionButton> fabs = [
    new FloatingActionButton(
      child: new Icon(Icons.message),
      onPressed: () {},
    ),
    new FloatingActionButton(
      child: new Icon(Icons.camera_enhance),
      onPressed: () {},
    ),
    new FloatingActionButton(
      child: new Icon(Icons.call),
      onPressed: () {},
    )
  ];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Mi whatsapp"),
          bottom: TabBar(
            onTap: (index){
              setState(() {
                this.index = index;
              });
            },
            tabs: <Widget>[
              Tab(
                text: "CHATS",
              ),
              Tab(
                text: "ESTADOS",
              ),
              Tab(
                text: "LLAMADAS",
              )
            ],
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {},
            )
          ],
        ),
        body: TabBarView(
          children: <Widget>[MessagesScreen(), StatesScreen(), CallsScreen()],
        ),
        floatingActionButton: fabs[this.index],
      ),
    );
  }
}
