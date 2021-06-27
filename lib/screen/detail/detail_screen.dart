import 'package:flutter/material.dart';
import 'package:weather/dataset.dart';
import 'package:weather/screen/widgets/extra_weather.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          TomorrowWeather(),
          SevenDays(),
        ],
      ),
      appBar: AppBar(
        title: Text('Подробно 7 дней'),
      ),
    );
  }
}

class TomorrowWeather extends StatelessWidget {
  const TomorrowWeather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              tomorrowTemp.image.toString(),
              width: 50,
            ),
            Text(tomorrowTemp.name.toString()),
            Text(tomorrowTemp.max.toString() +
                "\u00B0 / " +
                tomorrowTemp.min.toString() +
                "\u00B0"),
          ],
        ),
        ExtraWeather(weather: tomorrowTemp),
      ],
    );
  }
}

class SevenDays extends StatelessWidget {
  const SevenDays({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            itemCount: sevenDay.length,
            itemBuilder: (BuildContext context, int index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(sevenDay[index].day.toString()),
                  Image(
                    height: 50,
                    image: AssetImage(
                      sevenDay[index].image.toString(),
                    ),
                  ),
                  Text(sevenDay[index].name.toString()),
                  Text("+" + sevenDay[index].max.toString() + "\u00B0"),
                  Text("/"),
                  Text("+" + sevenDay[index].min.toString() + "\u00B0"),
                ],
              );
            }));
  }
}
