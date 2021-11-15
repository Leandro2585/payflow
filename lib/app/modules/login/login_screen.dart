import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payflow/app/modules/index.dart';
import 'package:payflow/app/themes/index.dart';
import 'package:payflow/app/widgets/index.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final controller = LoginController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(children: [
          Container(
            color: AppColors.primary,
            width: size.width,
            height: size.height * 0.36,
          ),
          Positioned(
            top: 50,
            child: Image.asset(
              AppImages.person,
              width: 208,
              height: 300,
            ),
          ),
          Positioned(
            bottom: size.height * 0.18,
            left: 0,
            right: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(AppImages.logoMini),
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 70, right: 70),
                  child: Text(
                    'Organize suas contas em um só lugar',
                    textAlign: TextAlign.center,
                    style: TextStyles.titleHome,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40, top: 40),
                  child: SocialLoginButtonWidget(onTap: () {
                    controller.googleAuth(context);
                  }),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
