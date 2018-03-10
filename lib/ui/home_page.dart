import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:quicka/repository/history_repository.dart';
import 'package:quicka/model/history.dart';
import 'package:quicka/model/launcher.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _textController = new TextEditingController();
  final HistoryRepository _historyRepository = new HistoryRepository();
  final List<Launcher> _launchers = Launcher.defaults();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Quicka'),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.settings),
            onPressed: _pushSettings,
          ),
        ],
      ),
      body: new Container(
        color: Colors.white,
        child: new Column(
          children: <Widget>[
            new Flexible(
              child: _buildListView(),
            ),
            new Divider(
              height: 1.0,
            ),
            new Container(
              decoration: new BoxDecoration(color: Theme.of(context).cardColor),
              child: _buildTextComponent(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListView() {
    return new ListView.builder(
      itemBuilder: (context, i) {
        if (i.isOdd) return new Divider(height: 1.0);

        final index = i ~/ 2;
        final launcher = _launchers[index];
        return new ListTile(
          title: new Text(launcher.name),
          subtitle: new Text(launcher.url),
          leading: new Icon(launcher.icon, color: launcher.color),
          onTap: () => _launch(url: launcher.url),
        );
      },
      itemCount: _launchers.length * 2,
    );
  }

  Widget _buildTextComponent() {
    return new IconTheme(
      data: new IconThemeData(color: Theme.of(context).accentColor),
      child: new Container(
        margin: const EdgeInsets.only(left: 16.0),
        child: new Row(
          children: <Widget>[
            new Flexible(
              child: new TextField(
                controller: _textController,
                onSubmitted: (text) => _launch(),
                decoration: new InputDecoration.collapsed(hintText: 'Search'),
                style: Theme.of(context).textTheme.title,
              ),
            ),
            new Container(
              margin: new EdgeInsets.only(left: 16.0),
              child: new IconButton(
                icon: new Icon(Icons.history),
                padding: new EdgeInsets.all(16.0),
                onPressed: _pushHistory,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _launch({String url = 'http://www.google.com/search?q=[UTF8]'}) async {
    String text = _textController.text;
    _textController.clear();

    if (text.length > 0) {
      await _historyRepository
          .add(new History(text))
          .then((history) => debugPrint(history.toString()));

      url = url.replaceAll(
          '[UTF8]', Uri.encodeQueryComponent(text, encoding: UTF8));
      if (await canLaunch(url)) {
        launch(url);
      } else {
        debugPrint('Could not launch $url');
      }
    }
  }

  void _pushHistory() async {
    History history = await Navigator.of(context).pushNamed('/history');
    if (history != null) _textController.text = history.name;
  }

  void _pushSettings() {
    Navigator.of(context).pushNamed('/settings');
  }
}
