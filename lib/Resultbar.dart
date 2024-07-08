import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class resultBar extends StatelessWidget {
   String? time;
   IconData? ic;
  final double? temperature;

  resultBar(
      {super.key,
      @required this.time,
      @required this.ic,
      @required this.temperature});
  // ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      
      child: SizedBox(
        height: 120,
        child: SizedBox(
          width: 100,
          child: Card(
            elevation: 15,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${time}',
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
              Icon(ic),
                SizedBox(height: 8),
                Text('${temperature}')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
