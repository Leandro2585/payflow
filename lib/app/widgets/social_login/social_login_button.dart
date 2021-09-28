import 'package:flutter/cupertino.dart';
import 'package:payflow/app/themes/app_images.dart';
import 'package:payflow/app/themes/app_text_styles.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Image.asset(AppImages.google),
          Text('Entrar com Google', style: TextStyles.buttonGray)
        ],
      ),
    );
  }
}
