import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/theme/app_colors.dart';

class EmptyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 60),
        Lottie.asset('assets/error-animation.json'),
        //Image(image: AssetImage('assets/error.png')),
        Padding(
          padding: const EdgeInsets.all(30),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.white.withOpacity(0.15),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: [
                  Text(
                    'Curios about the weather?',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Select the city you're in and get all the info you need right here",
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
