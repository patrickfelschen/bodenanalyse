import 'dart:async';

import 'package:bodenanalyse/src/models/field_model.dart';
import 'package:bodenanalyse/src/screens/field_details_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FieldCard extends StatelessWidget {
  final FieldModel fieldModel;

  const FieldCard({Key? key, required this.fieldModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Completer<GoogleMapController> _controller = Completer();

    return Card(
        color: Theme.of(context).colorScheme.primary,
        child: ExpansionTile(
          leading: Image(image: AssetImage("assets/images/feld_icon_12.png"),
          ),
          iconColor: Theme.of(context).colorScheme.onPrimary,
          collapsedIconColor: Theme.of(context).colorScheme.onPrimary,
          childrenPadding: const EdgeInsets.only(left: 16.0, right: 16.0),
          title: Text(
            'Feld 1',
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
                    target: LatLng(37.42796133580664, -122.085749655962),
                    zoom: 14.0),
                gestureRecognizers: Set()
                  ..add(Factory<PanGestureRecognizer>(
                      () => PanGestureRecognizer()))
                  ..add(Factory<VerticalDragGestureRecognizer>(
                      () => VerticalDragGestureRecognizer())),
                markers: Set()
                  ..add(Marker(
                      markerId: MarkerId('1'),
                      position: LatLng(37.42796133580664, -122.085749655962))),
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
                onPressed: () {
                  Navigator.pushNamed(context, FieldDetailsScreen.routeName);
                },
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
