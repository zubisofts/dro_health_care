import 'package:dro_health_care/src/data/model/cart.dart';
import 'package:dro_health_care/src/data/model/product.dart';
import 'package:flutter/material.dart';

class CartItemWidget extends StatelessWidget {
  final Cart cart;

  const CartItemWidget({required this.cart});

  @override
  Widget build(BuildContext context) {
    print('${cart.product.name}:${cart.count}');
    Product product = cart.product;
    return ListTile(
      minVerticalPadding: 16.0,
      leading: CircleAvatar(
        backgroundImage: AssetImage('assets/images/${product.imageUrl}'),
        radius: 45.0,
      ),
      title: Row(
        children: [
          Text('${cart.count}X',
              style: TextStyle(fontSize: 16.0, color: Colors.white)),
          SizedBox(
            width: 16.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${product.name}',
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text('${product.category}',
                  style: TextStyle(fontSize: 12.0, color: Colors.white)),
            ],
          ),
        ],
      ),
      trailing: Text('₦${cart.count * product.price}',
          style: TextStyle(fontSize: 18.0, color: Colors.white)),
    );
  }
}
