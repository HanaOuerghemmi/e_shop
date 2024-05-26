import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:clippy_flutter/star.dart';
import 'package:e_shop/core/app_theme.dart';
import 'package:e_shop/features/product/data/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductCategorieSticker extends StatelessWidget {
  const ProductCategorieSticker({
    super.key,
    required this.category,
  });

  final String category;

  @override
  Widget build(BuildContext context) {
    return Arc(
        edge: Edge.BOTTOM,
        arcType: ArcType.CONVEY,
        height: 20.0,
        //numberOfPoints: 10,
        child: Container(
          width: 50,
          height: 100,
          color: (() {
            switch (category) {
              case 'newProduction':
                return primaryColor;
              case 'discount':
                return Colors.red;
              default:
                return Colors.purple; // Default color if no match
            }
          })(),
          child: Center(
            child: FittedBox(
              child: Text(
                  textAlign: TextAlign.center,
                  category == 'newProduction' ? 'New' : category,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white)),
            ),
          ),
        ));
  }
}
