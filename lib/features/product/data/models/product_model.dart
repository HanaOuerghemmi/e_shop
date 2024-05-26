import 'package:e_shop/features/product/domain/entities/product.dart';

enum ProductCategory {
  discount,
  ventFlash,
  newProduction,
  none,
}

class ProductModel extends Product {
  final DateTime createdAt;

  ProductModel({
    required int id,
    required String title,
    required String description,
    required String category,
    required double price,
    required Map<String, String> meta,
    required this.createdAt,
    required int stock,
    required String brand,
    required List<String> images,
  }) : super(
          id: id,
          title: title,
          description: description,
          brand: brand,
          category: category,
          price: price,
          meta: meta,
          images: images,
          stock: stock,
        );

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      category: json['category'],
      price: (json['price'] as num).toDouble(),
      meta: Map<String, String>.from(json['meta']),
      createdAt: DateTime.parse(json['meta']['createdAt']),
      stock: json['stock'],
      brand: json['brand'] ?? '',
      images: List<String>.from(json['images']) ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'category': category,
      'price': price,
      'stock': stock,
      'brand': brand,
      'meta': {
        'createdAt': createdAt.toIso8601String(),
      },
      'images': List<dynamic>.from(images.map((x) => x)),
    };
  }

  ProductCategory get getCategory {
    final now = DateTime.now();
    if (price < 10) {
      return ProductCategory.ventFlash;
    } else if (price < 50) {
      return ProductCategory.discount;
    } else if (now.difference(createdAt).inDays <= 3) {
      return ProductCategory.newProduction;
    } else {
      return ProductCategory.none;
    }
  }
}
