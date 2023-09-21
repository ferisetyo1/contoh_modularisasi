import 'dart:convert';

import 'metadata.dart';

class BaseResponse<T> {
  final T? record;
  final String? message;
  final Metadata? metadata;

  BaseResponse({
    this.record,
    this.message,
    this.metadata,
  });

  BaseResponse copyWith({
    T? record,
    String? message,
    Metadata? metadata,
  }) =>
      BaseResponse(
        record: record ?? this.record,
        message: message ?? this.message,
        metadata: metadata ?? this.metadata,
      );

  factory BaseResponse.fromRawJson(
          String str, T? Function(dynamic json) fromJson) =>
      BaseResponse.fromJson(json.decode(str), fromJson);

  String toRawJson(Map<String, dynamic> Function(T? data) toJson) =>
      json.encode(this.toJson(toJson));

  factory BaseResponse.fromJson(
          Map<String, dynamic> json, T? Function(dynamic json) fromJson) =>
      BaseResponse(
        record: json["record"] == null ? null : fromJson.call(json["record"]),
        metadata: json["metadata"] == null
            ? null
            : Metadata.fromJson(json["metadata"]),
      );

  Map<String, dynamic> toJson(Map<String, dynamic> Function(T? data) toJson) =>
      {
        "record": toJson.call(record),
        "metadata": metadata?.toJson(),
      };
}
