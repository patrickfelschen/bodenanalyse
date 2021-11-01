import 'package:flutter/material.dart';

class GlobalSettingsScreen extends StatefulWidget {
  const GlobalSettingsScreen({Key? key}) : super(key: key);

  static const routeName = "/globalSettingsScreen";

  @override
  _GlobalSettingsScreenState createState() => _GlobalSettingsScreenState();
}

class _GlobalSettingsScreenState extends State<GlobalSettingsScreen> {
  bool _skipTutorial = true;
  bool _useLocation = true;
  bool _syncData = true;
  final double _horizontalPadding = 8.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Einstellungen"),
      ),
      body: Column(
        children: <Widget> [
           Padding(padding: EdgeInsets.symmetric(horizontal: _horizontalPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget> [
                Text("Tutorial überspringen"),
                Switch(
                  value: _skipTutorial,
                  onChanged: (bool newValue) {
                    setState(() {
                      _skipTutorial = newValue;
                    });
                  },
                )
              ],
            ),
          ),
          Padding(padding: EdgeInsets.symmetric(horizontal: _horizontalPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget> [
                  Text("Standort verwenden"),
                  Switch(
                    value: _useLocation,
                    onChanged: (bool newValue) {
                      setState(() {
                        _useLocation = newValue;
                      });
                    },
                  )
                ],
              )
          ),
          Padding(padding: EdgeInsets.symmetric(horizontal: _horizontalPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget> [
                  Text("Daten synchronisieren"),
                  Switch(
                    value: _syncData,
                      onChanged: (bool newValue) {
                        setState(() {
                          _syncData = newValue;
                      });
                    },
                  )
                ],
              )
          ),
          Padding(padding: EdgeInsets.symmetric(horizontal: _horizontalPadding),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const <Widget> [
                    Text("Sprachsteuerung"),
                    Switch(
                        value: false,
                        onChanged: null
                    )
                  ],
              )
          ),
          Padding(padding: EdgeInsets.all(_horizontalPadding),
            child: Row(
              children: const <Widget>[
                Text("Anmeldedaten Cloud")
              ]
            ),
          ),
          Padding(padding: EdgeInsets.all(_horizontalPadding),
            child: Row(
                children: const <Widget>[
                  Text("Über die App")
                ]
            ),
          ),
        ],
      ),
    );
  }
}
