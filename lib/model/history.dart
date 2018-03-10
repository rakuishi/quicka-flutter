import 'package:json_annotation/json_annotation.dart';

part 'history.g.dart';

@JsonSerializable()
class History extends Object with _$HistorySerializerMixin {
  int id;
  String name;
  DateTime createdAt;

  History(String name) {
    var now = new DateTime.now();
    this.id = now.millisecondsSinceEpoch;
    this.name = name;
    this.createdAt = now;
  }

  @override
  String toString() {
    return 'History { id: $id, name: $name, createdAt: $createdAt }';
  }

  factory History.fromJson(Map<String, dynamic> json) =>
      _$HistoryFromJson(json);
}
