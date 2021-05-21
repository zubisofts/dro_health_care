import 'package:dro_health_care/src/data/model/cart.dart';
import 'package:dro_health_care/src/widgets/cart_actions_widget.dart';
import 'package:dro_health_care/src/widgets/cart_item_widget.dart';
import 'package:flutter/material.dart';

class CartItemWrapper extends StatefulWidget {
  final Cart cart;

  const CartItemWrapper({Key? key, required this.cart}) : super(key: key);

  @override
  _CartItemWrapperState createState() => _CartItemWrapperState();
}

class _CartItemWrapperState extends State<CartItemWrapper> {
  bool showAction = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          showAction = !showAction;
        });
      },
      child: !showAction
          ? CartItemWidget(
              cart: widget.cart,
            )
          : CartItemActionsWidget(cart: widget.cart),
    );
  }
}
