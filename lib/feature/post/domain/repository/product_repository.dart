import 'package:clean_archtecture_repository/common/errors/failure.dart';
import 'package:clean_archtecture_repository/feature/post/domain/entity/product_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<ProductEntity>>> getData();
}
