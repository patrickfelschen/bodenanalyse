import 'package:bodenanalyse/src/models/crop_model.dart';
import 'package:bodenanalyse/src/providers/crop_provider.dart';
import 'package:bodenanalyse/src/widgets/crop_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CropListWidget extends StatefulWidget {
  const CropListWidget({Key? key}) : super(key: key);

  @override
  _CropListWidgetState createState() => _CropListWidgetState();
}

class _CropListWidgetState extends State<CropListWidget> {
  @override
  Widget build(BuildContext context) {
    final CropProvider _cropProvider = Provider.of<CropProvider>(context);

    return FutureBuilder<List<CropModel>>(
      future: _cropProvider.getAllCrops(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (snapshot.hasData) {
          List<CropModel> crops = snapshot.data;

          return ListView.separated(
            itemCount: crops.length,
            itemBuilder: (context, index) {
              return CropItemWidget(
                cropModel: crops[index],
              );
            },
            separatorBuilder: (context, index) {
              return const Divider();
            },
          );
        }

        return const Center(
          child: Text("Leer"),
        );
      },
    );
  }
}
