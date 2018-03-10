import 'package:flutter/material.dart';

class Launcher {
  int id;
  String name;
  String url;
  IconData icon;
  Color color;

  Launcher(String name, String url, IconData icon, Color color) {
    this.id = new DateTime.now().millisecondsSinceEpoch;
    this.name = name;
    this.url = url;
    this.icon = icon;
    this.color = color;
  }

  static List<Launcher> defaults() {
    return [
      new Launcher('Wikipedia', 'http://ja.m.wikipedia.org/wiki/[UTF8]',
          Icons.launch, Colors.grey.shade500),
      new Launcher('Twitter', 'https://mobile.twitter.com/search/?q=[UTF8]',
          Icons.launch, Colors.lightBlue.shade500),
      new Launcher('YouTube', 'http://m.youtube.com/results?q=[UTF8]',
          Icons.launch, Colors.red.shade500),
    ];
  }
}
