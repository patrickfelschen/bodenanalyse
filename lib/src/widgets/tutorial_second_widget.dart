import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TutorialSecondWidget extends StatefulWidget {
  const TutorialSecondWidget({Key? key}) : super(key: key);

  @override
  _TutorialSecondWidgetState createState() => _TutorialSecondWidgetState();
}

class _TutorialSecondWidgetState extends State<TutorialSecondWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primary,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 50.0),
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
                    TextSpan(text: 'Hebe eine '),
                    TextSpan(
                        text: '80x45x45 cm ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: 'Grube aus:'),
                  ],
                ),
              ),
              SizedBox(
                height: 200,
                width: 300,
                child: Image.asset("assets/images/tutorial_grube.png"),
              ),
              RichText(
                text: const TextSpan(
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Trenne ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: 'dabei Ober- und Unterboden.'),
                  ],
                ),
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
