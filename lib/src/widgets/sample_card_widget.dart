import 'package:bodenanalyse/src/models/sample_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SampleCardWidget extends StatelessWidget {
  final SampleModel sampleModel;

  const SampleCardWidget({Key? key, required this.sampleModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.eco_sharp),
            title: Text(sampleModel.cropModel.name),
            subtitle: Text(
                DateFormat('dd.MM.yyyy kk:mm').format(sampleModel.datetime)),
          ),
        ],
      ),
    );
  }
}
