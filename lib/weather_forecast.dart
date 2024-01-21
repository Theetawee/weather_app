import 'package:flutter/material.dart';
import 'package:weather_app/forecast_card.dart';

class WeatherForeCastCard extends StatelessWidget {
  final dynamic foreCast;
  const WeatherForeCastCard({super.key, required this.foreCast});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              "Weather Forcast",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: ForeCastCard(
               data:foreCast,
            ),
          )
        ],
      ),
    );
  }
}
