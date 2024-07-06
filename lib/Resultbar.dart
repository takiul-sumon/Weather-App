import 'package:flutter/material.dart';

class resultBar extends StatelessWidget {
  const resultBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder(
      fallbackHeight: 150,
      child: SingleChildScrollView(
        child: Row(
          children: [
            SizedBox(
              height: 150,
              child: Row(
                children: [
                  SizedBox(
                    width: 100,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '03:00',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8),
                          Icon(Icons.cloud),
                          SizedBox(height: 8),
                          Text('302')
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
