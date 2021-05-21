import 'package:dro_health_care/src/bloc/data_bloc.dart';
import 'package:dro_health_care/src/data/model/cart.dart';
import 'package:dro_health_care/src/data/model/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItemActionsWidget extends StatefulWidget {
  final Cart cart;

  const CartItemActionsWidget({required this.cart});

  @override
  _CartItemActionsWidgetState createState() => _CartItemActionsWidgetState();
}

class _CartItemActionsWidgetState extends State<CartItemActionsWidget> {
  late int value;

  @override
  void initState() {
    value = widget.cart.count;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minVerticalPadding: 16.0,
      leading: IconButton(
        onPressed: () {
         context.read<DataBloc>().add(DeleteCartItemEvent(
                          widget.cart.copyWith(count: value)));
        },
        icon: Icon(
          Icons.delete_outlined,
          color: Colors.white,
          size: 32,
        ),
      ),
      trailing: Container(
        width: 120,
        child: Row(
          children: [
            Expanded(
              child: IconButton(
                  icon: Icon(
                    Icons.remove_circle,
                    color: Colors.white,
                    size: 40,
                  ),
                  onPressed: () {
                    setState(() {
                      value--;
                      context.read<DataBloc>().add(AddReduceCartItemEvent(
                          widget.cart.copyWith(count: value)));
                    });
                  }),
            ),
            BlocBuilder<DataBloc, DataState>(
              buildWhen: (previous, current) => current is CartFetchedState,
              builder: (context, state) {
                return Text('$value',
                    style: TextStyle(fontSize: 18.0, color: Colors.white));
              },
            ),
            Expanded(
              child: IconButton(
                  icon: Icon(
                    Icons.add_circle,
                    color: Colors.white,
                    size: 40,
                  ),
                  onPressed: () {
                    setState(() {
                      value++;
                      context.read<DataBloc>().add(AddReduceCartItemEvent(
                          widget.cart.copyWith(count: value)));
                    });
                  }),
            )
          ],
        ),
      ),
    );
  }
}
