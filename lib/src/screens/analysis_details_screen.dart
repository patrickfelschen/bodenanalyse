import 'package:bodenanalyse/src/models/property_model.dart';
import 'package:bodenanalyse/src/models/sample_model.dart';
import 'package:bodenanalyse/src/providers/analysis_provider.dart';
import 'package:bodenanalyse/src/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnalysisDetailsScreen extends StatefulWidget {
  const AnalysisDetailsScreen({Key? key}) : super(key: key);

  static const routeName = "/analysisDetailsScreen";

  @override
  _AnalysisDetailsScreenState createState() => _AnalysisDetailsScreenState();
}

class _AnalysisDetailsScreenState extends State<AnalysisDetailsScreen> {
  // TODO: import actual data
  final String _punkte = '+1';


  @override
  Widget build(BuildContext context) {
    final AnalysisProvider _analysisProvider =
    Provider.of<AnalysisProvider>(context);
    final List<PropertyModel> _properties = _analysisProvider.getPropertyList();

    int overallRating() {
      int rating = 0;
      _properties.forEach((element) {
        rating += element.rating;
      });
      return rating;
    }

    void saveSample() {
      _analysisProvider.setLng(8.02236695003242);
      _analysisProvider.setLat(52.285056295554796);
      _analysisProvider.setDateTime(DateTime.now());
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Auswertung'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
            _analysisProvider.getPropertyList().removeLast();
          },
        ),
        actions: [
          IconButton(icon: Icon(Icons.save), onPressed: () {
            saveSample();
            Navigator.pushNamed(context, HomeScreen.routeName);
          })
        ],
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Text(
                _analysisProvider
                    .getCropModel()
                    .name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
              ),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Text('Struktur der Oberfläche:'),
                        Text(_properties
                            .elementAt(0)
                            .rating
                            .toString()),
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Text('Durchwurzelung des Bodens:'),
                        Text(_properties
                            .elementAt(1)
                            .rating
                            .toString()),
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Text('Makroporen / Bioporen:'),
                        Text(_properties
                            .elementAt(2)
                            .rating
                            .toString()),
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Text('Gefüge und Verfestigungen:'),
                        Text(_properties
                            .elementAt(3)
                            .rating
                            .toString()),
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Text('Organische Reststoffe:'),
                        Text(_properties
                            .elementAt(4)
                            .rating
                            .toString()),
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Text('Farbe und Geruch:'),
                        Text(_properties
                            .elementAt(5)
                            .rating
                            .toString()),
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Gesamtergebnis:',
                            style: TextStyle(
                                color: Theme
                                    .of(context)
                                    .colorScheme
                                    .primary,
                                fontWeight: FontWeight.bold)),
                        Text(
                          overallRating().toString(),
                          style: TextStyle(
                              color: Theme
                                  .of(context)
                                  .colorScheme
                                  .primary,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: show photos
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(400, 40),
                    primary: Colors.white,
                  ),
                  child: Text(
                    'Fotos anzeigen',
                    style: TextStyle(
                        color: Theme
                            .of(context)
                            .colorScheme
                            .onSurface),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: delete page, navigate back
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(400, 40),
                    primary: Theme
                        .of(context)
                        .colorScheme
                        .secondary,
                  ),
                  child: Text('Bewertung löschen'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
