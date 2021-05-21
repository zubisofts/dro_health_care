import 'package:dro_health_care/src/bloc/data_bloc.dart';
import 'package:dro_health_care/src/screens/cart_section_content_screen.dart';
import 'package:dro_health_care/src/widgets/cart_section_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    context.read<DataBloc>().add(FetchCartEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          CartSectionHeader(),
          Expanded(child: CartSectionContentScreen())
        ],
      ),
    );
  }
}
