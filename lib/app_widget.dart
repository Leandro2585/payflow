import 'package:flutter/material.dart';
import 'package:payflow/ui/styles/index.dart';
import 'package:payflow/ui/pages/index.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Pay Flow',
        theme: ThemeData(
          primarySwatch: Colors.orange,
          primaryColor: AppColors.primary,
        ),
        initialRoute: '/splash',
        routes: {
          '/home': (context) => const HomeScreen(),
          '/login': (context) => const LoginScreen(),
          '/splash': (context) => const SplashScreen(),
          '/barcode_scanner': (context) => const BarcodeScannerScreen()
        });
  }
}
