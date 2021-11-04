import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TutorialDecisionScreen extends StatefulWidget {
  const TutorialDecisionScreen({Key? key}) : super(key: key);

  static const routeName = "/tutorialDecisionScreen.dart";

  @override
  _TutorialDecisionScreenState createState() => _TutorialDecisionScreenState();
}

class _TutorialDecisionScreenState extends State<TutorialDecisionScreen> {
  @override
  Widget build(BuildContext context) {


      return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
          body:
            Container(
               child:
                  Column(
                    children: [
                      SizedBox(height: 100),
                      Padding(
                          padding: EdgeInsets.only(top:100),
                          child:
                            Text(
                              "Sind die Schritte zur Bodenuntersuchung bekannt?",
                              style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              ),
                            textAlign: TextAlign.center,
                            ),
                      ),
                      SizedBox(height: 100),
                      Row(
                        children: <Widget>[
                          SizedBox(width: 30),
                          Expanded(
                              child: MaterialButton(
                                onPressed: () {},//todo: Verknüpfung zu jeweiligem Dialog
                                child: Text("Nein"),
                                color: Colors.white,
                                textColor: Colors.black,
                              )
                          ),
                          SizedBox(width: 30),
                          Expanded(
                              child: MaterialButton(
                                onPressed: () {},
                                child: Text("Ja"),
                                color: Colors.white,
                                textColor: Colors.black,
                              )
                          ),
                          SizedBox(width: 30),
                        ],
                      ),
                      SizedBox(height: 150),
                      Row(
                        children: [
                          SizedBox(width: 20),
                          Text(
                            "Tutorial zukünftig überspringen",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Switch( //todo: Je nachdem, was ausgewählt ist in DB speichern
                            value: true,
                            onChanged: (bool newValue) {
                              setState(() {;
                              });
                            },
                            activeTrackColor: Theme.of(context).colorScheme.secondary,
                          ),
                        ],
                      )
                    ],
                  ),
            )
      );
  }
}