import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:quicka/repository/history_repository.dart';
import 'package:quicka/model/history.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _textController = new TextEditingController();
  final HistoryRepository _historyRepository = new HistoryRepository();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Quicka'),
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.settings), onPressed: _pushSettings),
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
      padding: new EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) return new Divider();
        return new ListTile(
          title: new Text('URL'),
          leading: new Icon(
            Icons.favorite,
            color: Theme.of(context).accentColor,
          ),
          onTap: () {
            // do something
          },
        );
      },
      itemCount: 10,
    );
  }

  Widget _buildTextComponent() {
    return new IconTheme(
      data: new IconThemeData(color: Theme.of(context).accentColor),
      child: new Container(
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
        child: new Row(
          children: <Widget>[
            new Flexible(
              child: new TextField(
                controller: _textController,
                onSubmitted: _handleSubmitted,
                decoration: new InputDecoration.collapsed(hintText: 'Search'),
                style: Theme.of(context).textTheme.title,
              ),
            ),
            new Container(
              margin: new EdgeInsets.only(left: 16.0),
              child: new IconButton(
                icon: new Icon(Icons.history),
                onPressed: _pushHistory,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleSubmitted(String text) {
    _textController.clear();
    if (text.length > 0) {
      _historyRepository
          .add(new History(text))
          .then((history) => debugPrint(history.toString()))
          .whenComplete(() => _launchURL(
              "http://www.google.com/search?q=${Uri.encodeComponent(text)}"));
    }
  }

  void _launchURL(urlString) async {
    if (await canLaunch(urlString)) {
      launch(urlString);
    } else {
      debugPrint('Could not launch $urlString');
    }
  }

  void _pushHistory() async {
    History history = await Navigator.of(context).pushNamed('/history');
    if (history != null) _textController.text = history.name;
  }

  void _pushSettings() {
    // do something
  }
}
