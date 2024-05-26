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
          right: 0,
          top: 0,
          // bottom:0,
          child: ProductCategorieSticker(category: category),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Text(category, style: TextStyle(color: primaryColor),),
                //title //brand
                ListTile(title: Text(
                    // textAlign:TextAlign.center,
                    product.brand), subtitle: Text(
                    // textAlign:TextAlign.center,
                    product.title)),
                //image
                Image.network(
                  product.images[0],
                  height: MediaQuery.of(context).size.height / 7,
                ),
                //descripion

                //Text(product.description)),
                Text(
                  textcateWithEllipsis(
                      cutoff: 20, myString: product.description),
                ),
                //categorie  //price
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(product.category),
                    Text('${product.price}£'),
                  ],
                )
              ]),
        ),
      ],
    );
  }
}
