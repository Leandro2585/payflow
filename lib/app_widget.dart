import 'package:flutter/material.dart';
import 'package:payflow/app/modules/index.dart';
import 'package:payflow/app/themes/index.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'PayFlow',
        theme: ThemeData(primaryColor: AppColors.primary),
        initialRoute: '/splash',
        routes: {
          '/splash': (context) => SplashScreen(),
          '/home': (context) => HomeScreen(),
          '/login': (context) => LoginScreen()
        });
  }
}
