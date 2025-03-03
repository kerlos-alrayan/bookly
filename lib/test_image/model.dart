// To parse this JSON data, do
//
//     final testBookModel = testBookModelFromJson(jsonString);

import 'dart:convert';

TestBookModel testBookModelFromJson(String str) =>
    TestBookModel.fromJson(json.decode(str));

String testBookModelToJson(TestBookModel data) => json.encode(data.toJson());

class TestBookModel {
  String kind;
  int totalItems;
  List<Item> items;

  TestBookModel({
    required this.kind,
    required this.totalItems,
    required this.items,
  });

  factory TestBookModel.fromJson(Map<String, dynamic> json) => TestBookModel(
    kind: json["kind"] ?? '',
    totalItems: json["totalItems"] ?? 0,
    items: json["items"] != null
        ? List<Item>.from(json["items"].map((x) => Item.fromJson(x)))
        : [],
  );

  Map<String, dynamic> toJson() => {
    "kind": kind,
    "totalItems": totalItems,
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
  };
}

class Item {
  String kind;
  String id;
  String etag;
  String selfLink;
  VolumeInfo? volumeInfo;

  Item({
    required this.kind,
    required this.id,
    required this.etag,
    required this.selfLink,
    this.volumeInfo,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    kind: json["kind"] ?? '',
    id: json["id"] ?? '',
    etag: json["etag"] ?? '',
    selfLink: json["selfLink"] ?? '',
    volumeInfo: json["volumeInfo"] != null
        ? VolumeInfo.fromJson(json["volumeInfo"])
        : null,
  );

  Map<String, dynamic> toJson() => {
    "kind": kind,
    "id": id,
    "etag": etag,
    "selfLink": selfLink,
    "volumeInfo": volumeInfo?.toJson(),
  };
}

class VolumeInfo {
  String title;
  String? subtitle;
  List<String> authors;
  ImageLinks imageLinks;

  VolumeInfo({
    required this.title,
    this.subtitle,
    required this.authors,
    required this.imageLinks,
  });

  factory VolumeInfo.fromJson(Map<String, dynamic> json) => VolumeInfo(
    title: json["title"] ?? '',
    subtitle: json["subtitle"],
    authors: json["authors"] != null
        ? List<String>.from(json["authors"].map((x) => x))
        : [],
    imageLinks: json["imageLinks"] != null
        ? ImageLinks.fromJson(json["imageLinks"])
        : ImageLinks(),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "subtitle": subtitle,
    "authors": List<dynamic>.from(authors.map((x) => x)),
    "imageLinks": imageLinks.toJson(),
  };
}

class ImageLinks {
  String smallThumbnail;
  String thumbnail;

  ImageLinks({
    this.smallThumbnail = '',
    this.thumbnail = '',
  });

  factory ImageLinks.fromJson(Map<String, dynamic> json) => ImageLinks(
    smallThumbnail: json["smallThumbnail"] ?? '',
    thumbnail: json["thumbnail"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "smallThumbnail": smallThumbnail,
    "thumbnail": thumbnail,
  };
}
