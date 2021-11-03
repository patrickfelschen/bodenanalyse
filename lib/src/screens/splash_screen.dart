import 'package:bodenanalyse/src/providers/auth_provider.dart';
import 'package:bodenanalyse/src/screens/home_screen.dart';
import 'package:bodenanalyse/src/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static const routeName = "/";

  @override
  Widget build(BuildContext context) {
    AuthProvider _authProvider = Provider.of<AuthProvider>(context);

    return FutureBuilder(
        future: _authProvider.refreshCurrentUser(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }

          if (snapshot.connectionState == ConnectionState.done) {
            if (_authProvider.loggedIn) {
              return HomeScreen();
            }
          }

          return LoginScreen();
        });
  }
}
