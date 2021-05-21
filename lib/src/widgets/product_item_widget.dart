import 'package:dro_health_care/src/bloc/data_bloc.dart';
import 'package:dro_health_care/src/data/model/cart.dart';
import 'package:dro_health_care/src/data/model/product.dart';
import 'package:dro_health_care/src/screens/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductItemWidget extends StatelessWidget {
  final Product product;

  ProductItemWidget({required this.product});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ProductDetailsScreen(product),
        ));
      },
      borderRadius: BorderRadius.circular(8.0),
      child: Hero(
        tag: product.pid,
        child: Card(
          elevation: 3.0,
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 3,
                  child: Image.asset(
                    'assets/images/${product.imageUrl}',
                    // height: 250.0,
                    // width: 350,
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${product.name}',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        '${product.description}',
                        maxLines: 1,
                        style: TextStyle(color: Colors.black, fontSize: 14.0),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              '${product.category}',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          Text(
                            "・",
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.black),
                          ),
                          Expanded(
                            child: Text(
                              '${product.weight}',
                              style: TextStyle(
                                  fontSize: 14.0, color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 16.0),
                        child: Text('₦${product.price}'),
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.background,
                            borderRadius: BorderRadius.circular(16.0)),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
