import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_shop_1/models/email.dart';

class EmailDetailPage extends StatelessWidget {
  EmailDetailPage({@required this.email});

  final Email email;

  @override
  Widget build(BuildContext context) {
    var page = Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              email.title,
              style: TextStyle(fontSize: 24.0),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                border: Border(
              bottom: BorderSide(color: Colors.grey, width: 0.5),
            )),
            height: 0.5,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 20.0),
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: NetworkImage(email.image),
                ),
                SizedBox(width: 10.0),
                Text(email.sender)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              email.content,
              style: TextStyle(fontSize: 16.0),
            ),
          )
        ],
      ),
    );

    return Platform.isIOS
        ? CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
        ),
        child: SafeArea(child: page))
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.redAccent,
            ),
            body: page,
          );
  }
}
