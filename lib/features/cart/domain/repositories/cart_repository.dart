import 'package:dartz/dartz.dart';
import 'package:e_shop/core/error/failures.dart';
import 'package:e_shop/features/cart/domain/entities/cart.dart';

abstract class CartRepository {

  Future<Either<Failure, CartItem>> addToCart(CartItem params);
  Future<Either<Failure, bool>> clearCart();
}