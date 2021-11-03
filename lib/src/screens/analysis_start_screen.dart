import 'package:bodenanalyse/src/widgets/analysis_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:progress_stepper/progress_stepper.dart';

class AnalysisStartScreen extends StatefulWidget {
  const AnalysisStartScreen({Key? key}) : super(key: key);

  static const routeName = '/analysisStartScreen';

  @override
  _AnalysisStartScreenState createState() => _AnalysisStartScreenState();
}

class _AnalysisStartScreenState extends State<AnalysisStartScreen> {
  var testList = List.empty();
  int _steps = 6;
  int _counter = 0;
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
      if (_counter > 0) {
        _counter--;
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void _swapStackChildren() {
    final temp = _stackChildren[0];
    setState(() {
      _stackChildren[0] = _stackChildren[1];
      _stackChildren[1] = temp;
    });
  }

  List<Widget> _stackChildren = <Widget>[
    AnalysisCard(
      analysisImage: AssetImage("assets/images/start.png"),
      badExample: false,
      text1: 'Nach Saat ungleche Strohverteilung',
      text2: 'Erosion',
      text3: 'Verkrustung',
      text4: 'Verknetung',
      text5: 'Grobklutig bei Saat',
    ),
    AnalysisCard(
      analysisImage: AssetImage("assets/images/start.png"),
      badExample: true,
      text1: 'Nach Saat ungleche Strohverteilung',
      text2: 'Erosion',
      text3: 'Verkrustung',
      text4: 'Verknetung',
      text5: 'Grobklutig bei Saat',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(children: [
        Container(
            child: ProgressStepper(
          width: MediaQuery.of(context).size.width,
          height: 10,
          stepCount: _steps,
          currentStep: _counter,
          progressColor: Color(0xFF8BA94D),
        )),
        Text('Struktur der Oberfläche', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),
        Stack(
          children: _stackChildren,
        ),
        IconButton(
            onPressed: _swapStackChildren,
            icon: Icon(
              Icons.swap_horizontal_circle_outlined,
              size: 50,
              color: Theme.of(context).colorScheme.primary,
            )),

      ]),
    ));
  }
}
