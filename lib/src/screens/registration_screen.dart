import 'dart:ui';

import 'package:bodenanalyse/src/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  static const routeName = '/registrationScreen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body:
        Container(
            decoration: BoxDecoration(
            image: DecorationImage(
            image: AssetImage("assets/images/start.png"),
              fit: BoxFit.cover,
            ),),

          child: Column(
            children: [
                Padding(
                    padding: EdgeInsets.only(
                      top: 130,bottom: 30
                    ),
                  child:
                    Text (
                      "BODENGEFÜGE\nANALYSE",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                      ),
                    ),
                  ),

                Padding(
                  padding: EdgeInsets.only(
                      left: 40,right:40,top:70
                  ),
                  child: Column(
                    children: [
                      input(label: "NAME"),
                      input(label: "E-MAIL"),
                      input(label: "PASSWORT",obsureText: true)
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(40),
                  child: MaterialButton(
                      minWidth: 200,
                      height:60,
                    onPressed: (){
                      //todo: hier checken, ob Daten schon registriert, wenn nein -> Navigator.push
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                      color: Color(0xFF8BA94D),
                      child:
                        Text("REGISTRIEREN",style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                        ),),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    ),
                  ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: MaterialButton(
                  minWidth: 200,
                  height:60,
                  onPressed: (){Navigator.pop(context);},
                  //color: Color(0xFF8BA94D),
                  child:
                  Text("zurück",style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                  ),),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                ),
              ),
              ],
            ),
        ),
      );

  }

}


Widget input({label,obsureText = false}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label,style:TextStyle(
          fontSize: 20,
        color: Colors.white,
      ),),
      SizedBox(height: 5,),
      TextField(
        obscureText: obsureText,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
          fillColor: Colors.white70 ,filled: true,
        ),
      ),
      SizedBox(height: 30,)

    ],

  );

}
