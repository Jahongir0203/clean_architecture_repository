import 'package:bloc/bloc.dart';
import 'package:clean_archtecture_repository/common/errors/failure.dart';
import 'package:clean_archtecture_repository/feature/post/data/repository/product_repository_impl.dart';
import 'package:clean_archtecture_repository/feature/post/domain/entity/product_entity.dart';
import 'package:clean_archtecture_repository/feature/post/domain/useCases/product_usecase.dart';
import 'package:meta/meta.dart';

part 'product_event.dart';

part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc(ProductRepositoryImpl productRepositoryImpl)
      : super(ProductInitialState()) {
    on<ProductFetchDataEvent>((event, emit) async {
      emit(ProductLoadingState());
      final res = await ProductUseCase.call(productRepositoryImpl).getData();
      res.fold(
        (l) => emit(ProductFailureState(failure: l)),
        (r) => emit(
          ProductSuccessState(products: r),
        ),
      );
    });
  }
}
