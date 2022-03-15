
import 'package:flutter/material.dart';
import 'package:payflow/ui/components/index.dart';
import 'package:payflow/ui/pages/index.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pay Flow',
      theme: ThemeData(
        primaryColor: AppColors.primary,
      ),
      home: const SplashScreen(),
    );
  }
}