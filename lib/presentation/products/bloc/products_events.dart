part of 'products_bloc.dart';

sealed class ProductEvent {}

class LoadProductsEvent extends ProductEvent {}

class LoadSingleProductEvent extends ProductEvent {
  final String productId;
  LoadSingleProductEvent(this.productId);
}

class BookmarkProductEvent extends ProductEvent {
  final Product product;
  BookmarkProductEvent(this.product);
}
