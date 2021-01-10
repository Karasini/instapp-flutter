import 'package:flutter/material.dart';
import 'package:instapp/modules/users/domain/models/user.dart';
import 'package:instapp/modules/users/infrastructure/api/users_queries.dart';

class Graph extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Graph();
}

class _Graph extends State<Graph> {

  List<User> listUsers = List<User>();

  @override
  void initState() {
    super.initState();
    fillList();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Example"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add_circle_outline),
            onPressed: () => null,
            tooltip: "Insert new person",
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            child: Text(
              "Person",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30.0),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 50.0),
            child: ListView.builder(
              itemCount: listUsers.length,
              itemBuilder: (context, index) {
                return ListTile(
                  selected: listUsers == null ? false : true,
                  title: Text(
                    "${listUsers[index].getNick()}",
                  ),
                  onTap: () {},
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void fillList() async {
    UsersQueries queryMutation = UsersQueries();
  }
}
