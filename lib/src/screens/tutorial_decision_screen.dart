import 'package:bodenanalyse/src/providers/analysis_provider.dart';
import 'package:bodenanalyse/src/screens/analysis_start_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TutorialDecisionScreen extends StatefulWidget {
  const TutorialDecisionScreen({Key? key}) : super(key: key);

  static const routeName = "/tutorialDecisionScreen.dart";

  @override
  _TutorialDecisionScreenState createState() => _TutorialDecisionScreenState();
}

class _TutorialDecisionScreenState extends State<TutorialDecisionScreen> {
  @override
  Widget build(BuildContext context) {
    AnalysisProvider _analysisProvider = Provider.of<AnalysisProvider>(context);
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .primary,
        body: Container(
          child: Column(
            children: [
              SizedBox(height: MediaQuery
                  .of(context)
                  .size
                  .height / 90),
              const Padding(
                padding: EdgeInsets.only(top: 100),
                child: Text(
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
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Nicht implementiert'),
                                duration: Duration(seconds: 3),));

                          },
                        //todo: Verknüpfung zu jeweiligem Dialog
                        child: Text("Nein"),
                        color: Colors.white,
                        textColor: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      )),
                  SizedBox(width: 30),
                  Expanded(
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, AnalysisStartScreen.routeName);
                          _analysisProvider.setTutorialSteps(false);
                        },
                        child: Text("Ja"),
                        color: Colors.white,
                        textColor: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      )),
                  SizedBox(width: 30),
                ],
              ),
              SizedBox(height: 150),
              Row(
                children: [
                  SizedBox(width: 20),
                  const Text(
                    "Tutorial zukünftig überspringen",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Switch(
                    //todo: Je nachdem, was ausgewählt ist in DB speichern
                    value: true,
                    onChanged: (bool newValue) {
                      setState(() {
                        ;
                      });
                    },
                    activeTrackColor: Theme
                        .of(context)
                        .colorScheme
                        .secondary,
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
