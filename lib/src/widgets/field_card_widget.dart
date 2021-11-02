import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:bodenanalyse/src/models/field_model.dart';
import 'package:flutter/material.dart';

class FieldCard extends StatelessWidget {
  final FieldModel fieldModel;

  const FieldCard({Key? key, required this.fieldModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Completer<GoogleMapController> _controller = Completer();

    return Card(
        child: ExpansionTile(
      childrenPadding: EdgeInsets.only(left: 16.0, right: 16.0),
      title: Text('Feld 1'),
      children: <Widget>[
        Container(
          height: 200,
          width: double.infinity,
          child: GoogleMap(
            mapType: MapType.hybrid,
            initialCameraPosition: CameraPosition(
                target: LatLng(37.42796133580664, -122.085749655962)),
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Feld 1',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                'Adresse',
                style: const TextStyle(fontSize: 12),
              )
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('Öffnen'),
            style: ElevatedButton.styleFrom(primary: const Color(0xFF773117)),
          ),
        ])
      ],
    ));
  }
}
