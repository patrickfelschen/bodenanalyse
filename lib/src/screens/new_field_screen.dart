import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewFieldScreen extends StatefulWidget {
  const NewFieldScreen({Key? key}) : super(key: key);

  static const routeName = '/newFieldScreen';

  @override
  _NewFieldScreenState createState() => _NewFieldScreenState();
}

class _NewFieldScreenState extends State<NewFieldScreen> {
  final double _padding = 8.0;
  final double _containerHeight = 50.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Feld hinzufügen"),
      ),
      body:
            ListView(
              padding: EdgeInsets.only(top:8,left:8,right:8,bottom:200),
              children: <Widget> [
                Container(
                  height: _containerHeight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const <Widget >[
                      Text('Name: '),
                      Flexible(
                        child: TextField(),
                      ),
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
                      Text('Bodenart des Oberbodens: '),
                    ],
                  ),
                ),
                const Divider(),
                Container(
                  height: _containerHeight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const <Widget> [
                      Text('Kulturauswahl: '),
                    ],
                  ),
                ),
                const Divider(),

               //todo: Wie sieht es eingebunden in Menü aus?
               Container(
                  height: 300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                ),

                FloatingActionButton.extended(
                  onPressed: (){},//todo: neues Feld anlegen
                  label: const Text('Feld speichern', style: TextStyle(color: Colors.white),),
                  backgroundColor: Color(0xFF8BA94D),
                ),
            ],
          ),
    );
  }
}
