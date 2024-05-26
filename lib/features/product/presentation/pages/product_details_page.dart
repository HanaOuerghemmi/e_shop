import 'package:e_shop/features/product/domain/entities/product.dart';
import 'package:e_shop/features/product/presentation/widgets/card_items.dart';
import 'package:flutter/material.dart';

class ProductDetailsPage extends StatelessWidget {
  final Product product;
  const ProductDetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: Column(
        children: [
          CardItems(product: product),
          Text('in stock :${product.stock} '),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Description :\n ${product.description} '),
          )
          //add to cart
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add_shopping_cart),
      ),
    );
  }
}
