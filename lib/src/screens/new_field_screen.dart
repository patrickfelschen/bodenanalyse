import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewFieldScreen extends StatefulWidget {
  const NewFieldScreen({Key? key}) : super(key: key);

  static const routeName = '/newFieldScreen';

  @override
  _NewFieldScreenState createState() => _NewFieldScreenState();
}

class _NewFieldScreenState extends State<NewFieldScreen> {
  final double _containerHeight = 50.0;

  final textController1 = TextEditingController();
  final textController2 = TextEditingController();

  @override
  void dispose() {
    textController1.dispose();
    textController2.dispose();
    super.dispose();
  }

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
                    children: <Widget >[
                      Text('Name: '),
                      Flexible(
                        child: TextField(controller: textController1,),
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
                      //todo: auf GoogleMaps verweisen?
                    ],
                  ),
                ),
                const Divider(),
                Container(
                  height: _containerHeight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget> [
                      Text('Bodenart des Oberbodens: '),
                      Flexible(
                        child: TextField(controller: textController2,),
                      ),
                    ],
                  ),
                ),
                const Divider(),


            ],
          ),

      floatingActionButton: saveButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

    );
  }
}

Widget saveButton(context){
  return SizedBox(
    width: 350,
    child:
    FloatingActionButton.extended(
      onPressed: (){},//todo: neues Feld anlegen
      label: const Text('Feld speichern', style: TextStyle(color: Colors.white),),
      backgroundColor: Theme.of(context).colorScheme.primary,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
      ),
    ),
  );
}

