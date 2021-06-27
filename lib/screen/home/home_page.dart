import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:weather/dataset.dart';

import 'package:weather/screen/detail/detail_screen.dart';
import 'package:weather/screen/widgets/extra_weather.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff030317),
      body: SafeArea(
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const CurrentWeather(),
            const TodayWeather(),
          ],
        ),
      ),
    );
  }
}

class CurrentWeather extends StatelessWidget {
  const CurrentWeather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlowContainer(
      height: MediaQuery.of(context).size.height - 300,
      glowColor: Colors.blue.withOpacity(.5),
      color: Colors.black,
      spreadRadius: 5,
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(60),
        bottomRight: Radius.circular(60),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(CupertinoIcons.square_grid_2x2),
              Row(
                children: [
                  const Icon(CupertinoIcons.map_fill),
                  Text(" " + currentTemp.location.toString()),
                ],
              ),
              const Icon(Icons.more_vert),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.white),
                borderRadius: BorderRadius.circular(30)),
            child: const Text('Updating'),
          ),
          // ignore: avoid_unnecessary_containers
          Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      height: 80,
                      image: AssetImage(currentTemp.image.toString()),
                      fit: BoxFit.fill,
                    ),
                    Text(
                      currentTemp.current.toString(),
                      style: const TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ],
                ),
                Text(
                  currentTemp.name.toString(),
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
                Text(
                  currentTemp.day.toString(),
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
                const Divider(
                  height: 10,
                  color: Colors.white,
                  indent: 50,
                  endIndent: 50,
                ),
                ExtraWeather(
                  weather: currentTemp,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TodayWeather extends StatelessWidget {
  const TodayWeather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Today",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        // ignore: avoid_print
                        print("7day button");
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return const DetailScreen();
                        }));
                      },
                      child: const Text(
                        "7 day",
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_outlined,
                      color: Colors.grey,
                      size: 15,
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              // color: Colors.blue,
              margin: const EdgeInsets.only(bottom: 30, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  WeatherWidget(todayWeather[0]),
                  WeatherWidget(todayWeather[1]),
                  WeatherWidget(todayWeather[2]),
                  WeatherWidget(todayWeather[3]),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class WeatherWidget extends StatelessWidget {
  final Weather weather;

  // ignore: use_key_in_widget_constructors
  const WeatherWidget(this.weather);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            weather.current.toString() + "\u00B0",
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 5,
          ),
          Image(
            image: AssetImage(weather.image.toString()),
            width: 50,
            height: 50,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            weather.time.toString(),
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          )
        ],
      ),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(width: 0.2, color: Colors.white),
          borderRadius: BorderRadius.circular(35)),
    );
  }
}
