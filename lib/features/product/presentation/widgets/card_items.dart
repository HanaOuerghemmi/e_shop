import 'package:e_shop/core/app_theme.dart';
import 'package:e_shop/core/text/text_helper.dart';
import 'package:e_shop/features/product/data/models/product_model.dart';
import 'package:e_shop/features/product/domain/entities/product.dart';
import 'package:e_shop/features/product/presentation/widgets/product_categorie_sticker.dart';
import 'package:flutter/material.dart';

class CardItems extends StatelessWidget {
  const CardItems({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    final category = (product as ProductModel).getCategory.name;

    return Stack(
      children: [
        Positioned(
          right: 20,
          top: 0,
          child: ProductCategorieSticker(category: category),
        ),
        Positioned(
          top: 60,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: Column(children: [
              Center(
                child: Image.network(
                  product.images[0],
                  height: MediaQuery.of(context).size.height / 4,
                ),
              ),
              Text(
                textcateWithEllipsis(cutoff: 15, myString: product.title),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(product.brand),
                  SizedBox(
                    width: 20,
                  ),
                  Text('${product.price}£'),
                ],
              )
            ]),
          ),
        ),
      ],
    );
  }
}
