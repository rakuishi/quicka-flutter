// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

History _$HistoryFromJson(Map<String, dynamic> json) =>
    new History(json['name'] as String)
      ..createdAt = json['createdAt'] as int
      ..updatedAt = json['updatedAt'] as int;

abstract class _$HistorySerializerMixin {
  String get name;
  int get createdAt;
  int get updatedAt;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'createdAt': createdAt,
        'updatedAt': updatedAt
      };
}
