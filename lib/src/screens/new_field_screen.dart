import 'package:bodenanalyse/src/models/field_model.dart';
import 'package:bodenanalyse/src/models/soil_model.dart';
import 'package:bodenanalyse/src/providers/field_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    final FieldProvider _fieldProvider = Provider.of<FieldProvider>(context);

    textController2.text = _fieldProvider.getSelectedSoilModel().name;

    Future<void> createField() async {
      await _fieldProvider.createField(
        FieldModel(
          id: 0,
          lat: 1.0,
          lng: 2.0,
          name: textController1.text.trim(),
          soilModel: _fieldProvider.getSelectedSoilModel(),
        ),
      );

      _fieldProvider.loadAllFields();

      Navigator.pop(context);
    }

    void selectSoil() {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return ListView.separated(
            itemBuilder: (context, index) {
              SoilModel soil = _fieldProvider.getSoils()[index];

              return ListTile(
                title: Text(soil.name),
                onTap: () {
                  _fieldProvider.setSelectedSoilModel(soil);
                  Navigator.pop(context);
                },
              );
            },
            separatorBuilder: (context, index) {
              return Divider();
            },
            itemCount: _fieldProvider.getSoils().length,
          );
        },
      );
    }

    Widget saveButton(context) {
      return SizedBox(
        width: 350,
        child: FloatingActionButton.extended(
          onPressed: () => createField(),
          label: const Text(
            'Feld speichern',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Theme.of(context).colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Feld hinzufügen"),
      ),
      body: ListView(
        padding: EdgeInsets.only(
          top: 8,
          left: 8,
          right: 8,
          bottom: 200,
        ),
        children: <Widget>[
          Container(
            height: _containerHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Name: '),
                Flexible(
                  child: TextField(
                    controller: textController1,
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          Container(
            height: _containerHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Text('Standort: '),
                Text(
                  'Wird automatisch ermittelt',
                  style: TextStyle(color: Colors.grey),
                )
                //todo: auf GoogleMaps verweisen?
              ],
            ),
          ),
          const Divider(),
          Container(
            height: _containerHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Bodenart des Oberbodens: '),
                Flexible(
                  child: TextField(
                    onTap: () => selectSoil(),
                    controller: textController2,
                    readOnly: true,
                  ),
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
