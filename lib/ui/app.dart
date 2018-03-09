import 'package:flutter/material.dart';
import 'package:quicka/ui/home_page.dart';
import 'package:quicka/ui/history_list.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: new HomePage(),
      routes: <String, WidgetBuilder>{
        '/history': (BuildContext context) => new HistoryList(),
      },
    );
  }
}
