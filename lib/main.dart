import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:components/src/routes/routes.dart';
import 'package:components/src/pages/alert_page.dart';
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        // ... app-specific localization delegate[s] here
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
       supportedLocales: [
        const Locale('en', 'US'), // English
        const Locale('es', 'ES'), // Spnish
        const Locale.fromSubtags(languageCode: 'zh'), // Chinese *See Advanced Locales below*
        // ... other locales the app supports
      ],
      title: 'Componentes App',
      debugShowCheckedModeBanner: false,
      //home: HomePage()
      initialRoute: '/',
      routes: getAplicationRoutes(),
      onGenerateRoute: (settings){
        // print('ruta llamada: ${settings.name}');
        return MaterialPageRoute(builder: (context)=> AlertPage());
      },
    );
  }
}