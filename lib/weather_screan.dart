
import 'package:flutter/material.dart';

class WeatherScrean extends StatelessWidget {
  const WeatherScrean({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      centerTitle: true,
      title: const Text(
        "WeatherApp",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      actions:  [Padding(
        padding: const EdgeInsets.all(10.0),
        child: GestureDetector(child: const Icon(Icons.settings_backup_restore_outlined,),onTap: (){},),
        
      )],
    )
        //  PreferredSize(preferredSize: Size(450, 20), child: Text('hello',),),
        );
  }
}
