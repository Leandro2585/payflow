import 'package:flutter/material.dart';
import 'package:payflow/ui/components/index.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}): super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Container(
            width: size.width,
            height: size.height * 0.36,
            color: AppColors.primary
          ),
          Positioned(
            top: 40,
            left: 0, 
            right: 0, 
            child: Image.asset(AppImages.person, width: 208, height: 300),
          ),
          Positioned(
            bottom: size.height * 0.1, left: 0, right: 0, 
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [Image.asset(AppImages.logomini)],
            ),
          ),
        ],
      ),
    );
  }
}