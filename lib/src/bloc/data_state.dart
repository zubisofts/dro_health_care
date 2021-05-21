part of 'data_bloc.dart';

abstract class DataState extends Equatable {
  const DataState();

  @override
  List<Object> get props => [];
}

class DataInitial extends DataState {}

class ProductsFetchedState extends DataState {
  final List<Product> products;

  ProductsFetchedState(this.products);

  @override
  List<Object> get props => [products];
}

class CartFetchedState extends DataState {
  final List<Cart> carts;

  CartFetchedState(this.carts);

  @override
  List<Object> get props => [carts];
}

class InitialCartFetchedState extends DataState {
  final List<Cart> carts;

  InitialCartFetchedState(this.carts);

  @override
  List<Object> get props => [carts];
}

class CartModifiedState extends DataState {
  final List<Cart> carts;

  CartModifiedState(this.carts);

  @override
  List<Object> get props => [carts];
}
