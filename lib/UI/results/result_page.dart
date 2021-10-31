import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/theme/app_colors.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({
    Key? key,
    required this.country,
    required this.city,
    required this.currentTemp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherState,
    required this.imageAsset,
    required this.week,
    required this.onClear,
  }) : super(key: key);

  final String country;
  final String city;
  final String currentTemp;
  final String maxTemp;
  final String minTemp;
  final String weatherState;
  final String imageAsset;
  final List<NextDays> week;
  final VoidCallback onClear;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 25,
            ),

            /// Main Card: displaying todays's weather
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: double.infinity,
                  height: 350,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 15, top: 10),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(20)),
                          child: Text('Today'),
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 30),
                            child: Text(
                              city.toUpperCase() + ",",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5, top: 40),
                            child: Text(
                              country,
                              textAlign: TextAlign.end,
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.arrow_upward,
                                    color: AppColors.lightRed,
                                  ),
                                  SizedBox(width: 5),
                                  Text('$maxTempº',
                                      style: TextStyle(fontSize: 24))
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Icon(
                                    Icons.arrow_downward,
                                    color: AppColors.lightPurple,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    '$minTempº',
                                    style: TextStyle(fontSize: 24),
                                  )
                                ],
                              ),
                            ],
                          ),
                          Text(
                            '$currentTempº',
                            style: TextStyle(fontSize: 96),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: double.infinity,
                          height: 1,
                          color: AppColors.white.withOpacity(0.3),
                        ),
                      ),
                      Center(child: Text(weatherState))
                    ],
                  ),
                ),
                Positioned(
                  top: -50,
                  left: 10,
                  child: Container(
                    width: 160,
                    height: 160,
                    child: Image(
                      image: AssetImage(imageAsset),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),

            ///Next days list: displaying the weather for the next 5 days
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text('Next days'),
            ),
            SizedBox(height: 30),
            Container(
              width: double.infinity,
              height: 150,
              child: ListView(
                clipBehavior: Clip.none,
                scrollDirection: Axis.horizontal,
                children: [
                  ...week.skip(1).map(
                        (e) => Container(
                          child: Row(
                            children: [
                              Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Container(
                                    height: 150,
                                    width: 120,
                                    decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.15),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.arrow_upward,
                                              color: AppColors.lightRed,
                                              size: 13,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                                '${e.maxTemp.toStringAsFixed(0)}º'),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.arrow_downward,
                                              color: AppColors.lightPurple,
                                              size: 13,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                                '${e.minTemp.toStringAsFixed(0)}º'),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          e.date.split('-').reversed.join('/'),
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    top: -20,
                                    left: 15,
                                    child: Container(
                                      width: 90,
                                      height: 70,
                                      child: Image(
                                          image: AssetImage(
                                              'assets/${e.weatherState.toLowerCase().replaceAll(' ', '_')}.png')),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 20,
                              ),
                            ],
                          ),
                        ),
                      )
                ],
              ),
            ),

            /// Clear button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 30),
              child: InkWell(
                onTap: onClear,
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: AppColors.secondary),
                  child: Center(
                    child: Text(
                      'Clear',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
