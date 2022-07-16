import 'package:flutter/material.dart';
import 'package:luck_hit/Screens/players_regestration_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String appName = "";

  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 4000), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) {
        return PlayersRegisterationScreen();
      }));
    });
    Future.delayed(Duration(milliseconds: 3000), () {
      setState(() {
        appName = "Luck Hit";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white54,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/splash.gif"),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 300),
          child: Center(
            child: Text(
              appName,
              style: TextStyle(
                color: Colors.red,
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: "Lond",
                letterSpacing: 5,
                wordSpacing: 5,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
