import 'package:dro_health_care/src/bloc/data_bloc.dart';
import 'package:dro_health_care/src/screens/cart_section_content_screen.dart';
import 'package:dro_health_care/src/widgets/action_items_widget.dart';
import 'package:dro_health_care/src/widgets/cart_item_widget.dart';
import 'package:dro_health_care/src/widgets/cart_section_header.dart';
import 'package:dro_health_care/src/widgets/product_item_widget.dart';
import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoreScreen extends StatefulWidget {
  @override
  _StoreScreenState createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  GlobalKey<ExpandableBottomSheetState> bottomSheetKey = GlobalKey();

  @override
  void initState() {
    context.read<DataBloc>().add(FetchProductsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: BlocBuilder<DataBloc, DataState>(
            buildWhen: (previous, current) => current is ProductsFetchedState,
            builder: (context, state) {
              if (state is ProductsFetchedState) {
                return Text(
                  '${state.products.length} ${state.products.length > 1 ? 'items' : 'item'}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                );
              }
              return Text('Item(s)');
            }),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {}),
      ),
      body: Column(
        children: [
          Expanded(
            child: ExpandableBottomSheet(
                // key: bottomSheetKey,
                background: Container(
                  color: Colors.transparent,
                  padding: EdgeInsets.only(bottom: 60),
                  child: Column(
                    children: [
                      Container(
                        child: ActionBarWidget(),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.all(16.0),
                          child: BlocBuilder<DataBloc, DataState>(
                            buildWhen: (previous, current) =>
                                current is ProductsFetchedState,
                            builder: (context, state) {
                              if (state is ProductsFetchedState) {
                                return GridView.builder(
                                  physics: BouncingScrollPhysics(),
                                  // shrinkWrap: true,
                                  itemCount: state.products.length,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          mainAxisSpacing: 16.0,
                                          crossAxisSpacing: 16.0,
                                          childAspectRatio: 0.65),
                                  itemBuilder: (context, index) =>
                                      ProductItemWidget(
                                          product: state.products[index]),
                                );
                              }

                              return Container(
                                child: Text("Waiting"),
                              );
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                onIsContractedCallback: () {
                  // bottomSheetKey.currentState!.contract();
                },
                persistentHeader: CartSectionHeader(),
                expandableContent: Container(
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: CartSectionContentScreen())),
          ),
        ],
      ),
    );
  }
}
