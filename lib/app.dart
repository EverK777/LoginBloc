import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_bloc/src/styles/styles.dart';
import 'package:login_bloc/widgets/login_widget.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
        DefaultMaterialLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      theme: CupertinoThemeData(
          textTheme: CupertinoTextThemeData(
              navTitleTextStyle: Styles.AppBarTitle,
              textStyle: Styles.primaryTextStyle),
          brightness: Brightness.light),
      home: LoginScreen(),
    );
  }
}
