import 'package:json_annotation/json_annotation.dart';

part 'history.g.dart';

@JsonSerializable()
class History extends Object with _$HistorySerializerMixin {
  int id;
  String name;

  History(String name) {
    this.id = new DateTime.now().millisecondsSinceEpoch;
    this.name = name;
  }

  @override
  String toString() {
    return 'History { id: $id, name: $name }';
  }

  factory History.fromJson(Map<String, dynamic> json) =>
      _$HistoryFromJson(json);
}
