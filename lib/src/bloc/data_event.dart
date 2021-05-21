part of 'data_bloc.dart';

abstract class DataEvent extends Equatable {
  const DataEvent();

  @override
  List<Object> get props => [];
}

class FetchProductsEvent extends DataEvent {}

class AddProductToCartEvent extends DataEvent {
  final Cart cart;

  AddProductToCartEvent(this.cart);

  @override
  List<Object> get props => [cart];
}

class SearchProductEvent extends DataEvent {
  final String query;

  SearchProductEvent(this.query);

  @override
  List<Object> get props => [query];
}

class FetchCartEvent extends DataEvent {}

class FetchInitialCartEvent extends DataEvent {}

class AddReduceCartItemEvent extends DataEvent {
  final Cart cart;

  AddReduceCartItemEvent(this.cart);

  @override
  List<Object> get props => [cart];
}

class RemoveCartItemEvent extends DataEvent {
  final Cart cart;

  RemoveCartItemEvent(this.cart);

  @override
  List<Object> get props => [cart];
}
