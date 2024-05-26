
import 'package:e_shop/core/text/text_helper.dart';
import 'package:e_shop/features/product/domain/entities/product.dart';
import 'package:flutter/material.dart';

class CardItems extends StatelessWidget {
  const CardItems({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      //title //brand
      ListTile(         
        title: Text(
          textAlign:TextAlign.center,
          product.brand), subtitle: 
          Text(
            textAlign:TextAlign.center,
            product.title
            )),
      //image
      Image.network(
        product.images[0],
        height: MediaQuery.of(context).size.height / 6,
      ),
      //descripion
     
      //Text(product.description)),
       Text(
        textcateWithEllipsis(cutoff: 20, myString: product.description),
      ),
      //categorie  //price
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(product.category),
          Text('${product.price}£'),
        ],
      )
    ]);
  }
}

