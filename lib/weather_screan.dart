import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:weather_app/Resultbar.dart';
import 'package:weather_app/addition_info.dart';

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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                elevation: 10,
                child: Placeholder(
                  strokeWidth: 0,
                  color: Colors.black45,
                  fallbackHeight: double.infinity,
                  fallbackWidth: double.infinity,
                  child: SizedBox(
                    width: double.infinity,
                    child: Card(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 10,
                            sigmaY: 10,
                          ),
                          //  blendMode: BlendMode.color,
                          child: const Column(
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
            const Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'Weather Forcast',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            resultBar(ic: Icons.water_drop,temperature: 320,time: '03:00'),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Additional Information',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
           const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: [
                AdditionInfo(
                  icon: Icons.water_drop,
                  temp: 30,
                  label: 'Humidity',
                ),
                AdditionInfo(
                  icon: Icons.wind_power_sharp,
                temp:50,label: 'Wind Speed'),
                AdditionInfo(
                  icon: Icons.poll_rounded,
                  temp: 60,label: 'Pressure',
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
