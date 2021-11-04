import 'dart:async';

import 'package:bodenanalyse/src/models/field_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FieldCard extends StatelessWidget {
  final FieldModel fieldModel;
  final VoidCallback onTap;

  const FieldCard({Key? key, required this.fieldModel, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Completer<GoogleMapController> _controller = Completer();

    return Card(
        color: Theme.of(context).colorScheme.primary,
        child: ExpansionTile(
          leading: Image(
            image: AssetImage("assets/images/feld_icon_12.png"),
          ),
          iconColor: Theme.of(context).colorScheme.onPrimary,
          collapsedIconColor: Theme.of(context).colorScheme.onPrimary,
          childrenPadding: const EdgeInsets.only(left: 16.0, right: 16.0),
          title: Text(
            fieldModel.name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          children: <Widget>[
            Container(
              height: 400,
              width: double.infinity,
              child: GoogleMap(
                mapType: MapType.hybrid,
                initialCameraPosition: CameraPosition(
                    target: LatLng(fieldModel.lat, fieldModel.lng), zoom: 14.0),
                gestureRecognizers: Set()
                  ..add(Factory<PanGestureRecognizer>(
                      () => PanGestureRecognizer()))
                  ..add(Factory<VerticalDragGestureRecognizer>(
                      () => VerticalDragGestureRecognizer())),
                markers: Set()
                  ..add(Marker(
                      markerId: MarkerId('1'),
                      position: LatLng(fieldModel.lat, fieldModel.lng))),
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
                    'Adresse',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: 20,
                    ),
                  )
                ],
              ),
              ElevatedButton(
                onPressed: onTap,
                child: const Text('Öffnen'),
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ])
          ],
        ));
  }
}
