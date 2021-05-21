import 'package:dro_health_care/src/bloc/data_bloc.dart';
import 'package:dro_health_care/src/data/model/cart.dart';
import 'package:dro_health_care/src/widgets/cart_actions_widget.dart';
import 'package:dro_health_care/src/widgets/cart_item_widget.dart';
import 'package:dro_health_care/src/widgets/cart_item_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartSectionContentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Theme.of(context).colorScheme.secondary,
      child: Column(
        // mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
            margin: EdgeInsets.symmetric(vertical: 16.0),
            decoration: BoxDecoration(
                color: Colors.amber[50],
                borderRadius: BorderRadius.circular(16.0)),
            child: Text(
              'Tap on an item for add, remove, delete options',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: BlocBuilder<DataBloc, DataState>(
              buildWhen: (previous, current) =>
                  current is CartFetchedState || current is CartModifiedState,
              builder: (context, state) {
                if (state is CartFetchedState) {
                  return Container(
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: state.carts.length,
                      itemBuilder: (context, index) =>
                          CartItemWrapper(cart: state.carts[index]),
                    ),
                  );
                }

                if (state is CartModifiedState) {
                  return Container(
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: state.carts.length,
                      itemBuilder: (context, index) =>
                          CartItemWrapper(cart: state.carts[index]),
                    ),
                  );
                }
                return SizedBox.shrink();
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
            margin: EdgeInsets.symmetric(vertical: 32.0, horizontal: 16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.0,
                        // fontWeight: FontWeight.bold
                      ),
                    ),
                    BlocBuilder<DataBloc, DataState>(
                      buildWhen: (previous, current) =>
                          current is CartFetchedState ||
                          current is CartModifiedState,
                      builder: (context, state) {
                        if (state is CartFetchedState) {
                          int totalPrice = 0;
                          state.carts.forEach((cart) {
                            totalPrice += cart.product.price * cart.count;
                          });
                          return Text(
                            '₦$totalPrice',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold),
                          );
                        }
                        if (state is CartModifiedState) {
                          int totalPrice = 0;
                          state.carts.forEach((cart) {
                            totalPrice += cart.product.price * cart.count;
                          });
                          return Text(
                            '₦$totalPrice',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold),
                          );
                        }
                        return Text(
                          '0',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold),
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 32.0,
                ),
                MaterialButton(
                  onPressed: () {},
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                  minWidth: MediaQuery.of(context).size.width * 0.75,
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Checkout',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
