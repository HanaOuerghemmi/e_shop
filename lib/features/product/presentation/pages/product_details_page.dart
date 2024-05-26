import 'package:e_shop/features/product/domain/entities/product.dart';
import 'package:e_shop/features/product/presentation/widgets/product_quantity_widget.dart';
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.network(
                  product.images[0],
                  height: MediaQuery.of(context).size.height / 2,
                ),
              ),
              //title
              Text(product.title),
              Text(product.brand),
              //brand
              Text('in stock: ${product.stock}'),
              // Row for quantity selection and price
              ProductQuantityWidget(
                product: product,
              ),
              //description
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Description:\n${product.description}'),
              ),

            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // cart function 
        },
        child: Icon(Icons.add_shopping_cart),
      ),
    );
  }
}
