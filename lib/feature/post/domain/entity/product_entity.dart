import 'dart:convert';

class ProductEntity {
  final int? id;
  final String? title;
  final int? price;
  final String? description;
  final List<String>? images;
  final CategoryEntity? category;

  ProductEntity({
    this.id,
    this.title,
    this.price,
    this.description,
    this.images,
    this.category,
  });

  factory ProductEntity.fromRawJson(String str) =>
      ProductEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductEntity.fromJson(Map<String, dynamic> json) => ProductEntity(
        id: json["id"],
        title: json["title"],
        price: json["price"],
        description: json["description"],
        images: json["images"] == null
            ? []
            : List<String>.from(json["images"]!.map((x) => x)),
        category: json["category"] == null
            ? null
            : CategoryEntity.fromJson(json["category"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "images":
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "category": category?.toJson(),
      };
}

class CategoryEntity {
  final int? id;
  final String? name;
  final String? image;

  CategoryEntity({
    this.id,
    this.name,
    this.image,
  });

  factory CategoryEntity.fromRawJson(String str) =>
      CategoryEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CategoryEntity.fromJson(Map<String, dynamic> json) => CategoryEntity(
        id: json["id"],
        name: json["name"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
      };
}
