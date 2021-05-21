
import 'package:flutter/material.dart';

class InfoItemWidget extends StatelessWidget {
  final String title;
  final String value;
  final String icon;

  const InfoItemWidget(
      {Key? key, required this.title, required this.value, required this.icon})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Image.asset(
            'assets/icons/$icon',
            color: Theme.of(context).colorScheme.primary,
            width: 24.0,
          ),
          SizedBox(
            width: 16.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$title',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.background,
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0,
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  '$value',
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
