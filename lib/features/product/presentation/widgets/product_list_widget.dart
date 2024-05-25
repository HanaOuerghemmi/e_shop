import 'package:e_shop/features/product/domain/entities/product.dart';
import 'package:flutter/material.dart';



class ProductListWidget extends StatelessWidget {
  final List<Product> product;
  const ProductListWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ListView.separated(
      itemCount: 10,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Text(product[index].id.toString()),
          title: Text(
            product[index].title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            product[index].price.toString() + '  ' ,
            style: TextStyle(fontSize: 16),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
          onTap: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (_) => ProductDetailPage(product: product[index]),
            //   ),
            // );
          },
        );
      },
      separatorBuilder: (context, index) => Divider(thickness: 1),
    );
  }
}