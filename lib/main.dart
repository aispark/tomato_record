import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:tomato_record/router/locations.dart';
import 'package:tomato_record/screens/splash_screen.dart';
import 'package:tomato_record/utils/logger.dart';

final _routerDelegate = BeamerDelegate(
    guards: [
      BeamGuard(
        pathPatterns: ['/'],
        check: (context, location) {
          return false;
        },
        beamToNamed: (origin, target) => '/auth',
      )
    ],
    locationBuilder:
        BeamerLocationBuilder(beamLocations: [HomeLocation(), AuthLocation()]));

void main() {
  logger.d("start runApp!!!");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.delayed(const Duration(seconds: 1), () => 100),
        builder: (context, snapshot) {
          return AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: _splashLoadingWidget(snapshot));
        });
  }

  StatelessWidget _splashLoadingWidget(AsyncSnapshot<Object?> snapshot) {
    if (snapshot.hasError) {
      print("error occur while loading.");
      return const Text('Error occur');
    } else if (snapshot.hasData) {
      return const TomatoApp();
    } else {
      return const SplashScreen();
    }
  }
}

class TomatoApp extends StatelessWidget {
  const TomatoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        primarySwatch: Colors.red,
        hintColor: Colors.grey[350],
        fontFamily: 'DoHyeon',
        textTheme: const TextTheme(button: TextStyle(color: Colors.white)),
        appBarTheme: const AppBarTheme(
          elevation: 1,
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(
              color: Colors.black87, fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      routeInformationParser: BeamerParser(),
      routerDelegate: _routerDelegate,
    );
  }
}
