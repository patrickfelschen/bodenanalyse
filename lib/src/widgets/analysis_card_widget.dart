import 'package:flutter/material.dart';

class AnalysisCard extends StatelessWidget {
  final AssetImage analysisImage;
  final String text1;
  final String text2;
  final String text3;
  final String text4;
  final String text5;
  final bool badExample;

  AnalysisCard(
      {Key? key,
      required AssetImage this.analysisImage,
      required this.text1,
      required this.text2,
      required this.text3,
      required this.text4,
      required this.text5,
      required this.badExample})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    AlignmentGeometry cardAlignment;
    EdgeInsets cardMargin;

    Color cardColor;
    if (badExample) {
      cardAlignment = Alignment.centerLeft;
      cardMargin =
          EdgeInsets.only(left: MediaQuery.of(context).size.width / 20, top: 20);
      cardColor = Theme.of(context).colorScheme.secondary;
    } else {
      cardAlignment = Alignment.centerRight;
      cardMargin =
          EdgeInsets.only(right: MediaQuery.of(context).size.width / 20);
      cardColor = Theme.of(context).colorScheme.primary;
    }
    return Align(
        alignment: cardAlignment,
        child: Container(
          margin: cardMargin,
          width: MediaQuery.of(context).size.width/1.55,
          decoration: BoxDecoration(
              border: Border.all(width: 4, color: cardColor),
              borderRadius: BorderRadius.all(Radius.circular(4)),

          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 250,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: this.analysisImage,
                  fit: BoxFit.fill,
                )),
              ),
              Container(
                width: 250,
                height: 200,
                decoration: BoxDecoration(color: cardColor),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      text1,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(text2,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white)),
                    Text(text3,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white)),
                    Text(text4,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white)),
                    Text(text5,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white))
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
