import 'package:bodenanalyse/src/screens/home_screen.dart';
import 'package:bodenanalyse/src/screens/field_details_screen.dart';
import 'package:bodenanalyse/src/widgets/field_list_widget.dart';
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
                Flexible(
                  child: TextField(),
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
              Navigator.pushNamed(context, HomeScreen.routeName);
              //todo: Feld löschen
            },
            label: const Text('Feld löschen', style: TextStyle(color: Colors.white),),
            backgroundColor: Color(0xFF5E230B),
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
            backgroundColor: Color(0xFF8BA94D),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
            ),
          ),
        ),
      ]
  );
}

