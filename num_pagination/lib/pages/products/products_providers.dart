import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:num_pagination/models/product.dart';
import 'package:num_pagination/repositories/product_repository.dart';

part 'products_providers.g.dart';

@riverpod
FutureOr<List<Product>> getProducts(Ref ref, int page) async {
  final cancelToken = CancelToken();
  Timer? timer;

  ref.onDispose(() {
    print('[getProducts($page)] disposed, timer canceled, token canceled');
    timer?.cancel();
    cancelToken.cancel();
  });

  ref.onCancel(() {
    print('[getProducts($page)] canceled');
  });

  ref.onResume(() {
    print('[getProducts($page)] resumed, timer canceled');
    timer?.cancel();
  });

  final products = await ref
      .watch(productRepositoryProvider)
      .getProducts(page: page, cancelToken: cancelToken);
  final keepAliveLink = ref.keepAlive();

  ref.onCancel(() => timer = Timer(
        Duration(seconds: 10),
        () {
          keepAliveLink.close();
        },
      ));

  return products;
}
