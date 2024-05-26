import 'package:e_shop/features/product/domain/entities/product.dart';
import 'package:flutter/material.dart';

class ProductQuantityWidget extends StatefulWidget {
  const ProductQuantityWidget({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  State<ProductQuantityWidget> createState() => _ProductQuantityWidgetState();
}

class _ProductQuantityWidgetState extends State<ProductQuantityWidget> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _quantityController =
        TextEditingController(text: '1');
    int stock = widget.product.stock;
    return Row(
      children: [
        IconButton(
            icon: Icon(Icons.remove),
            onPressed: () {
              int currentQuantity = int.tryParse(_quantityController.text) ?? 1;
              if (currentQuantity > 1) {
                _quantityController.text = (currentQuantity - 1).toString();
              }
            }),
        Expanded(
          child: TextField(
            controller: _quantityController,
            decoration: InputDecoration(
              labelText: 'Quantity',
            ),
            keyboardType: TextInputType.number,
            onChanged: (value) {},
          ),
        ),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            int currentQuantity = int.tryParse(_quantityController.text) ?? 1;
            if (currentQuantity < stock) {
              _quantityController.text = (currentQuantity + 1).toString();
            }
          },
        ),
        Text(
          '\$${widget.product.price.toStringAsFixed(2)}', // Assuming price is a double
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}
