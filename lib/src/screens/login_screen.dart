import 'package:bodenanalyse/src/screens/home_screen.dart';
import 'package:bodenanalyse/src/screens/registration_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const routeName = '/loginScreen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                    left: 40,right:40,top:40
                ),
                child: Column(
                  children: [
                    input(label: "E-MAIL"),
                    input(label: "PASSWORT",obsureText: true)
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.only(bottom:40),
                child: MaterialButton(
                  minWidth: 200,
                  height:60,
                  onPressed: () {
                    //todo: hier checken, ob Anmeldedaten stimmen, wenn ja -> Navigator.push
                    Navigator.pushNamed(context, HomeScreen.routeName);
                  },
                  color: Color(0xFF8BA94D),
                  child:
                  Text("LOGIN",style: TextStyle(
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
                  onPressed: () {
                    Navigator.pushNamed(context, RegistrationScreen.routeName);
                    },
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
