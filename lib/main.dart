import 'package:crypto_flutter/home_page.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        sliderTheme: SliderTheme.of(context).copyWith(
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
          overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
          activeTrackColor: Colors.white,
          thumbColor: kBottomContainerColor,
          overlayColor: Color(0x39eb1555),
          inactiveTrackColor: Color(0xff8d8e98),

        ),
        primaryColor: Color(0xff0d1321),
        scaffoldBackgroundColor: Color(0xff0d1321),


      ),
      home: HomePage(),
    );
  }
}

