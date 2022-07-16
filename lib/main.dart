import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Screens/splash_screen.dart';

void main() {
  sum2(5, x: 1, s: 2, y: 3);

  runApp(StrokeLuck());
  SystemChrome.setEnabledSystemUIOverlays([]);
}

sum({
  required z,
  x,
  y,
}) {}

sum2(z, {x, y, s}) {}

class StrokeLuck extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stroke Luck',
      home: Scaffold(
        body: SplashScreen(),
      ),
    );
  }
}
