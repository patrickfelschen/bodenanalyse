import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TutorialFourthWidget extends StatefulWidget {
  const TutorialFourthWidget({Key? key}) : super(key: key);

  @override
  _TutorialFourthWidgetState createState() => _TutorialFourthWidgetState();
}

class _TutorialFourthWidgetState extends State<TutorialFourthWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primary,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              RichText(
                text: const TextSpan(
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                  children: <TextSpan>[
                    TextSpan(text: 'Ziehe ein kleines Wandstück mit der Hacke glatt.\n\n'),
                    TextSpan(text: 'Prüfe in '),
                    TextSpan(
                        text: '5 cm ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: 'Abständen vertikal den Eindringwiderstand des Bodens mit dem Messer.'),
                  ],
                ),
              ),
              SizedBox(
                height: 200,
                width: 300,
                child: Image.asset("assets/images/tutorial_schritt3.png"),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(Size(200, 40)),
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                ),
                onPressed: () {},
                child: Text(
                  'Weiter',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.onSurface),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
