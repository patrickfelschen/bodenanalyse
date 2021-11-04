import 'dart:collection';

import 'package:bodenanalyse/src/models/property_model.dart';
import 'package:bodenanalyse/src/providers/analysis_provider.dart';
import 'package:bodenanalyse/src/screens/home_screen.dart';
import 'package:bodenanalyse/src/widgets/analysis_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:progress_stepper/progress_stepper.dart';
import 'package:provider/provider.dart';

class AnalysisStartScreen extends StatefulWidget {
  const AnalysisStartScreen({Key? key}) : super(key: key);

  static const routeName = '/analysisStartScreen';

  @override
  _AnalysisStartScreenState createState() => _AnalysisStartScreenState();
}

class _AnalysisStartScreenState extends State<AnalysisStartScreen> {
  List<Widget> stackChildren = List.empty();
  int _steps = 6;
  int _counter = 1;
  List<int> widgetIds = [0, 1];
  int index = 0;

  void _incrementCounter() {
    setState(() {
      if (_counter < _steps) {
        _counter++;
      }
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 1) {
        _counter--;
      }
    });
  }

  void _swapStackChildren() {
    final temp = stackChildren[0];
    setState(() {
      stackChildren[0] = stackChildren[1];
      stackChildren[1] = temp;
    });
  }

  final List<Widget> _stackChildrenStep1 = <Widget>[
    AnalysisCard(
      analysisImage: const AssetImage("assets/images/step1_good_example.png"),
      badExample: false,
      text1: 'Nach Saat ungleche Strohverteilung',
      text2: 'Erosion',
      text3: 'Verkrustung',
      text4: 'Verknetung',
      text5: 'Grobklutig bei Saat',
    ),
    AnalysisCard(
      analysisImage: const AssetImage("assets/images/step1_bad_example.png"),
      badExample: true,
      text1: 'Verschlämmung',
      text2: 'Erosion',
      text3: 'Verkrustung',
      text4: 'Verknetung',
      text5: 'Grobklutig bei Saat',
    )
  ];

  final List<Widget> _stackChildrenStep2 = <Widget>[
    AnalysisCard(
      analysisImage: const AssetImage("assets/images/step2_good_example.png"),
      badExample: false,
      text1: 'Durchgängig über alle Horizonte',
      text2: 'Gleichmäßige Wurzelverteilung',
      text3: 'Intensive Durchwurzelung',
      text4: '',
      text5: '',
    ),
    AnalysisCard(
      analysisImage: AssetImage("assets/images/step2_bad_example.png"),
      badExample: true,
      text1: 'Geknickte Wurzeln',
      text2: 'Wurzelfilz auf verdichteten Schichten',
      text3: '',
      text4: '',
      text5: '',
    )
  ];

  final List<Widget> _stackChildrenStep3 = <Widget>[
    AnalysisCard(
      analysisImage: const AssetImage("assets/images/step3_good_example.png"),
      badExample: false,
      text1: 'RW-Lösung an Oberfläche',
      text2: 'Viele Regenwurmgänge',
      text3: 'Verzahnung von Ober-/Unterboden',
      text4: '',
      text5: '',
    ),
    AnalysisCard(
      analysisImage: AssetImage("assets/images/step3_bad_example.png"),
      badExample: true,
      text1: 'Keine offenen Poren auf der Oberfläche',
      text2: 'In Krume wenig vertikale RW-Gänge',
      text3: 'Keine Verbindung Ober-/Unterboden',
      text4: '',
      text5: '',
    )
  ];

  final List<Widget> _stackChildrenStep4 = <Widget>[
    AnalysisCard(
      analysisImage: const AssetImage("assets/images/step4_good_example.png"),
      badExample: false,
      text1: 'Porös, locker',
      text2: 'Fein aggregiert',
      text3: 'Zerfall zwischen Fingern',
      text4: 'Messereinstich leicht möglich',
      text5: '',
    ),
    AnalysisCard(
      analysisImage: AssetImage("assets/images/step4_bad_example.png"),
      badExample: true,
      text1: 'Stark verfestigt, scharfkantig',
      text2: 'Wurzelfilz an Aggregatoberfläche',
      text3: 'Messer schwer einzustechen',
      text4: '',
      text5: '',
    )
  ];

  final List<Widget> _stackChildrenStep5 = <Widget>[
    AnalysisCard(
      analysisImage: const AssetImage("assets/images/step5_good_example.jpg"),
      badExample: false,
      text1: 'Nach Saat gleichmäßig an Oberfläche verteilt',
      text2: 'Gleichmäßig in Krume eingearbeitet',
      text3: 'Vorfruchtreste in Krume gut verottet',
      text4: 'Gleichmäßige Wurzelentwicklung',
      text5: '',
    ),
    AnalysisCard(
      analysisImage: AssetImage("assets/images/step5_bad_example.png"),
      badExample: true,
      text1: 'Nach Saat ungleiche Strohverteilung',
      text2: 'Reststoffe konzentriert an Oberfläche',
      text3: 'Unverrottete Reststoffe vom Vorjahr',
      text4: 'Wurzelstau auf Strohpolstern',
      text5: '',
    )
  ];

  final List<Widget> _stackChildrenStep6 = <Widget>[
    AnalysisCard(
      analysisImage: const AssetImage("assets/images/step6_good_example.png"),
      badExample: false,
      text1: 'Angenehmer, erdiger Geruch',
      text2: 'Gleichmäßige Farbe',
      text3: '',
      text4: '',
      text5: '',
    ),
    AnalysisCard(
      analysisImage: AssetImage("assets/images/step6_bad_example.png"),
      badExample: true,
      text1: 'Übler, fauliger Geruch',
      text2: 'Blau/grau gefärbte Bereiche',
      text3: 'Rostflecken',
      text4: '',
      text5: '',
    )
  ];

  @override
  Widget build(BuildContext context) {
    final AnalysisProvider _analysisProvider =
        Provider.of<AnalysisProvider>(context);

    final Map<String, Widget> stepTextList = {
      'Oberfläche': Text('Struktur der Oberfläche',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: MediaQuery.of(context).size.width / 26)),
      'Durchwurzelung': Text('Durchwurzelung des Bodens',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: MediaQuery.of(context).size.width / 26)),
      'MakroMikroporen': Text('Makroporen/Bioporen',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: MediaQuery.of(context).size.width / 26)),
      'GefügeVerfestigung': Text('Gefüge und Verfestigung',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: MediaQuery.of(context).size.width / 26)),
      'OrganischeReststoffe': Text('Oraganische Reststoffe',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: MediaQuery.of(context).size.width / 26)),
      'FarbeGeruch': Text('Farbe und Geruch',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: MediaQuery.of(context).size.width / 26))
    };

    switch (_counter) {
      case 1:
        stackChildren = _stackChildrenStep1;
        break;
      case 2:
        stackChildren = _stackChildrenStep2;
        break;
      case 3:
        stackChildren = _stackChildrenStep3;
        break;
      case 4:
        stackChildren = _stackChildrenStep4;
        break;
      case 5:
        stackChildren = _stackChildrenStep5;
        break;
      case 6:
        stackChildren = _stackChildrenStep6;
        break;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Schritt $_counter'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => {
            if (_counter == 1)
              {showCancelDialog(context, _analysisProvider)}
            else
              {_decrementCounter()}
          },
        ),
        actions: [
          IconButton(
              onPressed: () => {showCancelDialog(context, _analysisProvider)},
              icon: Icon(Icons.cancel_outlined))
        ],
      ),
      body: Column(children: [
        Container(
            child: Padding(
                padding: const EdgeInsets.only(top: 4, left: 2, right: 2),
                child: ProgressStepper(
                  width: MediaQuery.of(context).size.width,
                  height: 10,
                  stepCount: _steps,
                  currentStep: _counter,
                  progressColor: Color(0xFF8BA94D),
                ))),
        stepTextList.entries.elementAt(_counter - 1).value,
        Stack(
          children: stackChildren,
        ),
        IconButton(
            onPressed: _swapStackChildren,
            icon: Icon(
              Icons.swap_horizontal_circle_outlined,
              size: 50,
              color: Theme.of(context).colorScheme.primary,
            )),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RatingButtonBar(
                context, stepTextList.entries.elementAt((_counter - 1)).key)
          ],
        )
      ]),
    );
  }

  Future<dynamic> showCancelDialog(BuildContext context, AnalysisProvider analysisProvider) {
    return showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: Text('Abbrechen'),
              content: Text('Analyse abbrechen?'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, HomeScreen.routeName);
                      analysisProvider.clearProperties();
                    },
                    child: Text('Ok')),
                TextButton(
                    onPressed: () => Navigator.pop(context, 'Abbrechen'),
                    child: Text('Abbrechen'))
              ],
            ));
  }

  ButtonBar RatingButtonBar(BuildContext context, String criteria) {
    Color textColor = Colors.white;
    double fontSize = 20;

    final AnalysisProvider _analysisProvider =
        Provider.of<AnalysisProvider>(context);

    void savePropertyToProvider(int ratingValue, String criteriaName) {
      _analysisProvider.addProperty(PropertyModel(
        id: 0,
        rating: ratingValue,
        criteriaName: criteriaName,
      ));
    }

    return ButtonBar(
      alignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () {
            savePropertyToProvider(-2, criteria);
            _incrementCounter();
          },
          child: Text(
            '-2',
            style: TextStyle(color: textColor, fontSize: fontSize),
          ),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  Theme.of(context).colorScheme.secondary)),
        ),
        ElevatedButton(
          onPressed: () {
            savePropertyToProvider(-1, criteria);
            _incrementCounter();
          },
          child: Text(
            '-1',
            style: TextStyle(color: textColor, fontSize: fontSize),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                Theme.of(context).colorScheme.secondary.withOpacity(0.5)),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            savePropertyToProvider(0, criteria);
            _incrementCounter();
          },
          child: Text(
            '0',
            style: TextStyle(color: Colors.black, fontSize: fontSize),
          ),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white)),
        ),
        ElevatedButton(
          onPressed: () {
            savePropertyToProvider(1, criteria);
            _incrementCounter();
          },
          child: Text(
            '+1',
            style: TextStyle(color: textColor, fontSize: fontSize),
          ),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  Theme.of(context).colorScheme.primary.withOpacity(0.5))),
        ),
        ElevatedButton(
          onPressed: () {
            savePropertyToProvider(2, criteria);
            _incrementCounter();
          },
          child: Text(
            '+2',
            style: TextStyle(color: textColor, fontSize: fontSize),
          ),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  Theme.of(context).colorScheme.primary)),
        )
      ],
    );
  }
}
