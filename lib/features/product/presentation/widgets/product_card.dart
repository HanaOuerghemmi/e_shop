import 'package:e_shop/core/app_theme.dart';
import 'package:e_shop/features/product/domain/entities/product.dart';
import 'package:e_shop/features/product/presentation/widgets/card_items.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;
  const ProductCard({super.key, required this.product, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: baseBoxDecoration,   
      width: MediaQuery.of(context).size.width / 2.2,
      child: GestureDetector(
        onTap: onTap,
        child: CardItems(product: product)
        ),
    );
  }
}
