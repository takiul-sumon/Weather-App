import 'package:flutter/material.dart';

class AdditionInfo extends StatelessWidget {
  const AdditionInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Column(
              children: [
                Icon(
                  Icons.water_drop_outlined,
                  size: 35,
                ),
                SizedBox(
                  height: 5,
                ),
                Text('Humidity',
                    style: TextStyle(
                      fontSize: 14,
                    )),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '92',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(width: 100),
            Column(
              children: [
                Icon(
                  Icons.water_drop_outlined,
                  size: 35,
                ),
                SizedBox(
                  height: 5,
                ),
                Text('Humidity',
                    style: TextStyle(
                      fontSize: 14,
                    )),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '92',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(width: 100),
            Column(
              children: [
                Icon(
                  Icons.water_drop_outlined,
                  size: 35,
                ),
                SizedBox(
                  height: 5,
                ),
                Text('Humidity',
                    style: TextStyle(
                      fontSize: 14,
                    )),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '92',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
