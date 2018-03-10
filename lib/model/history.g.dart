// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

History _$HistoryFromJson(Map<String, dynamic> json) =>
    new History(json['name'] as String)
      ..id = json['id'] as int
      ..createdAt = json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String);

abstract class _$HistorySerializerMixin {
  int get id;
  String get name;
  DateTime get createdAt;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'createdAt': createdAt?.toIso8601String()
      };
}
