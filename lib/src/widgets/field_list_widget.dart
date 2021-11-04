import 'package:bodenanalyse/src/models/field_model.dart';
import 'package:bodenanalyse/src/providers/field_provider.dart';
import 'package:bodenanalyse/src/screens/field_details_screen.dart';
import 'package:bodenanalyse/src/screens/new_field_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    final FieldProvider _fieldProvider = Provider.of<FieldProvider>(context);

    //_fieldProvider.loadAllFields();

    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: _fieldProvider.getFields().length,
        itemBuilder: (context, index) {
          FieldModel fieldModel = _fieldProvider.getFields()[index];

          return FieldCard(
            fieldModel: fieldModel,
            onTap: () {
              _fieldProvider.setSelectedFieldModel(fieldModel);
              _fieldProvider.loadAllSamples();
              Navigator.pushNamed(context, FieldDetailsScreen.routeName);
            },
          );
        },
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
