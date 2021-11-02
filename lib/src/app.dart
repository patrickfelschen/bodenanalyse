import 'package:bodenanalyse/src/screens/analysis_start_screen.dart';
import 'package:bodenanalyse/src/screens/edit_field_screen.dart';
import 'package:bodenanalyse/src/screens/field_details_screen.dart';
import 'package:bodenanalyse/src/screens/global_setting_screen.dart';
import 'package:bodenanalyse/src/screens/home_screen.dart';
import 'package:bodenanalyse/src/screens/login_screen.dart';
import 'package:bodenanalyse/src/screens/new_field_screen.dart';
import 'package:bodenanalyse/src/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      restorationScopeId: 'app',
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English, no country code
      ],
      onGenerateTitle: (BuildContext context) =>
          AppLocalizations.of(context)!.appTitle,
      //themeMode: ThemeMode.light,
      theme: ThemeData(
        fontFamily: "Poppins",
        colorScheme: ColorScheme.fromSwatch().copyWith(
            //brightness: Brightness.light,
            //primary: const Color(0xFF8BA94D),
            //background: const Color(0xFFF9F7F0),
            //secondary: const Color(0xFF773117),
            ),
      ),
      darkTheme: ThemeData.dark(),
      //initialRoute: LoginScreen.routeName,
      onGenerateRoute: (RouteSettings routeSettings) {
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) {
            switch (routeSettings.name) {
              case HomeScreen.routeName:
                return HomeScreen();
              case FieldDetailsScreen.routeName:
                return FieldDetailsScreen();
              case AnalysisStartScreen.routeName:
                return AnalysisStartScreen();
              case EditFieldScreen.routeName:
                return EditFieldScreen();
              case GlobalSettingsScreen.routeName:
                return GlobalSettingsScreen();
              case LoginScreen.routeName:
                return LoginScreen();
              case NewFieldScreen.routeName:
                return NewFieldScreen();
              case RegistrationScreen.routeName:
                return RegistrationScreen();
              default:
                return HomeScreen();
            }
          },
        );
      },
    );
  }
}
