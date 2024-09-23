import 'package:clean_archtecture_repository/feature/post/data/repository/product_repository_impl.dart';
import 'package:clean_archtecture_repository/feature/post/presentation/bloc/product_bloc/product_bloc.dart';
import 'package:clean_archtecture_repository/feature/post/presentation/pages/product_page/product_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => ProductRepositoryImpl(),
      child: BlocProvider(
        create: (context) => ProductBloc(
          RepositoryProvider.of<ProductRepositoryImpl>(context),
        ),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: ProductPage(),
        ),
      ),
    );
  }
}
