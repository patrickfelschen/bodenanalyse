import 'package:bodenanalyse/src/models/field_model.dart';
import 'package:bodenanalyse/src/models/soil_model.dart';
import 'package:bodenanalyse/src/screens/new_field_screen.dart';
import 'package:flutter/material.dart';

import 'field_card_widget.dart';

class FieldListWidget extends StatefulWidget {
  const FieldListWidget({Key? key}) : super(key: key);

  @override
  _FieldListWidgetState createState() => _FieldListWidgetState();
}

class _FieldListWidgetState extends State<FieldListWidget> {
  final List<String> entries = <String>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          FieldCard(
            fieldModel: FieldModel(
              id: 1,
              lat: 1.0,
              lng: 1.0,
              name: "name",
              soilModel: SoilModel(
                id: 0,
                name: "",
              ),
            ),
          ),
          FieldCard(
            fieldModel: FieldModel(
              id: 1,
              lat: 1.0,
              lng: 1.0,
              name: "name",
              soilModel: SoilModel(
                id: 0,
                name: "",
              ),
            ),
          ),
          FieldCard(
            fieldModel: FieldModel(
              id: 1,
              lat: 1.0,
              lng: 1.0,
              name: "name",
              soilModel: SoilModel(
                id: 0,
                name: "",
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, NewFieldScreen.routeName);
        },
        child: const Icon(Icons.add),
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}
