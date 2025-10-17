part of 'product_detail_bloc.dart';

sealed class ProductDetailState {}

class SingleProductInitial extends ProductDetailState {}

class ProductDetailLoading extends ProductDetailState {}

class SingleProductSuccess extends ProductDetailState {
  final Product product;

  SingleProductSuccess(this.product);
}

class SingleProductFailure extends ProductDetailState {
  final String error;

  SingleProductFailure({required this.error});
}
