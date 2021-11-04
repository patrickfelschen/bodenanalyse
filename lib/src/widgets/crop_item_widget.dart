import 'package:bodenanalyse/src/models/crop_model.dart';
import 'package:bodenanalyse/src/providers/analysis_provider.dart';
import 'package:bodenanalyse/src/screens/analysis_start_screen.dart';
import 'package:bodenanalyse/src/screens/tutorial_decision_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CropItemWidget extends StatefulWidget {
  final CropModel cropModel;

  const CropItemWidget({Key? key, required this.cropModel}) : super(key: key);

  @override
  _CropItemWidgetState createState() => _CropItemWidgetState();
}

class _CropItemWidgetState extends State<CropItemWidget> {
  @override
  Widget build(BuildContext context) {
    AnalysisProvider _analysisProvider = Provider.of<AnalysisProvider>(context);
    bool selected = widget.cropModel.favorite;
    return ListTile(
      title: Text(widget.cropModel.name),
      onTap: () {
        Navigator.pushNamed(context, TutorialDecisionScreen.routeName);
        _analysisProvider.setCropName(widget.cropModel.name);
      },
      trailing: GestureDetector(
        child: Icon(selected ? Icons.star : Icons.star_border),
        onTap: () {
          if (selected == true) {
            selected = false;
          } else {
            selected = true;
          }
        },
      ),
    );
  }
}
