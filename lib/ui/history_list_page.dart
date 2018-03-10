import 'package:flutter/material.dart';
import 'package:quicka/repository/history_repository.dart';
import 'package:quicka/model/history.dart';
import 'dart:async';

class HistoryListPage extends StatefulWidget {
  @override
  State createState() => new _HistoryListPageState();
}

class _HistoryListPageState extends State<HistoryListPage> {
  final HistoryRepository _historyRepository = new HistoryRepository();
  List<History> _histories = <History>[];

  @override
  void initState() {
    super.initState();

    _historyRepository.findAll().then((histories) => _setHistories(histories));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('History'),
        actions: _buildActions(),
      ),
      body: _histories.isEmpty ? _buildEmptyView() : _buildListView(),
    );
  }

  List<Widget> _buildActions() {
    if (_histories.isEmpty) return [];

    return <Widget>[
      new IconButton(
        icon: new Icon(Icons.delete),
        onPressed: _handleDelete,
      ),
    ];
  }

  Widget _buildEmptyView() {
    return new Center(
      child: new Text(
        'There is no item.',
        style: Theme.of(context).textTheme.display1,
      ),
    );
  }

  Widget _buildListView() {
    return new ListView.builder(
      itemBuilder: (context, i) {
        if (i.isOdd) return new Divider(height: 1.0);

        final index = i ~/ 2;
        final history = _histories[index];
        return new ListTile(
          title: new Text(history.name),
          leading: new Icon(
            Icons.history,
            color: Theme.of(context).accentColor,
          ),
          onTap: () {
            Navigator.of(context).pop(history);
          },
        );
      },
      itemCount: _histories.length * 2,
    );
  }

  void _setHistories(List<History> histories) {
    setState(() => _histories = histories);
  }

  Future<Null> _handleDelete() async {
    return showDialog<Null>(
      context: context,
      child: new AlertDialog(
        title: new Text('Remove all items'),
        content: new SingleChildScrollView(
          child: new ListBody(
            children: <Widget>[
              new Text(
                'Are you sure you want to delete all items from your history?',
              ),
            ],
          ),
        ),
        actions: <Widget>[
          new FlatButton(
            child: new Text('CANCEL'),
            onPressed: () => Navigator.of(context).pop(),
          ),
          new FlatButton(
            child: new Text('DELETE'),
            onPressed: () {
              Navigator.of(context).pop();
              _historyRepository.clear().then((histories) {
                _setHistories(histories);
              });
            },
          ),
        ],
      ),
    );
  }
}
