import 'package:clean_archtecture_repository/common/client/api_client.dart';
import 'package:clean_archtecture_repository/common/errors/failure.dart';
import 'package:clean_archtecture_repository/feature/post/data/mapper/product_mapper.dart';
import 'package:clean_archtecture_repository/feature/post/data/model/product_model.dart';
import 'package:clean_archtecture_repository/feature/post/domain/entity/product_entity.dart';
import 'package:clean_archtecture_repository/feature/post/domain/repository/product_repository.dart';
import 'package:dartz/dartz.dart';

class ProductRepositoryImpl extends ProductRepository {
  final ApiClient apiClient = ApiClient();
  final ProductMapper productMapper = ProductMapper();
  final String path = 'https://api.escuelajs.co/api/v1/products';

  @override
  Future<Either<Failure, List<ProductEntity>>> getData() async {
    final res = await apiClient.getMethod(path: path, isHeader: false);
    if (res.isSuccess) {
      try {
        List<ProductEntity> list = [];
        for (final item in res.response) {
          list.add(
            productMapper.toProduct(
              ProductModel.fromJson(item),
            ),
          );
        }
        return Right(list);
      } catch (e) {
        return Left(Failure(errorMessage: "Generation error"));
      }
    }
    return Left(
      Failure(
        errorMessage: res.response.toString(),
      ),
    );
  }
}
