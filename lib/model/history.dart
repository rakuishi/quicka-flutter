import 'package:json_annotation/json_annotation.dart';

part 'history.g.dart';

@JsonSerializable()
class History extends Object with _$HistorySerializerMixin {
  String name;
  int createdAt;
  int updatedAt;

  History(String name) {
    var unixTime = new DateTime.now().millisecondsSinceEpoch;
    this.name = name;
    this.createdAt = unixTime;
    this.updatedAt = unixTime;
  }

  factory History.fromJson(Map<String, dynamic> json) =>
      _$HistoryFromJson(json);
}
