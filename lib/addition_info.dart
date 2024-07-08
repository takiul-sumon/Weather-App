import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AdditionInfo extends StatelessWidget {
  // const AdditionInfo({super.key});
  final IconData? icon;
  final String? label;
  final double? temp;
  const AdditionInfo({super.key, @required this.icon, @required this.label,@required this.temp});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Icon(
            icon,
            size: 35,
          ),
          SizedBox(
            height: 5,
          ),
          Text('${label}',
              style: TextStyle(
                fontSize: 14,
              )),
          SizedBox(
            height: 5,
          ),
          Text(
            '${temp}',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
