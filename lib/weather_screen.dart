import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/additional_info.dart';
import 'package:weather_app/main_card.dart';
import 'package:weather_app/utils.dart';
import 'package:weather_app/weather_forecast.dart';

import 'package:weather_app/secrets.dart';

import 'package:flutter/material.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late Future<dynamic> weather;

  Future getCurrentWeather() async {
    String cityName = "Kampala";
    String apiIdKey = appId;
    var url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/forecast/?q=$cityName&APPID=$apiIdKey');

    try {
      var response = await http.get(url);
      var responseCode = response.statusCode;
      final data = jsonDecode(response.body);
      if (int.parse(data['cod']) == 200 && responseCode == 200) {
        return data;
      } else {
        throw "Unexpected error occured";
      }
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  void initState() {
    super.initState();

    weather = getCurrentWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Weather App"),
          centerTitle: true,
          elevation: 1.0,
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    weather = getCurrentWeather();
                  });
                },
                icon: const Icon(Icons.refresh))
          ],
        ),
        body: FutureBuilder(
          future: weather,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator.adaptive());
            } else if (snapshot.hasError) {
              return const Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.dangerous,
                      size: 30,
                      color: Colors.redAccent,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 4),
                      child: Text(
                        "Something went wrong",
                        style: TextStyle(color: Colors.red, fontSize: 20),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              final data = snapshot.data;
              final currentData = data['list'][0];
              final currentTep = currentData['main']['temp'];
              final currentWeather = currentData['weather'][0]['main'];
              final humidity = currentData['main']['humidity'];
              final pressure = currentData['main']['pressure'];
              final windSpeed = currentData['wind']['speed'];
              final visibility = currentData['visibility'];
              final cityName = data['city']['name'];

              final iconInfo = getIconAndColor(currentWeather);

              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //main card
                    MainWeatherCard(
                        cityName: cityName,
                        currentTemp: currentTep.toString(),
                        currentWeather: currentWeather,
                        iconColor: iconInfo.iconColor,
                        icon: iconInfo.icon),
                    //ForeCast
                    WeatherForeCastCard(
                      foreCast: data,
                    ),

                    //additional information

                    AdditionalInfoCard(
                        humidity: humidity.toString(),
                        visibility: visibility.toString(),
                        windSpeed: windSpeed.toString(),
                        pressure: pressure.toString())
                  ],
                ),
              );
            }
          },
        ));
  }
}




















//New Widgets learnt...
//1. GuestureDetector - onTap(){} detects the tap without any splash shown
//2. InkWell - similar to GD but adds a splash on tap.
//3. IconButton - gives you both the icon and Button with the splash and well set style
//4. Card - gives you a rounded corner card
//5. ClipRRect - clips the corners of the card
//6. BackdropFilter - gives you a blur effect on the card
//7. SingleChildScroll
