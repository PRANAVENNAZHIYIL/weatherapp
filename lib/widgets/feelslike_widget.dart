import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:weatherapp_starter_project/model/weather_data_current.dart';
import 'package:weatherapp_starter_project/utils/custom_color.dart';

class FeelsLikeWidget extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;
  const FeelsLikeWidget({super.key, required this.weatherDataCurrent});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin:
              const EdgeInsets.only(top: 1, left: 20, right: 20, bottom: 20),
          child: const Text(
            "Comfort Level",
            style: TextStyle(color: CustomColors.textColorBlack, fontSize: 18),
          ),
        ),
        SizedBox(
          height: 180,
          child: Column(
            children: [
              Center(
                child: SleekCircularSlider(
                    min: 0,
                    max: 100,
                    initialValue:
                        weatherDataCurrent.current.humidity!.toDouble(),
                    appearance: CircularSliderAppearance(
                        customWidths: CustomSliderWidths(
                            handlerSize: 0,
                            trackWidth: 12,
                            progressBarWidth: 12),
                        infoProperties: InfoProperties(
                            bottomLabelText: "Humidity",
                            bottomLabelStyle: const TextStyle(
                                letterSpacing: 0.1,
                                fontSize: 14,
                                height: 1.4,
                                color: CustomColors.textColorBlack)),
                        animationEnabled: true,
                        size: 140,
                        customColors: CustomSliderColors(
                          hideShadow: true,
                          trackColor:
                              CustomColors.firstGradientColor.withAlpha(100),
                          progressBarColor: CustomColors.firstGradientColor,
                        ))),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                      text: TextSpan(children: [
                    const TextSpan(
                        text: "FeelsLike ",
                        style: TextStyle(
                            fontSize: 14,
                            color: CustomColors.textColorBlack,
                            fontWeight: FontWeight.w400,
                            height: 0.8)),
                    TextSpan(
                        text: "${weatherDataCurrent.current.feelsLike}",
                        style: const TextStyle(
                            fontSize: 14,
                            color: CustomColors.textColorBlack,
                            fontWeight: FontWeight.w400,
                            height: 0.8))
                  ])),
                  Container(
                    margin: const EdgeInsets.only(left: 40, right: 40),
                    height: 25,
                    width: 1,
                    color: CustomColors.dividerLine,
                  ),
                  RichText(
                      text: TextSpan(children: [
                    const TextSpan(
                        text: "UV Index ",
                        style: TextStyle(
                            fontSize: 14,
                            color: CustomColors.textColorBlack,
                            fontWeight: FontWeight.w400,
                            height: 0.8)),
                    TextSpan(
                        text: "${weatherDataCurrent.current.uvi}",
                        style: const TextStyle(
                            fontSize: 14,
                            color: CustomColors.textColorBlack,
                            fontWeight: FontWeight.w400,
                            height: 0.8))
                  ])),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
