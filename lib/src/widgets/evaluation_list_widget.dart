import 'package:bodenanalyse/src/models/sample_model.dart';
import 'package:bodenanalyse/src/widgets/evaluation_card_widget.dart';
import 'package:flutter/material.dart';

import 'evaluation_card_widget.dart';

class EvaluationListWidget extends StatefulWidget {
  const EvaluationListWidget({Key? key}) : super(key: key);

  @override
  _EvaluationListWidgetState createState() => _EvaluationListWidgetState();
}

class _EvaluationListWidgetState extends State<EvaluationListWidget> {
  final List<SampleModel> items = <SampleModel>[];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return EvaluationCard(
              sampleModel: SampleModel(
                id: items[index].id,
                datetime: items[index].datetime,
                lng: items[index].lng,
                lat: items[index].lat,
                soilModel: items[index].soilModel,
                cropModel: items[index].cropModel,
                properties: items[index].properties,
              )
          );
        }
    );
  }
}

