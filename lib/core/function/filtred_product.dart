import 'package:e_shop/features/product/domain/entities/product.dart';
import 'package:e_shop/features/product/presentation/bloc/products/products_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<Product> filterProducts(String productName, context) {
  final currentState = BlocProvider.of<ProductsBloc>(context).state;
  if (currentState is LoadedProductsState && productName != '') {
    List<Product> filteredProducts = currentState.products;
    filteredProducts = filteredProducts
        .where((product) =>
            product.title.toLowerCase().contains(productName.toLowerCase()))
        .toList();
    filteredProducts.sort((a, b) => a.price.compareTo(b.price));
    return filteredProducts;
  } else {
    return [];
  }
}
