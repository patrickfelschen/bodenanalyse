import 'package:bodenanalyse/src/models/crop_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CultureItem extends StatelessWidget {
  final CropModel cropModel;

  const CultureItem({Key? key, required this.cropModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool selected = cropModel.favorite;
    return Column(//todo: vllt auch ohne Column und ohne Divider, wenn es hässlich ist
        children: [
          Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(cropModel.type),
                GestureDetector(
                  child: IconButton(
                    icon: Icon(selected ? Icons.star: Icons.star_border),
                    onPressed: () {//todo: Favoriten in DB & icon ändern
                      /*setState(() {
                        if(selected==true){
                          selected = false;
                        }else{
                          selected = true;
                        }
                      });*/
                    },
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
        ],
    );
  }
}
