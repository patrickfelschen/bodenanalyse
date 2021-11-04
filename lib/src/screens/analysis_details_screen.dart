import 'package:bodenanalyse/src/providers/analysis_provider.dart';
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
    final AnalysisProvider _analysisProvider = Provider.of<AnalysisProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Auswertung'),

      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Text('Name der Kultur',
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
                        Text(_punkte),
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Text('Durchwurzelung des Bodens:'),
                        Text(_punkte),
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Text('Makroporen / Bioporen:'),
                        Text(_punkte),
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Text('Gefüge und Verfestigungen:'),
                        Text(_punkte),
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Text('Organische Reststoffe:'),
                        Text(_punkte),
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Text('Farbe und Geruch:'),
                        Text(_punkte),
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Gesamtergebnis:',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.bold)),
                        Text(_punkte),
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
                  child: Text('Fotos anzeigen', style: TextStyle(color: Theme.of(context).colorScheme.onSurface),),
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
                    primary: Theme.of(context).colorScheme.secondary,
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
