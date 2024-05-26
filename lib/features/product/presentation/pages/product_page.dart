import 'package:e_shop/core/function/filtred_product.dart';
import 'package:e_shop/core/widgets/loading_widget.dart';
import 'package:e_shop/features/product/domain/entities/product.dart';
import 'package:e_shop/features/product/presentation/bloc/products/products_bloc.dart';
import 'package:e_shop/features/product/presentation/widgets/message_display_widget.dart';
import 'package:e_shop/features/product/presentation/widgets/product_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  late List<Product> filteredProducts;
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    filteredProducts = [];
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearch(String productName) {
    setState(() {
      filteredProducts = filterProducts(productName, context);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List all Products'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    _onSearch(_searchController.text);
                  },
                ),
              ),
              onSubmitted: _onSearch,
            ),
            SizedBox(height: 20),
            Expanded(
              child: BlocBuilder<ProductsBloc, ProductsState>(
                builder: (context, state) {
                  if (state is LoadingProductsState) {
                    return LoadingWidget();
                  } else if (state is LoadedProductsState) {
                    final productsToShow =
                        filteredProducts.isNotEmpty ? filteredProducts : state.products;
                    return RefreshIndicator(
                        onRefresh: () => _onRefresh(context),
                        child: ProductListWidget(products: productsToShow));
                  } else if (state is ErrorProductsState) {
                    return MessageDisplayWidget(message: state.message);
                  }
                  return LoadingWidget();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _onRefresh(BuildContext context) async {
    BlocProvider.of<ProductsBloc>(context).add(RefreshProductEvent());
  }
}
