import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnalysisFlowWidget extends StatefulWidget {
  const AnalysisFlowWidget({
    Key? key,
    required this.analysisPageRoute,
  }) : super(key: key);

  final String analysisPageRoute;

  @override
  _AnalysisFlowWidgetState createState() => _AnalysisFlowWidgetState();
}

class _AnalysisFlowWidgetState extends State<AnalysisFlowWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildFlowAppBar(),
      body: SizedBox(),
    );
  }

  PreferredSizeWidget _buildFlowAppBar(){
    return AppBar(
      title: Text('Analyse Durchführen'),
    );
  }
}
