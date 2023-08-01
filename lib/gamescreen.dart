import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:hangman/game/figure.dart';
import 'package:hangman/game/hidden_letter.dart';
import 'package:hangman/util/colors.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  var characters = "abcdefghijklmnopqrstuvwxyz".toUpperCase();
  var word = "death".toUpperCase();
  var tries = 0;
  List<String> selectedChar = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Hangman : The Game",
        ),
      ),
      body: Column(
        children: [
          Expanded(
              flex: 3,
              child: Column(
                children: [
                  Expanded(
                      flex: 4,
                      child: Stack(
                        children: [
                          figure(GameUi.Hang, tries >= 0),
                          figure(GameUi.Head, tries >= 1),
                          figure(GameUi.Body, tries >= 2),
                          figure(GameUi.LeftArm, tries >= 3),
                          figure(GameUi.RightArm, tries >= 4),
                          figure(GameUi.LeftLeg, tries >= 5),
                          figure(GameUi.RightLeg, tries >= 6),
                        ],
                      )),
                  Expanded(
                      child: Container(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: word
                            .split("")
                            .map((e) => hiddenletter(
                                e, !selectedChar.contains(e.toUpperCase())))
                            .toList()),
                  ))
                ],
              )),
          // Expanded(
          //     child: Container(
          //   color: Colors.red,
          // )),
          Expanded(
              flex: 2,
              child: Container(
                // color: Colors.blue,
                padding: EdgeInsets.all(8.0),
                child: GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4,
                  crossAxisCount: 7,
                  children: characters.split("").map((e) {
                    return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black54,
                        ),
                        onPressed: selectedChar.contains(e.toUpperCase())
                            ? null
                            : () {
                                setState(() {
                                  selectedChar.add(e.toUpperCase());
                                  if (word
                                      .split("")
                                      .contains(e.toUpperCase())) {
                                    tries++;
                                  }
                                });
                              },
                        child: Text(
                          e,
                          style: const TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ));
                  }).toList(),
                ),
              ))
        ],
      ),
    );
  }
}
