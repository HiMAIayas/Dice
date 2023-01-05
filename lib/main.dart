import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blueAccent,
        appBar: AppBar(
          title: const Text('My Dice'),
          backgroundColor: Colors.blueAccent,
        ),
        body: const DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;
  bool randoming = false;
  int realLeftDiceNumber = 1;
  int realRightDiceNumber = 1;
  int total = 2;
  bool checkPair = false;

  void changeDiceFace() {
    checkPair=false;
    randoming = true;
    Future.delayed(Duration(milliseconds: 150), () {
      setState(() {
        leftDiceNumber = Random().nextInt(6) + 1;
        rightDiceNumber = Random().nextInt(6) + 1;
      });
    });
    Future.delayed(Duration(milliseconds: 300), () {
      setState(() {
        leftDiceNumber = Random().nextInt(6) + 1;
        rightDiceNumber = Random().nextInt(6) + 1;
      });
    });
    Future.delayed(Duration(milliseconds: 450), () {
      setState(() {
        leftDiceNumber = Random().nextInt(6) + 1;
        rightDiceNumber = Random().nextInt(6) + 1;
      });
    });
    Future.delayed(Duration(milliseconds: 600), () {
      setState(() {
        leftDiceNumber = Random().nextInt(6) + 1;
        rightDiceNumber = Random().nextInt(6) + 1;
      });
    });
    Future.delayed(Duration(milliseconds: 750), () {
      setState(() {
        leftDiceNumber = Random().nextInt(6) + 1;
        rightDiceNumber = Random().nextInt(6) + 1;
      });
    });
    Future.delayed(Duration(milliseconds: 900), () {
      setState(() {
        leftDiceNumber = Random().nextInt(6) + 1;
        rightDiceNumber = Random().nextInt(6) + 1;
      });
    });
    Future.delayed(Duration(milliseconds: 1050), () {
      setState(() {
        leftDiceNumber = Random().nextInt(6) + 1;
        rightDiceNumber = Random().nextInt(6) + 1;
      });
    });
    Future.delayed(Duration(milliseconds: 1200), () {
      setState(() {
        leftDiceNumber = Random().nextInt(6) + 1;
        rightDiceNumber = Random().nextInt(6) + 1;
      });
    });
    Future.delayed(Duration(milliseconds: 1350), () {
      setState(() {
        leftDiceNumber = Random().nextInt(6) + 1;
        rightDiceNumber = Random().nextInt(6) + 1;
      });
    });
    Future.delayed(Duration(milliseconds: 1500), () {
      randoming = false;
      setState(() {
        realLeftDiceNumber = Random().nextInt(6) + 1;
        realRightDiceNumber = Random().nextInt(6) + 1;
        leftDiceNumber = realLeftDiceNumber;
        rightDiceNumber = realRightDiceNumber;
        total = realRightDiceNumber + realLeftDiceNumber;
      });
        if (realLeftDiceNumber==realRightDiceNumber){
          checkPair=true;
          Future.delayed(Duration(milliseconds: 2000),(){
            setState((){
              checkPair=false;
            });
          });
        }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.white30, Colors.black45])),
          child: Column(
            children: [
              SizedBox(
                height: 170,
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 40,
                  ),
                  TextButton(
                    child: Image.asset(
                      'images/dice$leftDiceNumber.png',
                      color: (randoming) ? Colors.grey.shade400 : Colors.white,
                      scale: 3.5,
                    ),
                    onPressed: () {
                      changeDiceFace();
                    },
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  TextButton(
                    child: Image.asset(
                      'images/dice$rightDiceNumber.png',
                      color: (randoming) ? Colors.grey.shade400 : Colors.white,
                      scale: 3.5,
                    ),
                    onPressed: () {
                      changeDiceFace();
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                (randoming) ? 'Total : ??' : 'Total : $total',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                color: (randoming) ? Colors.grey : Colors.white,
                width: 100,
                height: 40,
                child: TextButton(
                  onPressed: () {
                    if (!randoming) {
                      changeDiceFace();
                    }
                  },
                  child: Text(
                    'Roll',
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
        AnimatedPositioned(
          child: Container(
            color: Colors.transparent,
            child: Text(
              'BRAVO',
              style: TextStyle(
                fontSize: 80,
                color: (checkPair)?Colors.yellow:Colors.transparent,
              ),
            ),
          ),
          duration: Duration(milliseconds: 2000),
          right: checkPair ? 500 : -300,
          top:70,
        ),
        AnimatedPositioned(
          child: Container(
            color:Colors.transparent,
            child: Text(
              'BRAVO',
              style: TextStyle(
                fontSize: 80,
                color: (checkPair)?Colors.yellow:Colors.transparent,
              ),
            )
          ),
          duration: Duration(milliseconds: 2000),
          left: checkPair ? 500 : -300,
          bottom:70,
        )
      ],
    );
  }
}