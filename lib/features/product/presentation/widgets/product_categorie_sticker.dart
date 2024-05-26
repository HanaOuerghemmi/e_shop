import 'package:clippy_flutter/clippy_flutter.dart';
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
        height: 5,
        child: Container(
          width: 30,
          height: 50,
          color: (() {
            switch (category) {
              case 'newProduction':
                return Colors.orange;
              case 'discount':
                return Colors.red;
              default:
                return Colors.deepOrangeAccent; // Default color if no match
            }
          })(),
          child: Center(
            child: FittedBox(
              child: Text(
                  textAlign: TextAlign.center,
                  category == 'newProduction' ? 'New' : category,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white)),
            ),
          ),
        ));
  }
}
