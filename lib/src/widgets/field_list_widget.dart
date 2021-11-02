import 'package:bodenanalyse/src/models/field_model.dart';
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
        padding: EdgeInsets.all(8),
        children: <Widget>[
          FieldCard(
            fieldModel: FieldModel(id: '', userId: '', name: ''),
          ),
          FieldCard(
            fieldModel: FieldModel(id: '', userId: '', name: ''),
          ),
          FieldCard(
            fieldModel: FieldModel(id: '', userId: '', name: ''),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
        backgroundColor: const Color.fromRGBO(139, 169, 77, 100),
      ),
    );
  }
}
