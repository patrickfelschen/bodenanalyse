import 'package:bodenanalyse/src/models/sample_model.dart';
import 'package:bodenanalyse/src/providers/field_provider.dart';
import 'package:bodenanalyse/src/widgets/sample_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'sample_card_widget.dart';

class SampleListWidget extends StatefulWidget {
  const SampleListWidget({Key? key}) : super(key: key);

  @override
  _SampleListWidgetState createState() => _SampleListWidgetState();
}

class _SampleListWidgetState extends State<SampleListWidget> {
  @override
  Widget build(BuildContext context) {
    final FieldProvider _fieldProvider = Provider.of<FieldProvider>(context);

    return ListView.builder(
        itemCount: _fieldProvider.getSamples().length,
        itemBuilder: (context, index) {
          SampleModel sampleModel = _fieldProvider.getSamples()[index];

          print(sampleModel);

          return SampleCardWidget(
            sampleModel: sampleModel,
          );
        });
  }
}
