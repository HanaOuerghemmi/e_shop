

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

    // required double discountPercentage,
    // required double rating,
    // required int stock,
    // required String brand,
    // required List<String> images,
    // required String thumbnail,
  }) : super(
          id: id,
          title: title,
          description: description,
          category: category,
          price: price,
          meta: meta,
        
          // discountPercentage: discountPercentage,
          // rating: rating,
          // stock: stock,

          // brand: brand,

          // images: images,
          // thumbnail: thumbnail,
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

      // discountPercentage: (json['discountPercentage'] as num).toDouble(),
      // rating: (json['rating'] as num).toDouble(),
      // stock: json['stock'],
      // brand: json['brand'],
      // images: List<String>.from(json['images']),
      // thumbnail: json['thumbnail'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'category': category,
      'price': price,

      // 'discountPercentage': discountPercentage,
      // 'rating': rating,
      // 'stock': stock,
      // 'tags': List<dynamic>.from(tags.map((x) => x)),
      // 'brand': brand,
      // 'sku': sku,
      // 'weight': weight,
      // 'dimensions': Map<String, dynamic>.from(dimensions),
      // 'warrantyInformation': warrantyInformation,
      // 'shippingInformation': shippingInformation,
      // 'availabilityStatus': availabilityStatus,
      // 'reviews': List<dynamic>.from(reviews),
      // 'returnPolicy': returnPolicy,
      // 'minimumOrderQuantity': minimumOrderQuantity,
'meta': {
        'createdAt': createdAt.toIso8601String(),
      },      // 'images': List<dynamic>.from(images.map((x) => x)),
      // 'thumbnail': thumbnail,
    };
  }

  ProductCategory getCategory() {
    final now = DateTime.now();
    if (price < 10) {
      return ProductCategory.ventFlash;
    } else if (price < 50) {
      return ProductCategory.discount;
    } else if(now.difference(createdAt).inDays <= 3) {
      return ProductCategory.newProduction;
    } else {
      return ProductCategory.none;
    }
  }
}