import 'package:dro_health_care/src/bloc/data_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartSectionHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.read<DataBloc>().add(FetchProductsEvent());
    return Card(
      color: Theme.of(context).colorScheme.secondary,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32.0), topRight: Radius.circular(32.0))),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 8.0),
            width: MediaQuery.of(context).size.width * 0.2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: Colors.white,
            ),
            height: 5.0,
          ),
          Container(
            padding:
                EdgeInsets.only(right: 16.0, left: 16.0, bottom: 8.0, top: 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icons/shopping_bag.png',
                      color: Colors.white,
                      width: 32.0,
                    ),
                    SizedBox(
                      width: 16.0,
                    ),
                    Text(
                      'Bag',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white),
                    )
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: BlocBuilder<DataBloc, DataState>(
                      buildWhen: (previous, current) =>
                          current is CartFetchedState,
                      builder: (context, state) {
                        if (state is CartFetchedState) {
                          return Text(
                            '${state.carts.length}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.black),
                          );
                        }
                        return Text(
                          '0',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.black),
                        );
                      }),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
