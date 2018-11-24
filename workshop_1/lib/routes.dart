import 'package:flutter/material.dart';
import 'configs/app_config.dart';
import 'package:work_shop_1/screens/inbox/inbox_page.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;
class InboxApp extends StatelessWidget {
  InboxApp(this.config);
  final AppConfig config;

  @override
  Widget build(BuildContext context) {
    if(Platform.isIOS) {
      return CupertinoApp(
        home: InboxPage(title: 'Inbox'),
      );
    } else {
      return MaterialApp(
        title: config.appName,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: InboxPage(title: 'Inbox'),
      );
    }
  }
}