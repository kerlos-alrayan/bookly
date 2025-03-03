// To parse this JSON data, do
//
//     final bookModel = bookModelFromJson(jsonString);

import 'dart:convert';

BookModel bookModelFromJson(String str) => BookModel.fromJson(json.decode(str));

String bookModelToJson(BookModel data) => json.encode(data.toJson());

class BookModel {
  final String kind;
  final int totalItems;
  final List<Item>? items;
  final VolumeInfo volumeInfo;
  final SaleInfo? saleInfo;

  BookModel({
    required this.kind,
    required this.totalItems,
    this.items,
    required this.volumeInfo,
    this.saleInfo,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
    kind: json["kind"] ?? '',
    totalItems: json["totalItems"] ?? 0,
    items: json["items"] != null
        ? List<Item>.from(json["items"].map((x) => Item.fromJson(x)))
        : null,
    volumeInfo: VolumeInfo.fromJson(json["volumeInfo"] ?? {}),
    saleInfo: json["saleInfo"] != null
        ? SaleInfo.fromJson(json["saleInfo"])
        : null,
  );

  Map<String, dynamic> toJson() => {
    "kind": kind,
    "totalItems": totalItems,
    "items": items?.map((x) => x.toJson()).toList(),
    "volumeInfo": volumeInfo.toJson(),
    "saleInfo": saleInfo?.toJson(),
  };
}

class Item {
  final String id;
  final String etag;
  final String selfLink;
  final VolumeInfo volumeInfo;
  final SaleInfo? saleInfo;

  Item({
    required this.id,
    required this.etag,
    required this.selfLink,
    required this.volumeInfo,
    this.saleInfo,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json["id"] ?? '',
    etag: json["etag"] ?? '',
    selfLink: json["selfLink"] ?? '',
    volumeInfo: VolumeInfo.fromJson(json["volumeInfo"] ?? {}),
    saleInfo: json["saleInfo"] == null
        ? null
        : SaleInfo.fromJson(json["saleInfo"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "etag": etag,
    "selfLink": selfLink,
    "volumeInfo": volumeInfo.toJson(),
    "saleInfo": saleInfo?.toJson(),
  };
}

class VolumeInfo {
  final String title;
  final String subtitle;
  final List<String> authors;
  final String publisher;
  final String publishedDate;
  final String description;
  final int pageCount;
  final double averageRating;
  final int ratingsCount;
  final bool allowAnonLogging;
  final String contentVersion;
  final ImageLinks? imageLinks;
  final String previewLink;
  final String infoLink;
  final String canonicalVolumeLink;

  VolumeInfo({
    required this.title,
    required this.subtitle,
    required this.authors,
    required this.publisher,
    required this.publishedDate,
    required this.description,
    required this.pageCount,
    required this.averageRating,
    required this.ratingsCount,
    required this.allowAnonLogging,
    required this.contentVersion,
    this.imageLinks,
    required this.previewLink,
    required this.infoLink,
    required this.canonicalVolumeLink,
  });

  factory VolumeInfo.fromJson(Map<String, dynamic> json) => VolumeInfo(
    title: json["title"] ?? '',
    subtitle: json["subtitle"] ?? '',
    authors: json["authors"] != null
        ? List<String>.from(json["authors"].map((x) => x.toString()))
        : [],
    publisher: json["publisher"] ?? '',
    publishedDate: json["publishedDate"] ?? '',
    description: json["description"] ?? '',
    pageCount: json["pageCount"] ?? 0,
    averageRating: json["averageRating"] ?? 0,
    ratingsCount: json["ratingsCount"] ?? 0,
    allowAnonLogging: json["allowAnonLogging"] ?? false,
    contentVersion: json["contentVersion"] ?? '',
    imageLinks: json["imageLinks"] != null
        ? ImageLinks.fromJson(json["imageLinks"])
        : null,
    previewLink: json["previewLink"] ?? '',
    infoLink: json["infoLink"] ?? '',
    canonicalVolumeLink: json["canonicalVolumeLink"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "subtitle": subtitle,
    "authors": List<dynamic>.from(authors.map((x) => x)),
    "publisher": publisher,
    "publishedDate": publishedDate,
    "description": description,
    "pageCount": pageCount,
    "averageRating": averageRating,
    "ratingsCount": ratingsCount,
    "allowAnonLogging": allowAnonLogging,
    "contentVersion": contentVersion,
    "imageLinks": imageLinks?.toJson(),
    "previewLink": previewLink,
    "infoLink": infoLink,
    "canonicalVolumeLink": canonicalVolumeLink,
  };
}


class SaleInfo {
  final String saleability;
  final bool isEbook;
  final SaleInfoListPrice? listPrice;
  final SaleInfoListPrice? retailPrice;
  final String? buyLink;

  SaleInfo({
    required this.saleability,
    required this.isEbook,
    this.listPrice,
    this.retailPrice,
    this.buyLink,
  });

  factory SaleInfo.fromJson(Map<String, dynamic> json) => SaleInfo(
    saleability: json["saleability"] ?? '',
    isEbook: json["isEbook"] ?? false,
    listPrice: json["listPrice"] != null
        ? SaleInfoListPrice.fromJson(json["listPrice"])
        : null,
    retailPrice: json["retailPrice"] != null
        ? SaleInfoListPrice.fromJson(json["retailPrice"])
        : null,
    buyLink: json["buyLink"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    'saleability': saleability,
    "isEbook": isEbook,
    "listPrice": listPrice?.toJson(),
    "retailPrice": retailPrice?.toJson(),
    "buyLink": buyLink,
  };
}


class SaleInfoListPrice {
  final double amount;
  final String currencyCode;

  SaleInfoListPrice({
    required this.amount,
    required this.currencyCode,
  });

  factory SaleInfoListPrice.fromJson(Map<String, dynamic> json) =>
      SaleInfoListPrice(
        amount: (json["amount"] ?? 0.0).toDouble(),
        currencyCode: json["currencyCode"] ?? '',
      );

  Map<String, dynamic> toJson() => {
    "amount": amount,
    "currencyCode": currencyCode,
  };
}

class ImageLinks {
  final String smallThumbnail;
  final String thumbnail;

  ImageLinks({
    required this.smallThumbnail,
    required this.thumbnail,
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
