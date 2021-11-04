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

    Future<void> updateCrop(CropModel cropModel) async {
      CropModel newCrop = CropModel(
        id: cropModel.id,
        name: cropModel.name,
        favorite: !cropModel.favorite,
      );

      await _cropProvider.updateCrop(newCrop);
      await _cropProvider.loadAllCrops();
    }

    List<CropModel> sortedCrops = _cropProvider.getCrops();

    sortedCrops.sort((a, b) {
      if (b.favorite) {
        return 1;
      }
      return -1;
    });

    return ListView.separated(
      itemCount: _cropProvider.getCrops().length,
      itemBuilder: (context, index) {
        return CropItemWidget(
          cropModel: _cropProvider.getCrops()[index],
          onTap: () => updateCrop(_cropProvider.getCrops()[index]),
        );
      },
      separatorBuilder: (context, index) {
        return const Divider();
      },
    );
  }
}
