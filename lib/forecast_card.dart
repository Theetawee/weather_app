import "package:flutter/material.dart";
import "package:intl/intl.dart";
import "package:weather_app/utils.dart";

class ForeCastCard extends StatelessWidget {
  final dynamic data;

  const ForeCastCard({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) {
            final forecastInfo = data['list'][index + 1];

            final iconInfo =
                getIconAndColor(forecastInfo['weather'][0]['main']);
            final time = DateTime.parse(forecastInfo['dt_txt'].toString());
            return Card(
              elevation: 1.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: Padding(
                padding: const EdgeInsets.only(top: 4,bottom: 4,left: 35,right: 35),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        DateFormat.Hm().format(time),
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Icon(
                        iconInfo.icon,
                        size: 34,
                        color: iconInfo.iconColor,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text(
                          forecastInfo['main']['temp'].toString(),
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w200),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
