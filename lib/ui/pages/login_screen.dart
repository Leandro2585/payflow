import 'package:flutter/material.dart';
import 'package:payflow/ui/widgets/index.dart';
import 'package:payflow/ui/styles/index.dart';
import 'package:payflow/application/controllers/index.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final authController = AuthenticateController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
                width: size.width,
                height: size.height * 0.36,
                color: AppColors.primary),
            Positioned(
              top: 40,
              left: 0,
              right: 0,
              child: Image.asset(AppImages.person, width: 208, height: 310),
            ),
            Positioned(
              bottom: size.height * 0.05,
              left: 0,
              right: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(AppImages.logomini),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 70, right: 70, top: 30),
                    child: Text("Organize seus boletos em um só lugar",
                        textAlign: TextAlign.center,
                        style: TextStyles.titleHome),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 40, right: 40, top: 40),
                    child: SocialLoginButton(onTap: () {
                      authController.googleSignIn(context);
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
