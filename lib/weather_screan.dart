import 'dart:ui';

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
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              child: const Icon(
                Icons.settings_backup_restore_outlined,
              ),
              onTap: () {},
            ),
          )
        ],
      ),
      body: Padding(
          padding:  EdgeInsets.all(16.0),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child:  Card(
                  elevation: 10,
                  child: Placeholder(
                    strokeWidth: 0,color: Colors.black45,
                    
                     fallbackHeight: double.infinity,
                     fallbackWidth: double.infinity,
                     child: SizedBox(
                       
                       width: double.infinity,
                       child: Card(
                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                         child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          
                           child: BackdropFilter(filter: ImageFilter.blur(
                            sigmaX: 10,
                            sigmaY: 10,
                            
                           ),
                          //  blendMode: BlendMode.color,
                             child:const Padding(
                               padding:  EdgeInsets.all(16.0),
                               child: Column(
                                 children: [
                                   
                                   Text(
                                     '300.006F',
                                     style: TextStyle(fontSize: 32),
                                   ),
                                   SizedBox(height: 30),
                                   Icon(Icons.cloud, size: 40),
                                   SizedBox(height: 30),
                                   Text(
                                     'Rain',
                                     style: TextStyle(fontSize: 24),
                                     
                                   )
                                 ],
                               ),
                             ),
                           ),
                         ),
                       ),
                     ),
                   ),
                ),
              ),
              Placeholder(
                fallbackHeight: 150,
              ),
              SizedBox(
                height: 20,
              ),
              Placeholder(
                fallbackHeight: 100,
              )
            ],
          ),
        ),
      
    );
  }
}
