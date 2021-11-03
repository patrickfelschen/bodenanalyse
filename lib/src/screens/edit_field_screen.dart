import 'package:bodenanalyse/src/screens/home_screen.dart';
import 'package:bodenanalyse/src/screens/field_details_screen.dart';
import 'package:flutter/material.dart';


class EditFieldScreen extends StatefulWidget {
  const EditFieldScreen({Key? key}) : super(key: key);

  static const routeName = '/editFieldScreen';

  @override
  _EditFieldScreenState createState() => _EditFieldScreenState();
}

class _EditFieldScreenState extends State<EditFieldScreen> {
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
        title: Text("Feld bearbeiten"),
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

      floatingActionButton: buttons(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

    );
  }
}


Widget buttons(BuildContext context){
  return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
          SizedBox(
          width: 350,
          child:
          FloatingActionButton.extended(
            onPressed: (){
              showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                title: const Text('Löschen'),
                content: const Text('Wollen Sie das Feld wirklich löschen?'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text('Abbrechen'),
                  ),
                  TextButton(
                    onPressed: () {Navigator.pushNamed(context, HomeScreen.routeName);
                      //todo: Feld löschen
                    },
                    child: const Text('Löschen', style: TextStyle(color: Colors.red),),
                  ),
                ],
              ),
              );
            },
            label: const Text('Feld löschen', style: TextStyle(color: Colors.white),),
            backgroundColor: Theme.of(context).colorScheme.secondary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
            ),
          ),
        ),

        SizedBox(
          height: 10,
        ),

        SizedBox(
          width: 350,
          child:
          FloatingActionButton.extended(
            onPressed: (){
              Navigator.pushNamed(context, FieldDetailsScreen.routeName);
              //todo: neues Feld anlegen
            },
            label: const Text('Feld speichern', style: TextStyle(color: Colors.white),),
            backgroundColor: Theme.of(context).colorScheme.primary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
            ),
          ),
        ),
      ]
  );
}

