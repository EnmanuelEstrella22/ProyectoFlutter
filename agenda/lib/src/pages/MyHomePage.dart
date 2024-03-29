import 'package:flutter/material.dart';

import 'HomePage.dart';
import 'ListEvent.dart';
import 'Login.dart';
import 'form/add_event.dart';

import 'package:flutter_localizations/flutter_localizations.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        // GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'), // English
        const Locale('es','ES'), // Hebrew
        const Locale.fromSubtags(
            languageCode: 'es'), // Chinese *See Advanced Locales below*
      ],
      initialRoute: '/',
        routes:{
        '/' : (BuildContext contex) => Login(),
        'Menu' : (BuildContext contex) => HomePage(),
        'FormEvent' : (BuildContext contex) => Eventos(),
        'ListadoEvent' : (BuildContext contex) => SchoolList()
      },

    );
  }
}