import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:payflow/app/context/index.dart';

class LoginController {
  final authController = AuthController();
  Future<void> googleAuth(BuildContext context) async {
    GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
    try {
      final response = await _googleSignIn.signIn();
      authController.setUser(context, response);
      print(response);
    } catch (error) {
      authController.setUser(context, null);
      print(error);
    }
  }
}
