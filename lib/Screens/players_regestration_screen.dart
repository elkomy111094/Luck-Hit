import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:luck_hit/Screens/play_screen.dart';
import 'package:luck_hit/models/player_model.dart';

class PlayersRegisterationScreen extends StatefulWidget {
  @override
  _PlayersRegisterationScreenState createState() =>
      _PlayersRegisterationScreenState();
}

class _PlayersRegisterationScreenState
    extends State<PlayersRegisterationScreen> {
  Object? p1groupVal;
  Object? p2groupVal;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController player1Name = TextEditingController();
  TextEditingController player2Name = TextEditingController();

  TextEditingController luckNumber = TextEditingController();
  TextEditingController maxNumber = TextEditingController();

  @override
  void initState() {
    player1Name.text = "";
    player2Name.text = "";
    luckNumber.text = "";
    maxNumber.text = "";
    p1groupVal = "Male";
    p2groupVal = "Male";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white24,
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 30, left: 10, right: 10, bottom: 0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Center(
                  child: Text(
                    "Players",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        letterSpacing: 5,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Lond"),
                  ),
                ),
                const Center(
                  child: Text(
                    "Registeration",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        fontFamily: ""),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                    left: 120,
                    right: 120,
                  ),
                  child: Divider(
                    thickness: 5,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 340,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: Colors.white, width: 5),
                  ),
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 300,
                          child: Row(
                            children: [
                              getPlayer1(),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    height: 300,
                                    width: 3,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              getPlayer2(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 80,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 80,
                          width: double.infinity,
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            onChanged: (value) {
                              luckNumber.text = value;
                            },
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Lond",
                              fontSize: 20,
                            ),
                            decoration: const InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 2),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 2),
                              ),
                              hintText: "0 TO 98",
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontFamily: "",
                                fontSize: 16,
                              ),
                              focusColor: Colors.white,
                              /*filled: true,*/
                              /*fillColor: mainColor,*/
                            ),
                            showCursor: true,
                            maxLength: 2,
                            cursorHeight: 20,
                            cursorWidth: 3,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (luckNumber.text == "") {
                                return "Enter Luck Number";
                              } else if (int.parse(luckNumber.text) < 0) {
                                return "Luck Number > 0";
                              } else if (int.parse(luckNumber.text) > 98) {
                                return "enter num < 99";
                              } else {}
                            },
                            /*(value) {
            if (value == "" || value == null) {
              return "Please Enter Your Email";
            } else if ((!value.contains("@")) ||
                                !(value.contains("."))) {
              return "please,Entert Correct Email";
            }
        },*/
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 80,
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            onChanged: (value) {
                              maxNumber.text = value;
                            },
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Lond",
                              fontSize: 20,
                            ),
                            decoration: const InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 2),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 2),
                              ),
                              hintText: "Max",
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontFamily: "",
                                fontSize: 16,
                              ),
                              focusColor: Colors.white,
                              /*filled: true,*/
                              /*fillColor: mainColor,*/
                            ),
                            showCursor: true,
                            cursorHeight: 20,
                            maxLength: 2,
                            cursorWidth: 3,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (maxNumber.text == "") {
                                return "Enetr The Max";
                              } else if (int.parse(maxNumber.text) <
                                  int.parse(luckNumber.text)) {
                                return "Max Should be Larger Than Luck";
                              } else if (int.parse(maxNumber.text) < 1) {
                                return "Max Should be Larger Than 1";
                              } else {}
                            },
                            /*(value) {
            if (value == "" || value == null) {
              return "Please Enter Your Email";
            } else if ((!value.contains("@")) ||
                                !(value.contains("."))) {
              return "please,Entert Correct Email";
            }
        },*/
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: RaisedButton(
                        color: Colors.black12,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            if (p1groupVal == null) {
                              Fluttertoast.showToast(
                                  msg: "Check The Player 1 Gender",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            } else if (p2groupVal == null) {
                              Fluttertoast.showToast(
                                  msg: "Check The Player 2 Gender",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            } else {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(builder: (context) {
                                return PlayScreen(
                                  p1: Player(
                                    name: player1Name.text,
                                    gender: p1groupVal.toString(),
                                  ),
                                  p2: Player(
                                    name: player2Name.text,
                                    gender: p2groupVal.toString(),
                                  ),
                                  luck: int.parse(luckNumber.text),
                                  max: int.parse(maxNumber.text),
                                );
                              }));
                            }

                            print("/////////////////////////////////////////");
                            print(p1groupVal);
                            print(p2groupVal);
                          } else {}
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            "START",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 5,
                                fontSize: 30,
                                fontFamily: "Lond"),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getPlayer1() {
    return Expanded(
      flex: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Colors.white, width: 3)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                      child: Text(
                        "Player 1",
                        style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 5,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Lond"),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          TextFormField(
            textAlign: TextAlign.center,
            onChanged: (value) {
              player1Name.text = value;
            },
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 2),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 2),
              ),
              hintText: "First Player Name ",
              hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
              focusColor: Colors.white,
              /*filled: true,*/
              /*fillColor: mainColor,*/
            ),
            showCursor: true,
            cursorHeight: 20,
            cursorWidth: 3,
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value == "") {
                return "Enter player Name";
              }
            },
            /*(value) {
          if (value == "" || value == null) {
            return "Please Enter Your Email";
          } else if ((!value.contains("@")) ||
                          !(value.contains("."))) {
            return "please,Entert Correct Email";
          }
        },*/
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RadioListTile(
                contentPadding: EdgeInsets.only(left: 0),
                title: Text(
                  "Male",
                  style: TextStyle(
                      fontSize: p1groupVal == "Male" ? 20 : 16,
                      color: p1groupVal == "Male" ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                activeColor: Colors.white,
                toggleable: true,
                groupValue: p1groupVal,
                onChanged: (value) {
                  setState(() {
                    p1groupVal = value;
                  });
                },
                value: "Male",
              ),
              RadioListTile(
                contentPadding: EdgeInsets.only(left: 0),
                title: Text(
                  "FeMale",
                  style: TextStyle(
                      fontSize: p1groupVal == "FeMale" ? 20 : 16,
                      color:
                          p1groupVal == "FeMale" ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                activeColor: Colors.white,
                toggleable: true,
                groupValue: p1groupVal,
                onChanged: (value) {
                  setState(() {
                    p1groupVal = value;
                  });
                },
                value: "FeMale",
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget getPlayer2() {
    return Expanded(
      flex: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Colors.white, width: 3)),
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Center(
                      child: Text(
                        "Player 2",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 5,
                            fontFamily: "Lond"),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          TextFormField(
            textAlign: TextAlign.center,
            onChanged: (value) {
              player2Name.text = value;
            },
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            decoration: const InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 2),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 2),
              ),
              hintText: "2nd Player Name ",
              hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
              focusColor: Colors.white,
              /*filled: true,*/
              /*fillColor: mainColor,*/
            ),
            showCursor: true,
            cursorHeight: 20,
            cursorWidth: 3,
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value == "") {
                return "Enter player Name";
              }
            },
            /*(value) {
          if (value == "" || value == null) {
            return "Please Enter Your Email";
          } else if ((!value.contains("@")) ||
                          !(value.contains("."))) {
            return "please,Entert Correct Email";
          }
        },*/
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RadioListTile(
                contentPadding: const EdgeInsets.only(left: 0),
                title: Text(
                  "Male",
                  style: TextStyle(
                      fontSize: p2groupVal == "Male" ? 20 : 16,
                      color: p2groupVal == "Male" ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                activeColor: Colors.white,
                toggleable: true,
                groupValue: p2groupVal,
                onChanged: (value) {
                  setState(() {
                    p2groupVal = value;
                  });
                },
                value: "Male",
              ),
              RadioListTile(
                contentPadding: const EdgeInsets.only(left: 0),
                title: Text(
                  "FeMale",
                  style: TextStyle(
                      fontSize: p2groupVal == "FeMale" ? 20 : 16,
                      color:
                          p2groupVal == "FeMale" ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                activeColor: Colors.white,
                toggleable: true,
                groupValue: p2groupVal,
                onChanged: (value) {
                  setState(() {
                    p2groupVal = value;
                  });
                },
                value: "FeMale",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
