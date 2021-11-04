import 'package:bodenanalyse/src/models/crop_model.dart';
import 'package:bodenanalyse/src/models/sample_model.dart';
import 'package:bodenanalyse/src/widgets/culture_item_widget.dart';
import 'package:bodenanalyse/src/widgets/evaluation_card_widget.dart';
import 'package:flutter/material.dart';

import 'evaluation_card_widget.dart';

class CultureListWidget extends StatefulWidget {
  const CultureListWidget({Key? key}) : super(key: key);

  @override
  _CultureListWidgetState createState() => _CultureListWidgetState();
}

class _CultureListWidgetState extends State<CultureListWidget> {
  final List<CropModel> items = <CropModel>[];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return CultureItemWidget(
              cropModel: CropModel(
                id: items[index].id,
                type: items[index].type,
                favorite: items[index].favorite,
              )
          );
        }
    );
  }
}