import 'package:bodenanalyse/src/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'culture_favorites_screen.dart';

class GlobalSettingsScreen extends StatefulWidget {
  const GlobalSettingsScreen({Key? key}) : super(key: key);

  static const routeName = "/globalSettingsScreen";

  @override
  _GlobalSettingsScreenState createState() => _GlobalSettingsScreenState();
}

class _GlobalSettingsScreenState extends State<GlobalSettingsScreen> {
  final double _padding = 10.0;
  final double _containerHeight = 50.0;

  @override
  Widget build(BuildContext context) {
    AuthProvider _authProvider = Provider.of<AuthProvider>(context);

    bool _skipTutorial = _authProvider.currentUser.settingsModel.tutorial;
    bool _useLocation = _authProvider.currentUser.settingsModel.location;
    bool _syncData = _authProvider.currentUser.settingsModel.sync;

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(_padding),
        children: <Widget>[
          Container(
              height: _containerHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
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
              )),
          const Divider(),
          Container(
              height: _containerHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
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
                children: <Widget>[
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
                  Text("Kulturfavoriten verwalten"),
                ],
              ),
            ),
            onTap: (){
              Navigator.pushNamed(context, CultureFavoritesScreen.routeName);
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
