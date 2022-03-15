import 'package:flutter/material.dart';
import 'package:payflow/ui/components/index.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Center(child: Image.asset(AppImages.union)),
          Center(child: Image.asset(AppImages.logoFull)),
        ]
      ),
    );
  }
}