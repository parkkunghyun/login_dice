
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dart:math';

class Dice extends StatefulWidget {

  @override
  State<Dice> createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  int leftDice = 1;
  int rightDice = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: const Text('Dice game'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    // flex: 1, // 비율임 flex가 커지면 큼
                      child: Image.asset('image/dice$leftDice.png')),
                  const SizedBox(width: 20.0,),
                  Expanded(
                      child: Image.asset('image/dice$rightDice.png')),
                ],
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    leftDice = Random().nextInt(6) + 1;
                    rightDice = Random().nextInt(6) + 1;
                  });
                },
                child: const Icon(Icons.arrow_circle_down)),
          ],
        ),
      ),
    );
  }
}
