import "package:flutter/material.dart";
import "package:weather_app/weather_screen.dart";

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: const WeatherScreen(),
        debugShowCheckedModeBanner: false,
        title: "Weather App",
        theme: ThemeData.dark(
          useMaterial3: true,
        ).copyWith());
  }
}
