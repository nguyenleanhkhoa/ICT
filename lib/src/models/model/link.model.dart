// To parse this JSON data, do
//
//     final linkModel = linkModelFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

LinkModel linkModelFromJson(String str) =>
    LinkModel.fromJson(json.decode(str) as Map<String, dynamic>);

String linkModelToJson(LinkModel data) => json.encode(data.toJson());

class LinkModel extends Equatable {
  const LinkModel({
    this.links,
  });

  final List<Link>? links;

  LinkModel copyWith({
    List<Link>? links,
  }) =>
      LinkModel(
        links: links ?? this.links,
      );

  factory LinkModel.fromJson(Map<String, dynamic> json) => LinkModel(
        links: List<Link>.from((json['links'] as List)
            .map((x) => Link.fromJson(x as Map<String, dynamic>))),
      );

  Map<String, dynamic> toJson() => {
        'links': List<dynamic>.from(links!.map((x) => x.toJson())),
      };

  @override
  List<Object?> get props => [links];
}

class Link extends Equatable {
  const Link({
    this.id,
    this.url,
    this.title,
    this.createdAt,
    this.violated,
    this.description,
    this.name,
  });

  Link copyWith({
    int? id,
    String? url,
    String? title,
    DateTime? createdAt,
    bool? violated,
    String? description,
    String? name,
  }) =>
      Link(
        id: id ?? this.id,
        url: url ?? this.url,
        title: title ?? this.title,
        createdAt: createdAt ?? this.createdAt,
        violated: violated ?? this.violated,
        description: description ?? this.description,
        name: name ?? this.name,
      );

  static Link fromJson(Map<String, dynamic> json) => Link(
        id: json['id'] as int,
        url: json['url'].toString(),
        title: json['title'].toString(),
        createdAt: DateTime.parse(json['created_at'].toString()),
        violated: json['violated'] as bool,
        description: json['description'].toString(),
        name: json['name'].toString(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'url': url,
        'title': title,
        'created_at': createdAt!.toIso8601String(),
        'violated': violated,
        'description': description,
        'name': name,
      };
  final int? id;
  final String? url;
  final String? title;
  final DateTime? createdAt;
  final bool? violated;
  final String? description;
  final String? name;

  @override
  List<Object?> get props =>
      [id, url, title, createdAt, violated, description, name];
}

// enum Name { CNG_TY_TNHH_THNG_MI_DCH_V_VIT_PHN }

// final nameValues = EnumValues({
//     'Công ty TNHH Thương mại dịch vụ Việt Phôn ': Name.CNG_TY_TNHH_THNG_MI_DCH_V_VIT_PHN
// });

// class EnumValues<T> {
//     Map<String, T> map;
//     Map<T, String> reverseMap;

//     EnumValues(this.map);

//     Map<T, String> get reverse {
//         if (reverseMap == null) {
//             reverseMap = map.map((k, v) => new MapEntry(v, k));
//         }
//         return reverseMap;
//     }
// }
