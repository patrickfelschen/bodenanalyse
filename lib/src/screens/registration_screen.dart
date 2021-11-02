//parts taken from: https://www.nintyzeros.com/2021/01/flutter-login-signup.html

import 'dart:ui';

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
      appBar: AppBar(
        toolbarHeight: 200,
        title:
            Text (
              "BODENGEFÜGE\nANALYSE",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
        ),
    body:
        Container(
            decoration: BoxDecoration(
            image: DecorationImage(
            image: AssetImage("/Users/skotelen/Desktop/Durchwurzelung_des_Bodens_Weizen_Minus_2.jpg"),
            fit: BoxFit.cover,
            ),),

          child: Column(
            children: [
              Column(
                children: [
                  Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 50,
                      ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 40
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
                    padding: EdgeInsets.symmetric(horizontal: 40,vertical: 50),
                    child: MaterialButton(
                        minWidth: 100,
                        height:60,
                        onPressed: (){},
                        color: Colors.blue,
                        child:
                          Text("REGISTRIEREN",style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 23,
                          ),),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      ),
                    ),
                ],
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
          fontWeight: FontWeight.bold,
          color: Colors.black87
      ),),
      SizedBox(height: 5,),
      TextField(
        obscureText: obsureText,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
          enabledBorder: OutlineInputBorder(

          ),
          border: OutlineInputBorder(
          ),
        ),
      ),
      SizedBox(height: 30,)

    ],

  );

}








    /*return Scaffold(
      appBar: AppBar(
        title: Text("Registrierung"),
      ),
      body:
        Text("Hallo"),
    );
  }
}*/
