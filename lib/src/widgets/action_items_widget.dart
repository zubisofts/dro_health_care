import 'package:dro_health_care/src/bloc/data_bloc.dart';
import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class ActionBarWidget extends StatefulWidget {
  @override
  _ActionBarWidgetState createState() => _ActionBarWidgetState();
}

class _ActionBarWidgetState extends State<ActionBarWidget> {
  bool showSearch = false;
  double searchAreaHeight = 0.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: // SizedBox(
          //   height: 45.0,
          // ),
          Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: InkWell(
                  onTap: () {
                    context.read<DataBloc>().add(SortProductsEvent());
                  },
                  borderRadius: BorderRadius.circular(100),
                  splashColor: Theme.of(context).colorScheme.secondary,
                  child: Container(
                    // margin: EdgeInsets.all(16.0),
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                        color: Theme.of(context)
                            .colorScheme
                            .background
                            .withOpacity(0.3),
                        shape: BoxShape.circle),
                    child: Image.asset(
                      'assets/icons/sort.png',
                      color: Colors.black,
                      width: 24.0,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: InkWell(
                  onTap: () {
                    showFilterActions(context);
                  },
                  borderRadius: BorderRadius.circular(100),
                  splashColor: Theme.of(context).colorScheme.secondary,
                  child: Container(
                    // margin: EdgeInsets.all(16.0),
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                        color: Theme.of(context)
                            .colorScheme
                            .background
                            .withOpacity(0.3),
                        shape: BoxShape.circle),
                    child: Image.asset(
                      'assets/icons/filter.png',
                      color: Colors.black,
                      width: 24.0,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      showSearch = !showSearch;
                      if (showSearch) {
                        searchAreaHeight = 80.0;
                      } else {
                        searchAreaHeight = 0.0;
                      }
                    });
                  },
                  borderRadius: BorderRadius.circular(100),
                  splashColor: Theme.of(context).colorScheme.secondary,
                  child: Container(
                    // margin: EdgeInsets.all(16.0),
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                        color: Theme.of(context)
                            .colorScheme
                            .background
                            .withOpacity(0.3),
                        shape: BoxShape.circle),
                    child: Image.asset(
                      'assets/icons/search.png',
                      color: Colors.black,
                      width: 24.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              height: searchAreaHeight,
              child: SingleChildScrollView(
                child: TextFormField(
                  onChanged: (query) {
                    context.read<DataBloc>().add(SearchProductEvent(query));
                  },
                  style: TextStyle(fontSize: 18.0, color: Colors.black),
                  cursorColor: Theme.of(context).colorScheme.secondary,
                  cursorHeight: 24.0,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.background),
                        borderRadius: BorderRadius.circular(16.0)),
                    hintText: 'Search Product',
                    prefixIcon: Icon(
                      Icons.search,
                    ),
                    suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.close,
                          color: Theme.of(context).colorScheme.background,
                        )),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void showFilterActions(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: FilterOptions(
            onClose: () => Navigator.of(context).pop(),
          ),
          title: Text(
            'Filter',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        );
      },
    );
  }
}

class FilterOptions extends StatefulWidget {
  final Function onClose;

  const FilterOptions({Key? key, required this.onClose}) : super(key: key);

  @override
  _FilterOptionsState createState() => _FilterOptionsState();
}

class _FilterOptionsState extends State<FilterOptions> {
  late double priceStartValue;
  late double priceEndValue;

  late List<String> categories;
  List<String> selectedCategorie = [];

  @override
  void initState() {
    priceStartValue = 10;
    priceEndValue = 5000;
    categories = ["Tablet", "Capsule", "Soft Gel", "Syrup"];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Price Range',
            style: TextStyle(),
          ),
          RangeSlider(
            values: RangeValues(priceStartValue, priceEndValue),
            max: 5000,
            min: 10,
            divisions: 5000,
            onChanged: (value) {
              setState(() {
                priceStartValue = value.start;
                priceEndValue = value.end;
              });
            },
            labels: RangeLabels(
                '₦${priceStartValue.round()}', '₦${priceEndValue.round()}'),
          ),
          Text(
            'Category',
            style: TextStyle(),
          ),
          Wrap(
            spacing: 8.0,
            children: categories
                .map((cat) => GestureDetector(
                      onTap: () {
                        setState(() {
                          if (selectedCategorie.contains(cat)) {
                            selectedCategorie.remove(cat);
                          } else {
                            selectedCategorie.add(cat);
                          }
                        });
                      },
                      child: Chip(
                        backgroundColor: selectedCategorie.contains(cat)
                            ? Theme.of(context).colorScheme.primary
                            : Colors.grey[100],
                        label: Text(
                          cat,
                          style: TextStyle(
                              color: selectedCategorie.contains(cat)
                                  ? Colors.white
                                  : Colors.black),
                        ),
                      ),
                    ))
                .toList(),
          ),
          Divider(),
          SizedBox(
            height: 16.0,
          ),
          Center(
            child: TextButton(
              onPressed: () {
                widget.onClose();
                context.read<DataBloc>().add(FilterProductsEvent(
                    selectedCategorie,
                    [priceStartValue.round(), priceEndValue.round()]));
              },
              child: Text(
                'Apply Filter',
                style: TextStyle(color: Colors.white),
              ),
              style: TextButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary),
            ),
          )
        ],
      ),
    );
  }
}
