import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather/dataset.dart';

class ExtraWeather extends StatelessWidget {
  const ExtraWeather({
    Key? key,
    required this.weather,
  }) : super(key: key);
  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            const Icon(
              CupertinoIcons.wind,
              color: Colors.white,
            ),
            Text(weather.wind.toString() + " km/h"),
            const Text(
              "ветер",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
        Column(
          children: [
            const Icon(
              CupertinoIcons.cloud_heavyrain,
              color: Colors.white,
            ),
            Text(weather.chanceRain.toString() + " %"),
            const Text(
              " дождь",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
        Column(
          children: [
            const Icon(
              Icons.add_sharp,
              color: Colors.white,
            ),
            Text(weather.humidity.toString() + " %"),
            const Text(
              " влажность",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }
}
