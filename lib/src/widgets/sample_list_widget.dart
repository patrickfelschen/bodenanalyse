import 'package:bodenanalyse/src/models/sample_model.dart';
import 'package:bodenanalyse/src/widgets/sample_card_widget.dart';
import 'package:flutter/material.dart';

import 'sample_card_widget.dart';

class SampleListWidget extends StatefulWidget {
  const SampleListWidget({Key? key}) : super(key: key);

  @override
  _SampleListWidgetState createState() => _SampleListWidgetState();
}

class _SampleListWidgetState extends State<SampleListWidget> {
  final List<SampleModel> items = <SampleModel>[];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return SampleCardWidget(
              sampleModel: SampleModel(
            id: items[index].id,
            datetime: items[index].datetime,
            lng: items[index].lng,
            lat: items[index].lat,
            soilModel: items[index].soilModel,
            cropModel: items[index].cropModel,
            properties: items[index].properties,
          ));
        }
    );
  }
}

