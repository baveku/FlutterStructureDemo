import 'package:flutter/material.dart';
import 'package:piano_dem_hat/app/localizations.dart';
import 'package:piano_dem_hat/screens/home/screen.dart';
import 'package:piano_dem_hat/utils/theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      
    ], child: this.app());
  }

  Widget app() {
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      theme: Themes.light,
      darkTheme: Themes.dark,
      supportedLocales: [Locale("en"), Locale("vi")],
      onGenerateTitle: (BuildContext context) =>
          AppLocalizations.of(context).title,
      home: HomeTabbarController(),
    );
  }
}
