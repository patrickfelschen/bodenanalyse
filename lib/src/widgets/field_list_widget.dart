import 'package:bodenanalyse/src/models/field_model.dart';
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
              userId: '',
              name: '',
            ),
          ),
          FieldCard(
            fieldModel: FieldModel(
              id: 2,
              userId: '',
              name: '',
            ),
          ),
          FieldCard(
            fieldModel: FieldModel(
              id: 3,
              userId: '',
              name: '',
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, NewFieldScreen.routeName);
        },
        child: const Icon(Icons.add),
        backgroundColor: const Color(0xFF8BA94D),
      ),
    );
  }
}
