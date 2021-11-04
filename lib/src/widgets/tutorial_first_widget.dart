import 'dart:io';

import 'package:bodenanalyse/src/screens/analysis_start_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TutorialFirstWidget extends StatefulWidget {
  const TutorialFirstWidget({Key? key}) : super(key: key);

  @override
  _TutorialFirstWidgetState createState() => _TutorialFirstWidgetState();
}

class _TutorialFirstWidgetState extends State<TutorialFirstWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primary,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              const Text(
                'Benötigtes Material:',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 26.0,
                ),
              ),
              Expanded(
                child: Container(
                  child: GridView.count(
                    crossAxisCount: 2,
                    children: <Widget>[
                      Container(
                        height: 100,
                        width: 100,
                        child: Column(
                          children: [
                            Expanded(
                                child: Image.asset(
                                    "assets/images/tutorial_spaten.png")),
                            const Text(
                              'Spaten',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.0),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 100,
                        width: 100,
                        child: Column(
                          children: [
                            Expanded(
                                child: Image.asset(
                                    "assets/images/tutorial_hacke.png")),
                            const Text(
                              'Hacke',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.0),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 100,
                        width: 100,
                        child: Column(
                          children: [
                            Expanded(
                                child: Image.asset(
                                    "assets/images/tutorial_messer.png")),
                            const Text(
                              'Messer',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.0),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 100,
                        width: 100,
                        child: Column(
                          children: [
                            Expanded(
                                child: Image.asset(
                                    "assets/images/tutorial_massstab.png")),
                            const Text(
                              'Zollstock',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.0),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(Size(200, 40)),
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                ),
                onPressed: () {Navigator.pop(context);},
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
