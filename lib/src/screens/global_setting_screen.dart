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
  final double _Padding = 10.0;
  final double _containerHeight = 50.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Einstellungen"),
      ),
      body: ListView(
        padding: EdgeInsets.all(_Padding),
        children: <Widget>[
          Container(
            height: _containerHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget> [
                Center(child: Text('Tutorial überspringen')),
                Switch(
                  value: _skipTutorial,
                  onChanged: (bool newValue) {
                    setState(() {
                      _skipTutorial = newValue;
                    });
                  },
                ),
              ],
            )
          ),
          Divider(),
          Container(
            height: _containerHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget> [
                  Center(child: Text('Standort verwenden')),
                  Switch(
                    value: _useLocation,
                    onChanged: (bool newValue) {
                      setState(() {
                        _useLocation = newValue;
                      });
                    },
                  ),
                ],
              )
          ),
          Divider(),
          Container(
            height: _containerHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget> [
                  Center(child: Text('Daten synchronisieren')),
                  Switch(
                    value: _syncData,
                    onChanged: (bool newValue) {
                      setState(() {
                        _syncData = newValue;
                      });
                    },
                  ),
                ],
              )
          ),
          Divider(),
          Container(
              height: _containerHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget> [
                  Text("Sprachsteuerung", style: TextStyle(color: Colors.grey),),
                  Switch(
                      value: false,
                      onChanged: null
                  )
                ],
              )
          ),
          Divider(),
          Container(
              height: _containerHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget> [
                  Text("Anmeldedaten Cloud"),
                ],
              )
          ),
          Divider(),
          Container(
              height: _containerHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget> [
                  Text("Über die App"),
                ],
              )
          ),
        ],
      ),
    );
  }
}
