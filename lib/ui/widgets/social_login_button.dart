import 'package:flutter/material.dart';
import 'package:payflow/ui/components/index.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Image.asset(AppImages.google),
      Text("Entrar com Google", style: TextStyles.buttonGray)
    ]);
  }
}