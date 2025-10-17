import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repository/data model/products_model.dart';
import '../../repository/products_repo.dart';

part 'product_detail_events.dart';
part 'product_detail_states.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  final ProductRepository productRepo = ProductRepository();

  ProductDetailBloc() : super(SingleProductInitial()) {
    on<LoadSingleProductEvent>(_loadSingleProduct);
  }

  Future<void> _loadSingleProduct(
      LoadSingleProductEvent event, Emitter<ProductDetailState> emit) async {
    emit(ProductDetailLoading());
    try {
      final product = await productRepo.fetchProductById(event.productId);
      emit(SingleProductSuccess(product));
      debugPrint('Products Loaded:$product');
    } catch (e) {
      emit(SingleProductFailure(error: e.toString()));
      debugPrint('Error:${e.toString()}');
    }
  }
}
