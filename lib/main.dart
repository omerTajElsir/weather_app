import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/theme/dark_theme.dart';

import 'UI/home_page.dart';
import 'UI/splash.dart';
import 'controllers/theme_provider.dart';
import 'theme/light_theme.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ThemeProvider()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      ///Setting the splash screen for 3 seconds then displaying home page
      future: Future.delayed(Duration(seconds: 3)),
      builder: (context, AsyncSnapshot snapshot) {
        // Show splash screen while waiting for app resources to load:
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(home: Splash());
        } else {
          // Loading is done, return the app:
          return MaterialApp(
            theme: Provider.of<ThemeProvider>(context).darkTheme ? dark : light,
            home: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: Scaffold(
                body: HomePage(),
              ),
            ),
          );
        }
      },
    );
  }
}
