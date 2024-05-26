import 'package:e_shop/features/product/domain/entities/product.dart';
import 'package:equatable/equatable.dart';

class Cart {
  final List<CartItem> items;

  Cart({required this.items});
}

class CartItem extends Equatable {
  final String? id;
  final Product product;
  final double priceTag;

  const CartItem({required this.id, required this.product, required this.priceTag});

  @override
  List<Object?> get props => [id];
}