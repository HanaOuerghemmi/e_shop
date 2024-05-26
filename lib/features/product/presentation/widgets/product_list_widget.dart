import 'package:e_shop/features/product/domain/entities/product.dart';
import 'package:e_shop/features/product/presentation/pages/product_details_page.dart';
import 'package:e_shop/features/product/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';


class ProductListWidget extends StatelessWidget {
  final List<Product> products;
  const ProductListWidget({
    Key? key,
    required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: products.length,
      gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Number of columns
        crossAxisSpacing: 10, // Horizontal space between items
        mainAxisSpacing: 10, // Vertical space between items
        childAspectRatio: 0.5,
      ),
      itemBuilder: (context, index) {
        final product = products[index];
        return ProductCard(
          onTap: () {
             Navigator.push(
             context,
             MaterialPageRoute(
                 builder: (_) => ProductDetailsPage(product: product),
               ),
             );
          },
          product: product,
        );
      },
    );
  }
}
