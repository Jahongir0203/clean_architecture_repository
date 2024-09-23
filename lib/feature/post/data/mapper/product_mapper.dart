import 'package:clean_archtecture_repository/feature/post/data/model/product_model.dart';
import 'package:clean_archtecture_repository/feature/post/domain/entity/product_entity.dart';

class ProductMapper {
  ProductEntity toProduct(ProductModel? productModel) {
    return ProductEntity(
      id: productModel?.id,
      description: productModel?.description,
      price: productModel?.price,
      images: productModel?.images,
      title: productModel?.title,
      category: toCategory(productModel?.category),
    );
  }

  CategoryEntity toCategory(Category? category) {
    return CategoryEntity(
      id: category?.id,
      name: category?.name,
      image: category?.image,
    );
  }
}
