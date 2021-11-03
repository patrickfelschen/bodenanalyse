import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CultureFavoritesScreen extends StatefulWidget {
  const CultureFavoritesScreen({Key? key}) : super(key: key);

  static const routeName = "/cultureFavoritesScreen";

  @override
  _CultureFavoritesScreenState createState() => _CultureFavoritesScreenState();
}

class _CultureFavoritesScreenState extends State<CultureFavoritesScreen> {
  final double _padding = 8.0;
  final double _containerHeight = 50.0;
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kulturfavoriten"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: _containerHeight,
            // TODO: add search bar
            child: Text('Searchbar'),
          ),
          Expanded(
            child: ListView(
              /*padding: EdgeInsets.all(_padding),
              children: <Widget>[
                Container(
                  height: _containerHeight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text('Frucht 1'),
                      GestureDetector(
                        child: IconButton(
                          icon: Icon(selected ? Icons.star: Icons.star_border),
                          onPressed: () {
                            setState(() {
                              if(selected){
                                selected = false;
                              }else{
                                selected = true;
                              }
                            });
                          },
                        ),
                        onTap: () {
                          setState(() {

                          });
                          // TODO: change icon and set data
                        },
                      ),
                    ],
                  ),
                )
              ],*/
            ),
          ),
        ],
      ),
    );
  }
}
