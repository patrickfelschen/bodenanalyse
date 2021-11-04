import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TutorialThirdWidget extends StatefulWidget {
  const TutorialThirdWidget({Key? key}) : super(key: key);

  @override
  _TutorialThirdWidgetState createState() => _TutorialThirdWidgetState();
}

class _TutorialThirdWidgetState extends State<TutorialThirdWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primary,
      child:
      Column(
        children: [
          SizedBox(height: 100),
          Padding(
            padding: EdgeInsets.only(top:100,left:15,right:15),
            child:
            RichText(
              text: const TextSpan(
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
                children: <TextSpan>[
                  TextSpan(text: 'Steche mit einem Spaten ein '),
                  TextSpan(
                      text: 'ziegelsteingroßes Erdstück ',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: 'von der Oberfläche aus.\n\nLasse es aus '),
                  TextSpan(
                      text: '1 m Höhe ',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: 'fallen.\n\n'),
                  TextSpan(
                      text: 'Wiederhole ',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: 'den Vorgang '),
                  TextSpan(
                      text: '2x ',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: 'mit Erdstücken aus anderen Tiefen.'),
                ],
              ),
            ),
           ),
          SizedBox(height: 10),
          Row(
            children: <Widget>[
              SizedBox(width: 30, height: 250),
              Expanded(
                  child: MaterialButton(
                    onPressed: () {},//todo: Verknüpfung zu jeweiligem Dialog
                    child: Text("Weiter"),
                    color: Colors.white,
                    textColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  )
              ),
              SizedBox(width: 30),
            ],
          ),
        ],
      ),
    );
  }
}
