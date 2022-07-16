import 'dart:math';

import 'package:flutter/material.dart';
import 'package:luck_hit/models/player_model.dart';

import 'congrate_screen.dart';

class PlayScreen extends StatefulWidget {
  int max;
  int luck;

  Player p1;
  Player p2;

  PlayScreen(
      {required this.max,
      required this.luck,
      required this.p1,
      required this.p2});

  @override
  _PlayScreenState createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  bool Player1Hited = true;
  bool Player2Hited = false;
  int random = 0;

  getRandomNumber() {
    int x = Random().nextInt(widget.max);
    return x;
  }

  @override
  void initState() {
    print(
        "////////////////////////////////////////////////////////////////////");
    print(widget.p1.name);
    print(widget.p1.gender);
    print(widget.p2.name);
    print(widget.p2.gender);
    print(widget.max);
    print(widget.luck);
  }

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
                  image: AssetImage("assets/images/vs.gif"), fit: BoxFit.fill),
            ),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.white12,
            child: Padding(
              padding: const EdgeInsets.only(top: 40, right: 10.0, left: 10),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      "Luck Number",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                          fontFamily: ""),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        border: Border.all(color: Colors.black, width: 5),
                      ),
                      child: Center(
                        child: Text(
                          widget.luck.toString(),
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 35,
                              fontFamily: "Lond"),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              widget.p1.name,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Lond"),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              padding: EdgeInsets.all(20),
                              height: 120,
                              width: 120,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(150),
                                  border:
                                      Border.all(color: Colors.grey, width: 3)),
                              child: Image.asset(widget.p1.gender == "Male"
                                  ? "assets/images/boy.png"
                                  : "assets/images/girl.png"),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Container(
                              width: 100,
                              height: 100,
                              color: Colors.white,
                              child: Player2Hited
                                  ? RaisedButton(
                                      color: Colors.red,
                                      onPressed: () {
                                        setState(() {
                                          Player2Hited = false;
                                          Player1Hited = true;
                                          random = getRandomNumber();
                                          if (random == widget.luck) {
                                            Navigator.of(context)
                                                .pushReplacement(
                                                    MaterialPageRoute(
                                                        builder: (context) {
                                              return CongrateScreen(
                                                winnerPlayer: widget.p1,
                                              );
                                            }));
                                          } else
                                            Player1Hited = true;
                                          Player2Hited = false;
                                        });
                                      },
                                      child: Text(
                                        "HIT",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: "Lond",
                                            fontWeight: FontWeight.bold,
                                            fontSize: 40),
                                      ),
                                    )
                                  : Center(
                                      child: Text(
                                      random.toString(),
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 40,
                                          fontFamily: "Lond"),
                                    )),
                            ),
                          ],
                        )),
                        SizedBox(
                          width: 50,
                        ),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              widget.p2.name,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Lond"),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              padding: EdgeInsets.all(20),
                              height: 120,
                              width: 120,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(150),
                                  border:
                                      Border.all(color: Colors.grey, width: 3)),
                              child: Image.asset(widget.p2.gender == "Male"
                                  ? "assets/images/boy.png"
                                  : "assets/images/girl.png"),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Container(
                              width: 100,
                              height: 100,
                              color: Colors.white,
                              child: Player1Hited
                                  ? RaisedButton(
                                      color: Colors.red,
                                      onPressed: () {
                                        setState(() {
                                          Player1Hited = false;
                                          Player2Hited = true;
                                          random = getRandomNumber();
                                          if (random == widget.luck) {
                                            Navigator.of(context)
                                                .pushReplacement(
                                                    MaterialPageRoute(
                                                        builder: (context) {
                                              return CongrateScreen(
                                                winnerPlayer: widget.p2,
                                              );
                                            }));
                                          } else
                                            Player2Hited = true;
                                          Player1Hited = false;
                                        });
                                      },
                                      child: Text(
                                        "HIT",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: "Lond",
                                            fontWeight: FontWeight.bold,
                                            fontSize: 40),
                                      ),
                                    )
                                  : Center(
                                      child: Text(
                                      random.toString(),
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 40,
                                          fontFamily: "Lond"),
                                    )),
                            ),
                          ],
                        )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: double.infinity,
                height: 60,
                child: RaisedButton(
                  color: Colors.red,
                  onPressed: () {},
                  child: Text(
                    "Exit Game",
                    style: TextStyle(
                        letterSpacing: 5,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        fontFamily: "Lond"),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
