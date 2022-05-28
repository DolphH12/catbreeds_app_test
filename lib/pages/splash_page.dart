import 'dart:async';

import 'package:catbreeds_app/pages/home_page.dart';
import 'package:catbreeds_app/services/cat_provider.dart';
import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

import '../models/cat_model.dart' as catmodel;

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  CatsProvider catsProvider = CatsProvider();

  @override
  void initState() {
    _getCats().then(
      (value) => Timer(
          const Duration(seconds: 5),
          () => Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => HomePage(cats: value),
              ))),
    );
    super.initState();
  }

  Future<List<catmodel.CatsModel>> _getCats() async {
    final cats = await catsProvider.getCats();
    return cats;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          waveGenerator(),
          titleSplash(),
        ],
      ),
    );
  }

  SizedBox titleSplash() {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            'CATBREEDS',
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
          ),
          SizedBox(
            height: 60,
          ),
          Image(image: AssetImage('assets/icon.png'))
        ],
      ),
      width: double.infinity,
      height: double.infinity,
    );
  }

  Widget waveGenerator() {
    return WaveWidget(
      backgroundColor: const Color(0xFFFFC93C),
      config: CustomConfig(
        gradients: [
          [Color(0xFF000000), Color(0xFF155263)],
          [Colors.deepOrange, Color(0xFFFF6F3C)],
          [Colors.orange, Color(0XFFFF9A3C)]
        ],
        durations: [19440, 10800, 6000],
        heightPercentages: [0.50, 0.55, 0.60],
        blur: const MaskFilter.blur(BlurStyle.solid, 10),
        gradientBegin: Alignment.bottomLeft,
        gradientEnd: Alignment.topRight,
      ),
      waveAmplitude: 0,
      size: const Size(
        double.infinity,
        double.infinity,
      ),
    );
  }
}
