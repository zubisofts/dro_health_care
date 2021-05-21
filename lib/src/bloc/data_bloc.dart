import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dro_health_care/src/data/model/cart.dart';
import 'package:dro_health_care/src/data/model/product.dart';
import 'package:dro_health_care/src/data/products_sample_data.dart';
import 'package:equatable/equatable.dart';

part 'data_event.dart';

part 'data_state.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  DataBloc() : super(DataInitial());

  final List<Cart> cart = [];

  @override
  Stream<DataState> mapEventToState(
    DataEvent event,
  ) async* {
    if (event is FetchProductsEvent) {
      List<Product> products = ProductsData.products;
      yield ProductsFetchedState(products);
    }

    if (event is SearchProductEvent) {
      List<Product> products = ProductsData.searchProducts(event.query);
      yield ProductsFetchedState(products);
    }

    if (event is AddProductToCartEvent) {
      yield* _mapAddProductToCartEventToState(event.cart);
    }

    if (event is AddReduceCartItemEvent) {
      yield* _mapAddReduceCartItemEventToState(event.cart);
    }

    if (event is FetchCartEvent) {
      yield CartFetchedState(cart);
    }

    if (event is FetchInitialCartEvent) {
      yield InitialCartFetchedState(cart);
    }
  }

  Stream<DataState> _mapAddProductToCartEventToState(Cart _cart) async* {
    if (cart
        .where((element) => element.product.pid == _cart.product.pid)
        .isNotEmpty) {
      cart.replaceRange(
          cart.indexWhere((element) => element.product == _cart.product),
          cart.indexWhere((element) => element.product == _cart.product) + 1,
          [_cart]);
    } else {
      cart.add(_cart);
    }

    yield CartFetchedState(List.from(cart));
    // add(FetchCartEvent());
  }

  Stream<DataState> _mapAddReduceCartItemEventToState(Cart _cart) async* {
    cart.replaceRange(
        cart.indexWhere((element) => element.product == _cart.product),
        cart.indexWhere((element) => element.product == _cart.product) + 1,
        [_cart]);

    yield CartModifiedState(List.from(cart));
  }
}
