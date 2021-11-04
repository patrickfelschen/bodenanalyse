import 'package:bodenanalyse/src/models/crop_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CultureItemWidget extends StatefulWidget {
  final CropModel cropModel;
  const CultureItemWidget({Key? key, required this.cropModel}) : super(key: key);

  @override
  _CultureItemWidgetState createState() => _CultureItemWidgetState();
}

class _CultureItemWidgetState extends State<CultureItemWidget> {

  @override
  Widget build(BuildContext context) {
    bool selected = widget.cropModel.favorite;
    return Column(
        children: [
          Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(widget.cropModel.type),
                GestureDetector(
                  child: IconButton(
                    icon: Icon(selected ? Icons.star: Icons.star_border),
                    onPressed: () {//todo: Favoriten in DB
                      setState(() {
                        if(selected==true){
                          selected = false;
                        }else{
                          selected = true;
                        }
                      });
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
