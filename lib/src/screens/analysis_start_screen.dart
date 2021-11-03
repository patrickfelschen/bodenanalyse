import 'package:flutter/material.dart';
import 'package:progress_stepper/progress_stepper.dart';

class AnalysisStartScreen extends StatefulWidget {
  const AnalysisStartScreen({Key? key}) : super(key: key);

  static const routeName = '/analysisStartScreen';

  @override
  _AnalysisStartScreenState createState() => _AnalysisStartScreenState();
}

class _AnalysisStartScreenState extends State<AnalysisStartScreen> {
  int _steps = 6;
  int _counter = 0;

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
  Widget build(BuildContext context) {
    double widthOfProgressSteper = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          ProgressStepper(
            width: widthOfProgressSteper,
            height: 10,
            stepCount: _steps,
            currentStep: _counter,
            progressColor: Color(0xFF8BA94D),
          ),
        ],
      ),
    );
  }
}
