import 'package:flutter/material.dart';
import 'package:payflow/app/screens/splash_screen.dart';
import 'package:payflow/app/themes/app_colors.dart';

void main() {
  runApp(AppWidget());
}

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PayFlow',
      theme: ThemeData(primaryColor: AppColors.primary),
      home: SplashScreen(),
    );
  }
}
