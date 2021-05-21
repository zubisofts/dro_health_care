import 'package:dro_health_care/src/bloc/data_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                  onTap: () {},
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
                  onTap: () {},
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
}
