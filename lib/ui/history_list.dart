import 'package:flutter/material.dart';
import 'package:quicka/repository/history_repository.dart';
import 'package:quicka/model/history.dart';

class HistoryList extends StatefulWidget {
  @override
  State createState() => new _HistoryListState();
}

class _HistoryListState extends State<HistoryList> {
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
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.delete), onPressed: _handleDelete),
        ],
      ),
      body: new Container(
        color: Colors.white,
        child: _buildListView(),
      ),
    );
  }

  Widget _buildListView() {
    return new ListView.builder(
      padding: new EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) return new Divider();
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
            });
      },
      itemCount: _histories.length * 2,
    );
  }

  void _setHistories(List<History> histories) {
    setState(() => _histories = histories);
  }

  void _handleDelete() {}
}
