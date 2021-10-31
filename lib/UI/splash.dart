import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  bool isNavigateToMode = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.cover,
              child: Center(
                child: Container(
                    height: MediaQuery.of(context).size.height / 3,
                    width: MediaQuery.of(context).size.width / 3,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0xFF10182F), Color(0xFF384976)],
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft)),
                    child: Lottie.asset('assets/splash.json')),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
