import 'dart:convert';

class Metadata {
  final String? id;
  final bool? private;
  final DateTime? createdAt;

  Metadata({
    this.id,
    this.private,
    this.createdAt,
  });

  Metadata copyWith({
    String? id,
    bool? private,
    DateTime? createdAt,
  }) =>
      Metadata(
        id: id ?? this.id,
        private: private ?? this.private,
        createdAt: createdAt ?? this.createdAt,
      );

  factory Metadata.fromRawJson(String str) =>
      Metadata.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
        id: json["id"],
        private: json["private"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "private": private,
        "createdAt": createdAt?.toIso8601String(),
      };
}
