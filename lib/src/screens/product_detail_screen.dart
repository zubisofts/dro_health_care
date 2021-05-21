import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dro_health_care/src/bloc/data_bloc.dart';
import 'package:dro_health_care/src/data/model/cart.dart';
import 'package:dro_health_care/src/data/model/product.dart';
import 'package:dro_health_care/src/screens/cart_screen.dart';
import 'package:dro_health_care/src/widgets/info_widget.dart';
import 'package:dro_health_care/src/widgets/number_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class ProductDetailsScreen extends StatelessWidget {
  ProductDetailsScreen(this.product);

  final ValueNotifier itemCount = ValueNotifier(1);

  final Product product;

  @override
  Widget build(BuildContext context) {
    context.read<DataBloc>().add(FetchInitialCartEvent());
    return Hero(
      tag: product.pid,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          actions: [
            Card(
              margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0)),
              color: Theme.of(context).colorScheme.primary,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icons/shopping_bag.png',
                      width: 24,
                      color: Colors.white,
                    ),
                    SizedBox(width: 8.0),
                    BlocBuilder<DataBloc, DataState>(
                      buildWhen: (previous, current) =>
                          current is CartFetchedState ||
                          current is InitialCartFetchedState,
                      builder: (context, state) {
                        if (state is CartFetchedState) {
                          return Text(
                            '${state.carts.length}',
                            style: TextStyle(color: Colors.white),
                          );
                        }

                        if (state is InitialCartFetchedState) {
                          return Text(
                            '${state.carts.length}',
                            style: TextStyle(color: Colors.white),
                          );
                        }
                        return Text(
                          '0',
                          style: TextStyle(color: Colors.white),
                        );
                      },
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 32.0,
                      ),
                      Center(
                        child: Image.asset(
                          'assets/images/${product.imageUrl}',
                          width: 200,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 32.0,
                            ),
                            Text(
                              '${product.name}',
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                Text(
                                  '${product.category}',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "・",
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '${product.weight}',
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 32.0,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 55,
                                  width: 55,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background
                                          .withOpacity(0.5)),
                                ),
                                SizedBox(
                                  width: 16.0,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'SOLD BY',
                                        style: TextStyle(
                                            fontSize: 12.0,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .background
                                              ..withOpacity(0.3),
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '${product.manufacturer}',
                                        style: TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 4,
                              child: Row(
                                children: [
                                  BlocBuilder<DataBloc, DataState>(
                                    buildWhen: (previous, current) =>
                                        current is CartFetchedState ||
                                        current is CartModifiedState,
                                    builder: (context, state) {
                                      if (state is CartFetchedState) {
                                        try {
                                          int count = state.carts
                                              .firstWhere((element) =>
                                                  element.product.pid ==
                                                  product.pid)
                                              .count;
                                          return NumberSelector(
                                            width: 120.0,
                                            initialValue: count,
                                            onSelect: (number) {
                                              itemCount.value = number;
                                            },
                                          );
                                        } catch (ex) {
                                          print('Error:$ex');
                                        }
                                      }

                                      if (state is CartModifiedState) {
                                        try {
                                          int count = state.carts
                                              .firstWhere((element) =>
                                                  element.product.pid ==
                                                  product.pid)
                                              .count;
                                          return NumberSelector(
                                            width: 120.0,
                                            initialValue: count,
                                            onSelect: (number) {
                                              itemCount.value = number;
                                            },
                                          );
                                        } catch (ex) {
                                          print('Error:$ex');
                                        }
                                      }
                                      return NumberSelector(
                                        width: 120.0,
                                        initialValue: 1,
                                        onSelect: (number) {
                                          itemCount.value = number;
                                        },
                                      );
                                    },
                                  ),
                                  SizedBox(
                                    width: 8.0,
                                  ),
                                  Text(
                                    '${product.dispensedIn}(s)',
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .background,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '₦ ',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '${product.price}',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w800),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'PRODUCT DETAILS',
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.background,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 16.0,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      InfoItemWidget(
                                          title: 'PACK SIZE',
                                          value: '${product.packSize}',
                                          icon: 'capsules.png'),
                                      SizedBox(
                                        height: 16.0,
                                      ),
                                      InfoItemWidget(
                                          title: 'CONSTITUENTS',
                                          value: '${product.constituents}',
                                          icon: 'pill.png'),
                                      SizedBox(
                                        height: 16.0,
                                      ),
                                      InfoItemWidget(
                                          title: 'DISPENSED IN',
                                          value: '${product.dispensedIn}',
                                          icon: 'trash-bin.png'),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      InfoItemWidget(
                                          title: 'PRODUCT ID',
                                          value: '${product.pid}',
                                          icon: 'qr-code.png'),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            '1 ${product.dispensedIn.substring(0, product.dispensedIn.length - 1)} of ${product.name} contains ${product.packSize.split('x').first} unit(s) of ${product.packSize.split('x').last} ${product.category}(s)',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.background,
                              fontWeight: FontWeight.bold,
                              fontSize: 11.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              margin: EdgeInsets.only(bottom: 32.0, top: 8.0),
              child: BlocListener<DataBloc, DataState>(
                listener: (context, state) {
                  if (state is CartFetchedState) {
                    AwesomeDialog(
                      context: context,
                      animType: AnimType.SCALE,
                      dialogType: DialogType.SUCCES,
                      body: Column(
                        children: [
                          Text(
                            'Successful',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                                height: 1.0),
                          ),
                          SizedBox(
                            height: 16.0,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                              '${product.name} has been added to your bag',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0,
                                  height: 1.0),
                            ),
                          ),
                        ],
                      ),
                      headerAnimationLoop: false,
                      btnOk: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: [
                            MaterialButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                showMaterialModalBottomSheet(
                                    context: context,
                                    expand: true,
                                    backgroundColor: Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(32.0)),
                                    builder: (context) => Column(
                                          children: [
                                            SizedBox(
                                              height: 50,
                                            ),
                                            Expanded(child: CartScreen()),
                                          ],
                                        ));
                                // showModalBottomSheet(
                                //   context: context,
                                //   builder: (context) => CartScreen(),
                                // );
                              },
                              color: Color(0xFF00c853),
                              padding: EdgeInsets.all(16.0),
                              elevation: 2,
                              minWidth: MediaQuery.of(context).size.width,
                              child: Text(
                                'View Bag',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            SizedBox(
                              height: 16.0,
                            ),
                            MaterialButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              padding: EdgeInsets.all(16.0),
                              elevation: 2,
                              color: Color(0xFF00c853),
                              minWidth: MediaQuery.of(context).size.width,
                              child: Text(
                                'DONE',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )..show();
                  }
                },
                child: MaterialButton(
                  onPressed: () {
                    context.read<DataBloc>().add(
                        AddProductToCartEvent(Cart(product, itemCount.value)));
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  color: Theme.of(context).colorScheme.primary,
                  // padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/icons/add.png',
                        width: 45,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 16.0,
                      ),
                      Text(
                        'Add to bag',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
