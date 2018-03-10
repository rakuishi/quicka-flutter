import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Settings'),
      ),
      body: new Center(
        child: new Text(
          'Settings',
          style: Theme.of(context).textTheme.display1,
        ),
      ),
    );
  }
}
