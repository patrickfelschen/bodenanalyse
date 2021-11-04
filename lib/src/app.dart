import 'package:bodenanalyse/src/providers/analysis_provider.dart';
import 'package:bodenanalyse/src/providers/auth_provider.dart';
import 'package:bodenanalyse/src/providers/crop_provider.dart';
import 'package:bodenanalyse/src/providers/field_provider.dart';
import 'package:bodenanalyse/src/screens/analysis_start_screen.dart';
import 'package:bodenanalyse/src/screens/crop_list_screen.dart';
import 'package:bodenanalyse/src/screens/culture_favorites_screen.dart';
import 'package:bodenanalyse/src/screens/edit_field_screen.dart';
import 'package:bodenanalyse/src/screens/field_details_screen.dart';
import 'package:bodenanalyse/src/screens/global_settings_screen.dart';
import 'package:bodenanalyse/src/screens/home_screen.dart';
import 'package:bodenanalyse/src/screens/login_screen.dart';
import 'package:bodenanalyse/src/screens/new_field_screen.dart';
import 'package:bodenanalyse/src/screens/profile_screen.dart';
import 'package:bodenanalyse/src/screens/registration_screen.dart';
import 'package:bodenanalyse/src/screens/splash_screen.dart';
import 'package:bodenanalyse/src/widgets/tutorial_material_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const _primaryColor = Color(0xFF8BA94D);
    const _secondaryColor = Color(0xFF773117);
    const _scaffoldColor = Color(0xFFF9F7F0);
    const _menuColor = Color(0xFFC4C4C4);
    const _textColor = Color(0xFF141414);

    Color _getTrackColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.selected,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return _primaryColor;
      }
      return Colors.grey;
    }

    ThemeData _theme = ThemeData(
      colorScheme: ColorScheme.fromSwatch().copyWith(
        brightness: Brightness.light,
        primary: _primaryColor,
        secondary: _secondaryColor,
        // Menühintergrund
        background: _menuColor,
        // Textfarbe
        onSurface: _textColor,
      ),
      appBarTheme: const AppBarTheme(
        centerTitle: true,
      ),
      fontFamily: "Poppins",
      primaryTextTheme: const TextTheme().apply(
        bodyColor: _textColor,
        displayColor: _textColor,
      ),
      primaryColor: _primaryColor,
      scaffoldBackgroundColor: _scaffoldColor,
      switchTheme: SwitchThemeData(
        trackColor: MaterialStateProperty.resolveWith(
          _getTrackColor,
        ),
        thumbColor: MaterialStateProperty.all(
          Colors.white,
        ),
      ),
    );

    Route<dynamic> _onGenerateRoute(RouteSettings routeSettings) {
      return MaterialPageRoute<void>(
        settings: routeSettings,
        builder: (BuildContext context) {
          switch (routeSettings.name) {
            case SplashScreen.routeName:
              return const SplashScreen();
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
            case CultureFavoritesScreen.routeName:
              return CultureFavoritesScreen();
            case ProfileScreen.routeName:
              return ProfileScreen();
            case CropListScreen.routeName:
              return CropListScreen();
            default:
              return HomeScreen();
          }
        },
      );
    }

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => CropProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => AnalysisProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => FieldProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        restorationScopeId: 'app',
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''), // English, no country code
          Locale('de', 'DE'),
        ],
        themeMode: ThemeMode.light,
        theme: _theme,
        // Debug Option
        // initialRoute: AnalysisStartScreen.routeName,
        onGenerateRoute: _onGenerateRoute,
      ),
    );
  }
}
