import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/UI/results/empty_page.dart';
import 'package:weather_app/UI/results/result_page.dart';
import 'package:weather_app/controllers/search_controller.dart';

import '../controllers/theme_provider.dart';

final controller = SearchController();

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController textController = TextEditingController();

  ///Setting list of cities
  String? dropdownvalue;
  var items = ['Dubai', 'Paris', 'New York', 'Milan', 'Moscow'];

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  TextEditingController searchController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Theme.of(context).primaryColorDark,
          Theme.of(context).primaryColorLight
        ], begin: Alignment.topRight, end: Alignment.bottomLeft)),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 30),

                /// Header: City selector and theme change
                Row(
                  children: [
                    SizedBox(
                      width: 40,
                    ),
                    Expanded(
                      child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(30)),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: TextField(
                                  controller: searchController,
                                  onSubmitted: (value) async {
                                    if (searchController.text != "") {
                                      setState(() {
                                        dropdownvalue = value.toString();
                                      });
                                      controller.clearSearch();
                                      await controller
                                          .getWeather(dropdownvalue!);
                                      //searchController.clear();
                                    }
                                  },
                                  decoration: InputDecoration(
                                      hintText: "Enter City",
                                      hintStyle:
                                          TextStyle(color: Colors.black45),
                                      border: InputBorder.none),
                                ),
                              ),
                              InkWell(
                                  onTap: () async {
                                    if (searchController.text != "") {
                                      setState(() {
                                        dropdownvalue =
                                            searchController.text.toString();
                                      });
                                      controller.clearSearch();
                                      await controller
                                          .getWeather(dropdownvalue!);
                                      //searchController.clear();
                                    }
                                  },
                                  child: Container(child: Icon(Icons.search)))
                            ],
                          )),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    InkWell(
                      onTap: () async {
                        Provider.of<ThemeProvider>(context, listen: false)
                            .toggleTheme();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 14.0, horizontal: 14),
                          child: Icon(
                              Provider.of<ThemeProvider>(context).darkTheme
                                  ? Icons.wb_sunny
                                  : Icons.nights_stay),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),

                /// Body: Changing status between Empty,searching and result
                AnimatedSwitcher(
                  duration: Duration(milliseconds: 300),
                  child: controller.response == null &&
                          !controller.isSearching &&
                          controller.error == null
                      ? EmptyPage()
                      : controller.isSearching
                          ? Container(
                              height: MediaQuery.of(context).size.height - 150,
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height:
                                        MediaQuery.of(context).size.width / 2,
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    child: Lottie.asset('assets/loader.json'),
                                  ),
                                ],
                              ),
                            )
                          : controller.response != null
                              ? ResultPage(
                                  city: controller.response!.city
                                      .replaceAll('£', ''),
                                  country: controller.response!.country,
                                  currentTemp: controller.response!.currentTemp
                                      .toStringAsFixed(0),
                                  maxTemp: controller.response!.maxTemp
                                      .toStringAsFixed(0),
                                  minTemp: controller.response!.minTemp
                                      .toStringAsFixed(0),
                                  weatherState:
                                      controller.response!.weatherState,
                                  imageAsset: controller.imageAsset!,
                                  week: controller.response!.alldays,
                                  onClear: () {
                                    searchController.clear();
                                    controller.clearSearch();
                                    dropdownvalue = null;
                                  },
                                )
                              : SizedBox(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
