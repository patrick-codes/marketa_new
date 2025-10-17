part of 'product_detail_bloc.dart';

sealed class ProductDetailEvent {}

class LoadSingleProductEvent extends ProductDetailEvent {
  final String productId;
  LoadSingleProductEvent(this.productId);
}

