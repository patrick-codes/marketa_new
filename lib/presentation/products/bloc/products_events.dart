part of 'products_bloc.dart';

sealed class ProductEvent {}

class LoadProductsEvent extends ProductEvent {}

class BookmarkProductEvent extends ProductEvent {
  final Product product;
  BookmarkProductEvent(this.product);
}
