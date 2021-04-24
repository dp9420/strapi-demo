import 'dart:convert';

List<DummyModel> dummyModelFromJson(String str) =>
    List<DummyModel>.from(json.decode(str).map((x) => DummyModel.fromJson(x)));

String dummyModelToJson(List<DummyModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DummyModel {
  DummyModel({
    this.id,
    this.name,
    this.description,
    this.publishedAt,
    this.createdAt,
    this.updatedAt,
    this.image,
    this.categories,
  });

  int id;
  String name;
  String description;
  DateTime publishedAt;
  DateTime createdAt;
  DateTime updatedAt;
  List<ImageModel> image;
  List<DummyModel> categories;

  factory DummyModel.fromJson(Map<String, dynamic> json) => DummyModel(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        description: json["description"] == null ? null : json["description"],
        publishedAt: json["published_at"] == null
            ? null
            : DateTime.parse(json["published_at"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        image: json["image"] == null
            ? null
            : List<ImageModel>.from(
                json["image"].map((x) => ImageModel.fromJson(x))),
        categories: json["categories"] == null
            ? null
            : List<DummyModel>.from(
                json["categories"].map((x) => DummyModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "description": description == null ? null : description,
        "published_at":
            publishedAt == null ? null : publishedAt.toIso8601String(),
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "image": image == null
            ? null
            : List<dynamic>.from(image.map((x) => x.toJson())),
        "categories": categories == null
            ? null
            : List<dynamic>.from(categories.map((x) => x.toJson())),
      };
}

class ImageModel {
  ImageModel({
    this.id,
    this.name,
    this.alternativeText,
    this.caption,
    this.width,
    this.height,
    this.formats,
    this.hash,
    this.ext,
    this.mime,
    this.size,
    this.url,
    this.previewUrl,
    this.provider,
    this.providerMetadata,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  String alternativeText;
  String caption;
  int width;
  int height;
  Formats formats;
  String hash;
  String ext;
  String mime;
  double size;
  String url;
  dynamic previewUrl;
  String provider;
  dynamic providerMetadata;
  DateTime createdAt;
  DateTime updatedAt;

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        alternativeText:
            json["alternativeText"] == null ? null : json["alternativeText"],
        caption: json["caption"] == null ? null : json["caption"],
        width: json["width"] == null ? null : json["width"],
        height: json["height"] == null ? null : json["height"],
        formats:
            json["formats"] == null ? null : Formats.fromJson(json["formats"]),
        hash: json["hash"] == null ? null : json["hash"],
        ext: json["ext"] == null ? null : json["ext"],
        mime: json["mime"] == null ? null : json["mime"],
        size: json["size"] == null ? null : json["size"].toDouble(),
        url: json["url"] == null ? null : json["url"],
        previewUrl: json["previewUrl"],
        provider: json["provider"] == null ? null : json["provider"],
        providerMetadata: json["provider_metadata"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "alternativeText": alternativeText == null ? null : alternativeText,
        "caption": caption == null ? null : caption,
        "width": width == null ? null : width,
        "height": height == null ? null : height,
        "formats": formats == null ? null : formats.toJson(),
        "hash": hash == null ? null : hash,
        "ext": ext == null ? null : ext,
        "mime": mime == null ? null : mime,
        "size": size == null ? null : size,
        "url": url == null ? null : url,
        "previewUrl": previewUrl,
        "provider": provider == null ? null : provider,
        "provider_metadata": providerMetadata,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
      };
}

class Formats {
  Formats({
    this.thumbnail,
  });

  Thumbnail thumbnail;

  factory Formats.fromJson(Map<String, dynamic> json) => Formats(
        thumbnail: json["thumbnail"] == null
            ? null
            : Thumbnail.fromJson(json["thumbnail"]),
      );

  Map<String, dynamic> toJson() => {
        "thumbnail": thumbnail == null ? null : thumbnail.toJson(),
      };
}

class Thumbnail {
  Thumbnail({
    this.name,
    this.hash,
    this.ext,
    this.mime,
    this.width,
    this.height,
    this.size,
    this.path,
    this.url,
  });

  String name;
  String hash;
  String ext;
  String mime;
  int width;
  int height;
  double size;
  dynamic path;
  String url;

  factory Thumbnail.fromJson(Map<String, dynamic> json) => Thumbnail(
        name: json["name"] == null ? null : json["name"],
        hash: json["hash"] == null ? null : json["hash"],
        ext: json["ext"] == null ? null : json["ext"],
        mime: json["mime"] == null ? null : json["mime"],
        width: json["width"] == null ? null : json["width"],
        height: json["height"] == null ? null : json["height"],
        size: json["size"] == null ? null : json["size"].toDouble(),
        path: json["path"],
        url: json["url"] == null ? null : json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "hash": hash == null ? null : hash,
        "ext": ext == null ? null : ext,
        "mime": mime == null ? null : mime,
        "width": width == null ? null : width,
        "height": height == null ? null : height,
        "size": size == null ? null : size,
        "path": path,
        "url": url == null ? null : url,
      };
}
