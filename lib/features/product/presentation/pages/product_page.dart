import 'package:e_shop/core/widgets/loading_widget.dart';
import 'package:e_shop/features/product/presentation/bloc/products/products_bloc.dart';
import 'package:e_shop/features/product/presentation/widgets/message_display_widget.dart';
import 'package:e_shop/features/product/presentation/widgets/product_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
     final TextEditingController _searchController = TextEditingController();

    void _onSearch(String productName) {
    }
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
                
                builder:(context, state){
                  if (state is LoadingProductsState) {
                  return LoadingWidget();
                } else if (state is LoadedProductsState) {
                  return RefreshIndicator(
                      onRefresh: () => _onRefresh(context),
                      child: ProductListWidget(products: state.products));
                } else if (state is ErrorProductsState) {
                  return MessageDisplayWidget(message: state.message);
                }
                return LoadingWidget();
                }
                ),
            ),
          ],
        ),
        ) ,
    );
  }
}
Future<void> _onRefresh(BuildContext context) async {
    BlocProvider.of<ProductsBloc>(context).add(RefreshProductEvent());
  }
