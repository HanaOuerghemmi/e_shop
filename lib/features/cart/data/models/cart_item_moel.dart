import 'package:e_shop/features/cart/domain/entities/cart.dart';
import 'package:e_shop/features/product/data/models/product_model.dart';

class CartItemModel extends CartItem {
  const CartItemModel({
    String? id,
    required ProductModel product,
    required dynamic priceTag,
  }) : super(id: id, product: product, priceTag: priceTag);

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      id: json["_id"],
      product: ProductModel.fromJson(json["product"]),
      priceTag: ProductModel.fromJson(json["price"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "product": (product as ProductModel).toJson(),
        "priceTag": (priceTag as ProductModel).toJson(),
      };

  Map<String, dynamic> toBodyJson() => {
        "_id": id,
        "product": product.id,
        "priceTag": product.price,
      };

  factory CartItemModel.fromParent(CartItem cartItem) {
    return CartItemModel(
      id: cartItem.id,
      product: cartItem.product as ProductModel,
      priceTag: cartItem.priceTag as ProductModel,
    );
  }
}
