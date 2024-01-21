import 'package:flutter/material.dart';
import 'package:weather_app/more_info.dart';
import 'package:weather_icons/weather_icons.dart';

class AdditionalInfoCard extends StatelessWidget {
  final String humidity;
  final String visibility;
  final String windSpeed;
  final String pressure;

  const AdditionalInfoCard(
      {super.key,
      required this.humidity,
      required this.visibility,
      required this.windSpeed,
      required this.pressure});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 20),
          child: Text(
            "Additional Information",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AdditionalInfo(
                    icon: Icons.water,
                    label: "Humidity",
                    val: humidity,
                  ),
                  AdditionalInfo(
                    icon: Icons.air,
                    val: windSpeed,
                    label: "Wind Speed",
                  ),
                  AdditionalInfo(
                    icon: WeatherIcons.sandstorm,
                    label: "Visibility",
                    val: visibility,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AdditionalInfo(
                    icon: WeatherIcons.barometer,
                    label: "Pressure",
                    val: pressure,
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
