import 'package:quicka/model/history.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'dart:convert';

class HistoryRepository {
  String _key;

  HistoryRepository({bool debug = false}) {
    _key = debug ? 'histories_debug' : 'histories';
  }

  Future<List<History>> findAll() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String json = prefs.getString(_key);
    if (json == null || json.length == 0) return new Future(() => <History>[]);

    List<Map> jsonArray = JSON.decode(json);
    List<History> histories =
        jsonArray.map((json) => new History.fromJson(json)).toList();
    return new Future.value(histories);
  }

  Future<Null> save(List<History> histories) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_key, JSON.encode(histories));
    return new Future.value(null);
  }

  Future<Null> clear() async {
    return save(<History>[]);
  }

  Future<History> add(History history) async {
    await findAll().then((histories) {
      histories.add(history);
      save(histories);
    });

    return new Future.value(history);
  }
}
