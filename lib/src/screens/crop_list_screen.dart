import 'package:bodenanalyse/src/widgets/crop_list_widget.dart';
import 'package:flutter/material.dart';

class CropListScreen extends StatelessWidget {
  const CropListScreen({Key? key}) : super(key: key);

  static const routeName = "/cropListScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kulturauswahl"),
      ),
      body: CropListWidget(),
    );
  }
}
