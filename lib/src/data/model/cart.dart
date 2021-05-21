import 'package:dro_health_care/src/data/model/product.dart';

class Cart {
  final Product product;
  final int count;

  Cart(this.product, this.count);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Cart && other.product == product && other.count == count;
  }

  @override
  int get hashCode => product.hashCode ^ count.hashCode;

  Cart copyWith({
    Product? product,
    int? count,
  }) {
    return Cart(
      product ?? this.product,
      count ?? this.count,
    );
  }

  @override
  String toString() => 'Cart(product: $product, count: $count)';
}
