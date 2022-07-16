// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:luck_hit/Screens/players_regestration_screen.dart';
import 'package:luck_hit/models/player_model.dart';

class CongrateScreen extends StatefulWidget {
  /*late Player winerPlayer;
  CongrateScreen(winerPlayer);*/

  final Player winnerPlayer;
  CongrateScreen({required this.winnerPlayer});

  @override
  _CongrateScreenState createState() => _CongrateScreenState();
}

class _CongrateScreenState extends State<CongrateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/cong.gif"),
                  fit: BoxFit.fill),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset("assets/images/restart.png"),
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) {
                          return PlayersRegisterationScreen();
                        }));
                      },
                    ),
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50)),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset("assets/images/poweroff.png"),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Center(
                child: Text(
                  widget.winnerPlayer.name,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Lond",
                      fontSize: 50),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                  child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(120)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(widget.winnerPlayer.gender == "Male"
                      ? "assets/images/boy.png"
                      : "assets/images/girl.png"),
                ),
              )),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  "Is",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: "",
                      fontSize: 50),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  "The Winner",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: "",
                      fontSize: 50),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
