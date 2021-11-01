import 'package:flutter/material.dart';

class FieldListWidget extends StatefulWidget {
  const FieldListWidget({Key? key}) : super(key: key);

  @override
  _FieldListWidgetState createState() => _FieldListWidgetState();
}

class _FieldListWidgetState extends State<FieldListWidget> {
  final List<String> entries = <String>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(8),
        children: const <Widget>[
          Card(
            child: ListTile(
              title: Text('Feld'),
              trailing: Icon(Icons.more_vert),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Feld 2'),
              trailing: Icon(Icons.more_vert),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
        backgroundColor: const Color.fromRGBO(139, 169, 77, 100),
      ),
    );
  }
}
