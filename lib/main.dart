import 'package:flutter/material.dart';
import './weather_screan.dart';

void main() {
  runApp(const Weatherapp());
}

class Weatherapp extends StatelessWidget {
 const Weatherapp({super.key});
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true).copyWith(appBarTheme: AppBarTheme()),
      
    home: WeatherScrean(),
    );
  }
}
