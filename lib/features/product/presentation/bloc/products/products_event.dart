part of 'products_bloc.dart';

sealed class ProductsEvent extends Equatable {
  const ProductsEvent();

  @override
  List<Object> get props => [];
}
class getAllProductEvent extends ProductsEvent {}
class RefreshProductEvent extends ProductsEvent {}
class SearchProductEvent extends ProductsEvent {
  final String productName;

  SearchProductEvent(this.productName);
}