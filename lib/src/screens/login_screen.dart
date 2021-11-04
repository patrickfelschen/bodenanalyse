import 'package:bodenanalyse/src/providers/auth_provider.dart';
import 'package:bodenanalyse/src/screens/home_screen.dart';
import 'package:bodenanalyse/src/screens/registration_screen.dart';
import 'package:bodenanalyse/src/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const routeName = '/loginScreen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final textController1 = TextEditingController();
  final textController2 = TextEditingController();

  @override
  void dispose() {
    textController1.dispose();
    textController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider _authProvider = Provider.of<AuthProvider>(context);

    void _showSnackbar(String s) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(s),
        ),
      );
    }

    Future<void> signIn() async {
      String email = textController1.text.trim();
      String password = textController2.text.trim();

      if (email.isEmpty) {
        _showSnackbar("E-Mail eingeben!");
      }

      if (password.isEmpty) {
        _showSnackbar("Passwort eingeben!");
      }

      await _authProvider.signIn(
        email: email,
        password: password,
      );

      Navigator.pushNamed(context, SplashScreen.routeName);
    }

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/start.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Image.asset("assets/images/logoStart.png"),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 60,
                right: 60,
                top: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "E-MAIL",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextField(
                    controller: textController1,
                    obscureText: false,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      fillColor: Colors.white70,
                      filled: true,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "PASSWORT",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextField(
                    controller: textController2,
                    obscureText: true,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      fillColor: Colors.white70,
                      filled: true,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 100,right:100,top: 10,bottom: 20),
              child: MaterialButton(
                minWidth: 200,
                height: 60,
                onPressed: () => signIn(),
                color: Theme.of(context).colorScheme.primary,
                child: Text(
                  "LOGIN",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                  ),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            Flexible(
              child: MaterialButton(
                onPressed: () {
                  Navigator.pushNamed(context, RegistrationScreen.routeName);
                },
                child: Text(
                  "REGISTRIEREN",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                  ),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
