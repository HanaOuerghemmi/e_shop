// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  int id;
  String title;
  String description;
  String category;
  double price;
  String brand;
  Map <String, String> meta;
  List<String> images;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
   required this.brand,
     required this.meta,
     required this.images,
  
  });
  @override
  List<Object?> get props => [id, title,description, category, price, brand, meta, images ];

}
