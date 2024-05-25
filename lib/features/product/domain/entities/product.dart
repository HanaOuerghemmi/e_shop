// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  int id;
  String title;
  String description;
  String category;
  double price;
//   double discountPercentage;
//   double rating;
//   int stock;
//   List<String> tags;
//   String brand;
//   String sku;
//   dynamic weight;
//   Map <String, dynamic> dimensions;
//   String warrantyInformation;
//   String shippingInformation;
//   String availabilityStatus;
// List<Map<String, dynamic>> reviews;
//   String returnPolicy;
//   int minimumOrderQuantity;
   Map <String, String> meta;
//   List<String> images;
//   String thumbnail;
  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    // required this.discountPercentage,
    // required this.rating,
    // required this.stock,
    // required this.tags,
    // required this.brand,
    // required this.sku,
    // required this.weight,
    // required this.dimensions,
    // required this.warrantyInformation,
    // required this.shippingInformation,
    // required this.availabilityStatus,
    // required this.reviews,
    // required this.returnPolicy,
    // required this.minimumOrderQuantity,
     required this.meta,
    // required this.images,
    // required this.thumbnail,
  });
  @override
  List<Object?> get props => [id, title, category, price, meta ];

}
