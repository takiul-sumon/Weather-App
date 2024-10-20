import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:weather_app/Resultbar.dart';
import 'package:weather_app/addition_info.dart';
import 'package:http/http.dart' as http;
import './secret.dart';

class WeatherScrean extends StatefulWidget {
  const WeatherScrean({super.key});

  @override
  State<WeatherScrean> createState() => _WeatherScreanState();
}

class _WeatherScreanState extends State<WeatherScrean> {
  String cityName ='London';
  TextEditingController textEditingController = TextEditingController();

  // void Searchcity(String cityname) {
  //   setState(() {
  //     cityname = textEditingController.text;
  //   });
  // }

  Future<Map<String, dynamic>> currentWeather() async {
    try {
      final res = await http.get(
        Uri.parse(
            'http://api.openweathermap.org/data/2.5/forecast?q=$cityName&APPID=$openweatherapikey'),
      );
      final data = jsonDecode(res.body);
      if (double.parse(data['cod']) != 200) {
        throw 'Unexpected error accured';
      }
      return data;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            cityName.toString(),
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(
                child: const Icon(
                  Icons.search_outlined,
                ),
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return SizedBox(
                          height: 150,
                          width: double.infinity,
                          child: Column(
                            children: [
                              TextField(
                                controller: textEditingController,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    setState(() {
      cityName = textEditingController.text;
    });
                                  },
                                  child: const Text("Enter")),
                            ],
                          ),
                        );
                      });
                },
              ),
            )
          ],
        ),
        body: FutureBuilder(
            future: currentWeather(),
            builder: (context, snapshot) {
              // print(snapshot);
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                    child: CircularProgressIndicator.adaptive());
              }
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              final data = snapshot.data!;
              final currentWeather = data['list'][0];
              final currentTemp = currentWeather['main']['temp'];
              final currentSky = currentWeather['weather'][0]['main'];
              final humidity = currentWeather['main']['humidity'];
              final pressure = currentWeather['main']['pressure'];
              final windSpeed = data['list'][0]['wind']['speed'];

              return Padding(
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                    sigmaX: 10,
                                    sigmaY: 10,
                                  ),
                                  //  blendMode: BlendMode.color,
                                  child: Column(
                                    children: [
                                      Text(
                                        '$currentTemp K',
                                        style: TextStyle(fontSize: 32),
                                      ),
                                      SizedBox(height: 30),
                                      Icon(
                                          currentSky == 'Rain'
                                              ? Icons.water_drop_outlined
                                              : Icons.wb_sunny_outlined,
                                          size: 40),
                                      SizedBox(height: 30),
                                      Text(
                                        '$currentSky',
                                        style: const TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold),
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
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 125,
                      child: ListView.builder(
                        itemCount: 25,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final currentWeather = data['list'][index + 1];
                          final icon = currentWeather['weather'][0]['main'];
                          final temp = currentWeather['main']['temp'];
                          final time =
                              DateTime.parse(data['list'][index + 1]['dt_txt']);
                          // final  time = DateFormat.yMEd().add_jms().format();
                          return resultBar(
                              ic: icon == 'Rain'
                                  ? Icons.water_drop
                                  : Icons.wb_sunny_outlined,
                              temperature: temp,
                              time: DateFormat.j().format(time));
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Additional Information',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        AdditionInfo(
                          icon: Icons.water_drop_outlined,
                          temp: humidity,
                          label: 'Humidity',
                        ),
                        AdditionInfo(
                            icon: Icons.wind_power_sharp,
                            temp: windSpeed,
                            label: 'Wind Speed'),
                        AdditionInfo(
                          icon: Icons.poll_rounded,
                          temp: pressure,
                          label: 'Pressure',
                        )
                      ],
                    )
                  ],
                ),
              );
            }));
  }
}
