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
  final List<String> categories;
  final double averageRating;
  final int ratingsCount;
  final bool allowAnonLogging;
  final String contentVersion;
  final ImageLinks? imageLinks; // ملاحظة: جعلت الصورة اختيارية (nullable)
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
    required this.categories,
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
    title: json["title"] ?? 'No Title Available',
    subtitle: json["subtitle"] ?? 'No Subtitle',
    authors: json["authors"] != null
        ? List<String>.from(json["authors"].map((x) => x.toString()))
        : ['Unknown Author'],
    publisher: json["publisher"] ?? 'Unknown Publisher',
    publishedDate: json["publishedDate"] ?? 'Unknown Date',
    description: json["description"] ?? 'No Description Available',
    pageCount: json["pageCount"] ?? 0,
    categories: json["categories"] != null
        ? List<String>.from(json["categories"].map((x) => x.toString()))
        : ['No Categories'],
    averageRating: (json["averageRating"] ?? 0.0).toDouble(),
    ratingsCount: (json["ratingsCount"] ?? 0).toInt(),
    allowAnonLogging: json["allowAnonLogging"] ?? false,
    contentVersion: json["contentVersion"] ?? 'Unknown Version',
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
    "categories": List<dynamic>.from(categories.map((x) => x)),
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


enum Category {
  BUSINESS_ECONOMICS,
  COMPUTERS,
  PSYCHOLOGY
}

final categoryValues = EnumValues({
  "Business & Economics": Category.BUSINESS_ECONOMICS,
  "Computers": Category.COMPUTERS,
  "Psychology": Category.PSYCHOLOGY
});


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

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}