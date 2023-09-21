import 'dart:convert';

class CartDetail {
  final int? id;
  final int? userId;
  final DateTime? date;
  final List<Cart>? products;

  CartDetail({
    this.id,
    this.userId,
    this.date,
    this.products,
  });

  CartDetail copyWith({
    int? id,
    int? userId,
    DateTime? date,
    List<Cart>? carts,
  }) =>
      CartDetail(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        date: date ?? this.date,
        products: carts ?? this.products,
      );

  factory CartDetail.fromRawJson(String str) =>
      CartDetail.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CartDetail.fromJson(Map<String, dynamic> json) => CartDetail(
        id: json["id"],
        userId: json["userId"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        products: json["products"] == null
            ? []
            : List<Cart>.from(json["products"]!.map((x) => Cart.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "date": date?.toIso8601String(),
        "products": products == null
            ? []
            : List<dynamic>.from(products!.map((x) => x.toJson())),
      };
}

class Cart {
  final int? productId;
  final int? quantity;
  final Produk? produk;

  Cart({
    this.productId,
    this.quantity,
    this.produk,
  });

  Cart copyWith({
    int? productId,
    int? quantity,
    Produk? produk,
  }) =>
      Cart(
        productId: productId ?? this.productId,
        quantity: quantity ?? this.quantity,
        produk: produk ?? this.produk,
      );

  factory Cart.fromRawJson(String str) => Cart.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        productId: json["productId"],
        quantity: json["quantity"],
        produk: json["produk"] == null ? null : Produk.fromJson(json["produk"]),
      );

  Map<String, dynamic> toJson() => {
        "productId": productId,
        "quantity": quantity,
        "produk": produk?.toJson(),
      };
}

class Produk {
  final int? id;
  final String? title;
  final double? price;
  final String? description;
  final String? category;
  final String? image;
  final Rating? rating;

  Produk({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });

  Produk copyWith({
    int? id,
    String? title,
    double? price,
    String? description,
    String? category,
    String? image,
    Rating? rating,
  }) =>
      Produk(
        id: id ?? this.id,
        title: title ?? this.title,
        price: price ?? this.price,
        description: description ?? this.description,
        category: category ?? this.category,
        image: image ?? this.image,
        rating: rating ?? this.rating,
      );

  factory Produk.fromRawJson(String str) => Produk.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Produk.fromJson(Map<String, dynamic> json) => Produk(
        id: json["id"],
        title: json["title"],
        price: json["price"]?.toDouble(),
        description: json["description"],
        category: json["category"],
        image: json["image"],
        rating: json["rating"] == null ? null : Rating.fromJson(json["rating"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "category": category,
        "image": image,
        "rating": rating?.toJson(),
      };
}

class Rating {
  final double? rate;
  final int? count;

  Rating({
    this.rate,
    this.count,
  });

  Rating copyWith({
    double? rate,
    int? count,
  }) =>
      Rating(
        rate: rate ?? this.rate,
        count: count ?? this.count,
      );

  factory Rating.fromRawJson(String str) => Rating.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        rate: json["rate"]?.toDouble(),
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "rate": rate,
        "count": count,
      };
}
