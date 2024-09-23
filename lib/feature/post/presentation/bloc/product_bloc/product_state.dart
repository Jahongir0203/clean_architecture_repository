part of 'product_bloc.dart';

@immutable
sealed class ProductState {}

final class ProductInitialState extends ProductState {}

class ProductLoadingState extends ProductState {}

class ProductSuccessState extends ProductState {
  final List<ProductEntity> products;

  ProductSuccessState({required this.products});
}

class ProductFailureState extends ProductState {
  final Failure failure;

  ProductFailureState({required this.failure});
}
