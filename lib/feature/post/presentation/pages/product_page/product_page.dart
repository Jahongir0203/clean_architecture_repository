import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/product_bloc/product_bloc.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProductBloc, ProductState>(
        bloc: context.read<ProductBloc>()
          ..add(
            ProductFetchDataEvent(),
          ),
        builder: (context, state) {
          if (state is ProductLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is ProductFailureState) {
            return Center(
              child: Text(state.failure.errorMessage ?? "Error"),
            );
          }

          if (state is ProductSuccessState) {
            return ListView.builder(
              itemCount: state.products.length ?? 0,
              itemBuilder: (context, index) {
                final data = state.products[index];
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 6),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 250,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: PageView.builder(
                              itemCount: data.images?.length ?? 0,
                              itemBuilder: (context, i) {
                                return CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  imageUrl: data.images?[i] ?? '',
                                  placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const Center(child: Icon(Icons.error)),
                                );
                              },
                            ),
                          ),
                          Text(
                            data.title ?? '',
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 18),
                          ),
                          Text("\$${data.price}"?? '',
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 17
                            ),
                          ),
                          Text("${data.description}"?? '',
                            maxLines: 3,
                            overflow:TextOverflow.ellipsis ,
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 17
                            ),
                          ),
                          const SizedBox(height: 20,),
                        ],
                      ),
                    )
                  ],
                );
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
