import 'package:clean_archtecture_repository/feature/post/data/repository/product_repository_impl.dart';

class ProductUseCase {
  static ProductRepositoryImpl call(
      ProductRepositoryImpl productRepositoryImpl) {
    return productRepositoryImpl;
  }
}
