import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp_starter_project/controller/global_controller.dart';
import 'package:weatherapp_starter_project/utils/custom_color.dart';
import 'package:weatherapp_starter_project/widgets/header_widget.dart';
import 'package:weatherapp_starter_project/widgets/hourlyweather_widget.dart';

import '../widgets/currentweather_widget.dart';
import '../widgets/dailyweatherforecast_widget.dart';
import '../widgets/feelslike_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          //a type of value
          child: Obx(
        () => globalController.checkLoading().isTrue
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/icons/clouds.png",
                      height: 250,
                      width: 250,
                    ),
                    const CircularProgressIndicator()
                  ],
                ),
              )
            : Center(
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const HeaderWidget(),
                    //for our current temp
                    CurrentWeatherWidget(
                        weatherDataCurrent: globalController
                            .getWeatherData()
                            .getCurrentWeather()),
                    const SizedBox(height: 20),
                    HourlyWeatherWidget(
                        weatherDataHourly: globalController
                            .getWeatherData()
                            .getHourlyWeather()),
                    const SizedBox(height: 20),
                    DailyWeatherForecastWidget(
                        weatherDataDaily: globalController
                            .getWeatherData()
                            .getDailyWeather()),
                    Container(
                      height: 1,
                      color: CustomColors.dividerLine,
                    ),
                    const SizedBox(height: 20),
                    FeelsLikeWidget(
                        weatherDataCurrent: globalController
                            .getWeatherData()
                            .getCurrentWeather())
                  ],
                ),
              ),
      )),
    );
  }
}
