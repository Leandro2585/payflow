import 'package:flutter/material.dart';
import 'package:payflow/app/screens/index.dart';
import 'package:payflow/app/themes/app_colors.dart';

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
