import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:payflow/data/models/index.dart';
import 'package:payflow/ui/styles/index.dart';
import 'package:payflow/ui/pages/index.dart';

class AppWidget extends StatelessWidget {
  AppWidget({Key? key}) : super(key: key) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
  }

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
        '/home': (context) => HomeScreen(
            user: ModalRoute.of(context)!.settings.arguments as UserModel),
        '/login': (context) => const LoginScreen(),
        '/splash': (context) => const SplashScreen(),
        '/barcode_scanner': (context) => const BarcodeScannerScreen(),
        '/create_ticket': (context) => CreateTicketScreen(
              barcode: ModalRoute.of(context) != null
                  ? ModalRoute.of(context)!.settings.arguments.toString()
                  : null,
            )
      },
    );
  }
}
