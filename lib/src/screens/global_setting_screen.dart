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
  final double _padding = 10.0;
  final double _containerHeight = 50.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(_padding),
        children: <Widget>[
          Container(
            height: _containerHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget> [
                const Text('Tutorial überspringen'),
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
          const Divider(),
          Container(
            height: _containerHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget> [
                  const Text('Standort verwenden'),
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
          const Divider(),
          Container(
            height: _containerHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget> [
                  const Text('Daten synchronisieren'),
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
          const Divider(),
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
          const Divider(),
          GestureDetector(
            child: Container(
                height: _containerHeight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const <Widget> [
                    Text("Anmeldedaten Cloud"),
                  ],
                )
            ),
            onTap: () {
              // TODO: Routing
            },
          ),
          const Divider(),
          GestureDetector(
            child: Container(
              height: _containerHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget> [
                  Text("Über die App"),
                ],
              ),
            ),
            onTap: () {
              showAboutDialog(
                  context: context,
                  applicationName: 'Bodengefüge',
              applicationVersion: 'Version 0.1',
              applicationLegalese: 'Eine App der Hochschule Osnabrück',
              );
            },
          ),
        ],
      ),
    );
  }
}
