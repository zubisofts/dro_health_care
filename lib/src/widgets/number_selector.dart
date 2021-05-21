import 'package:flutter/material.dart';

class NumberSelector extends StatefulWidget {
  final Function(int) onSelect;
  final double width;
  final int initialValue;

  const NumberSelector(
      {required this.onSelect,
      required this.width,
      required this.initialValue});

  @override
  _NumberSelectorState createState() => _NumberSelectorState();
}

class _NumberSelectorState extends State<NumberSelector> {
  late int selectedNumber;

  @override
  void initState() {
    selectedNumber = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.fromBorderSide(BorderSide(
              width: 1.0, color: Theme.of(context).colorScheme.background))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            child: Icon(Icons.remove),
            onTap: () {
              decreaseNumber();
              widget.onSelect(selectedNumber);
            },
          ),
          Text(
            '$selectedNumber',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          InkWell(
            child: Icon(Icons.add),
            onTap: () {
              increaseNumber();
              widget.onSelect(selectedNumber);
            },
          ),
        ],
      ),
    );
  }

  void increaseNumber() {
    setState(() {
      selectedNumber++;
    });
  }

  void decreaseNumber() {
    setState(() {
      if (selectedNumber > 1) {
        selectedNumber--;
      }
    });
  }
}
