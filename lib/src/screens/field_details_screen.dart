import 'package:bodenanalyse/src/screens/crop_list_screen.dart';
import 'package:bodenanalyse/src/screens/edit_field_screen.dart';
import 'package:easy_search/easy_search.dart';
import 'package:flutter/material.dart';

class FieldDetailsScreen extends StatefulWidget {
  const FieldDetailsScreen({Key? key}) : super(key: key);

  static const routeName = '/fieldDetailsScreen';

  @override
  _FieldDetailsScreenState createState() => _FieldDetailsScreenState();
}

class _FieldDetailsScreenState extends State<FieldDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Felddetails"), //todo: Name und ArtOberboden in Titel
        actions: [
          MaterialButton(
            child: Text(
              "Bearbeiten",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () {
              Navigator.pushNamed(context, EditFieldScreen.routeName);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 20),
            child: EasySearch(
              //von: https://pub.dev/packages/easy_search
              searchResultSettings: SearchResultSettings(
                padding: EdgeInsets.only(left: 8.0, top: 8.0, right: 8.0),
              ),
              controller: SearchItem(
                items: [
                  //todo: Liste der Bewertungen, die aus DB abgerufen wurde
                  /* Item(ModelExample(name: 'Tiago', age: 36), false),
                      Item(ModelExample(name: 'Mel', age: 3), false),
                      Item(ModelExample(name: 'Monique', age: 30), false),*/
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
                /* statische Programmierung, falls DB-Abfrage nicht funktioniert:
            //todo: Karten automatisch erzeugen mit Daten aus DB
            padding: const EdgeInsets.all(8),
            children: <Widget>[
              Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const ListTile(
                    leading: Icon(Icons.eco_sharp),
                    title: Text('Kartoffeln'),
                    subtitle: Text('13.03.2021 11:45'),
                    ),
                  ],
                ),
              ),
              Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const ListTile(
                      leading: Icon(Icons.eco_sharp),
                      title: Text('Kartoffeln'),
                      subtitle: Text('26.10.2020 09:23'),
                    ),
                  ],
                ),
              ),
              Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const ListTile(
                      leading: Icon(Icons.eco_sharp),
                      title: Text('Mais'),
                      subtitle: Text('09.06.2020 13:45'),
                    ),
                  ],
                ),
              ),
              Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const ListTile(
                      leading: Icon(Icons.eco_sharp),
                      title: Text('Kartoffeln'),
                      subtitle: Text('01.08.2019 21:52'),
                    ),
                  ],
                ),
              ),
            ],
            */
                ),
          ),
        ],
      ),
      floatingActionButton: startAnalysis(context),
    );
  }
}

Widget startAnalysis(context) {
  return SizedBox(
    width: 350,
    child: FloatingActionButton.extended(
      onPressed: () {
        Navigator.pushNamed(context, CropListScreen.routeName);
      },
      label: const Text(
        'Bewertung starten',
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Theme.of(context).colorScheme.secondary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}
