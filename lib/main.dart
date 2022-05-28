import 'package:catbreeds_app/pages/details_page.dart';
import 'package:catbreeds_app/pages/home_page.dart';
import 'package:catbreeds_app/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: SplashPage(),
      routes: {'details': (context) => const DetailsPage()},
    );
  }
}
