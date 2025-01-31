import 'dart:async';

import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:provider_lifecycle/models/product.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod/riverpod.dart';

part 'providers.g.dart';

@riverpod
Dio dio(Ref ref) {
  return Dio(BaseOptions(baseUrl: 'https://dummyjson.com'));
}

@riverpod
FutureOr<List<Product>> getProducts(Ref ref) async {
  final cancelToken = CancelToken();
  Timer? timer;

  print('[getProductsProvider] initialized');
  ref.onDispose(() {
    print('[getProductsProvider] disposed, token cancelled');
    timer?.cancel();
    cancelToken.cancel();
  });
  ref.onCancel(() {
    print('[getProductsProvider] cancelled');
  });
  ref.onResume(() {
    print('[getProductsProvider] resumed');
    timer?.cancel();
  });
  ref.onAddListener(() {
    print('[getProductsProvider] listener added');
  });
  ref.onRemoveListener(() {
    print('[getProductsProvider] listener removed');
  });

  final response =
      await ref.watch(dioProvider).get('/products', cancelToken: cancelToken);

  final keepAliveLink = ref.keepAlive();

  ref.onCancel(() {
    print('[getProductsProvider] timer started');
    timer = Timer(
      const Duration(seconds: 10),
      () {
        keepAliveLink.close();
      },
    );
  });

  final List productList = response.data['products'];
  print(productList[0]);
  final products = [
    for (final product in productList) Product.fromJson(product)
  ];

  return products;
}

@riverpod
FutureOr<Product> getProduct(Ref ref, {required int productId}) async {
  print('[getProductProvider($productId)] initialized');
  ref.onDispose(() {
    print('[getProductProvider($productId)] disposed');
  });
  ref.onCancel(() {
    print('[getProductProvider($productId)] canceled');
  });
  ref.onResume(() {
    print('[getProductProvider($productId)] resumed');
  });
  ref.onAddListener(() {
    print('[getProductProvider($productId)] listener added');
  });
  ref.onRemoveListener(() {
    print('[getProductProvider($productId)] listener removed');
  });

  final response = await ref.watch(dioProvider).get('/products/$productId');

  return Product.fromJson(response.data);
}
