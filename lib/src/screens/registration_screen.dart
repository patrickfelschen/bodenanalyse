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
  final textController1 = TextEditingController();
  final textController2 = TextEditingController();
  final textController3 = TextEditingController();

  @override
  void dispose() {
    textController1.dispose();
    textController2.dispose();
    textController3.dispose();
    super.dispose();
  }

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
                padding: EdgeInsets.only(top: 60),
                child:
                Image.asset("assets/images/logoStart.png"),
              ),

                Padding(
                  padding: EdgeInsets.only(
                      left: 40,right:40,top:30
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("NAME",style:TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),),
                      SizedBox(height: 5,),
                      TextField(
                        controller: textController1,
                        obscureText: false,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
                          fillColor: Colors.white70 ,filled: true,
                        ),
                      ),
                      SizedBox(height: 30,),

                      Text("E-MAIL",style:TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),),
                      SizedBox(height: 5,),
                      TextField(
                        controller: textController2,
                        obscureText: false,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
                          fillColor: Colors.white70 ,filled: true,
                        ),
                      ),
                      SizedBox(height: 30,),

                      Text("PASSWORT",style:TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),),
                      SizedBox(height: 5,),
                      TextField(
                        controller: textController3,
                        obscureText: true,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
                          fillColor: Colors.white70 ,filled: true,
                        ),
                      ),
                      SizedBox(height: 30,)
                    ],
                  ),
                ),

                Flexible(
                  child: MaterialButton(
                      minWidth: 200,
                      height:60,
                    onPressed: (){
                      //todo: hier checken, ob Daten schon registriert, wenn nein -> Navigator.push
                      Navigator.pushNamed(context, HomeScreen.routeName);
                    },
                      color: Theme.of(context).colorScheme.primary,
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

              Flexible(
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
