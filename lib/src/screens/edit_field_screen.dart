import 'package:flutter/material.dart';

class EditFieldScreen extends StatefulWidget {
  const EditFieldScreen({Key? key}) : super(key: key);

  static const routeName = '/editFieldScreen';

  @override
  _EditFieldScreenState createState() => _EditFieldScreenState();
}

class _EditFieldScreenState extends State<EditFieldScreen> {
  final double _padding = 8.0;
  final double _containerHeight = 50.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(_padding),
        children: <Widget> [
          Container(
            height: _containerHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const <Widget >[
                Text('Name: '),
              ],
            ),
          ),
          const Divider(),
          Container(
            height: _containerHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const <Widget> [
                Text('Standort: '),
                Text('Wird automatisch ermittelt', style: TextStyle(color: Colors.grey),)
              ],
            ),
          ),
          const Divider(),
          Container(
            height: _containerHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const <Widget> [
                Text('Bodenart des Unterbodens: '),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => setState(() {
        }),
        label: const Text('Feld löschen', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.red,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
