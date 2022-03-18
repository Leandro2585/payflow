import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:payflow/data/models/index.dart';
import 'package:payflow/data/services/index.dart';

class AuthenticateController {
  final authService = AuthenticationService();

  Future<void> googleSignIn(BuildContext context) async {
    try {
      final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
      final authResponse = await _googleSignIn.signIn();
      final user = UserModel(name: authResponse!.displayName!, avatar: authResponse.photoUrl);
      authService.setUser(context, user);
      print(authResponse);
    } catch (error) {
      print(error);
    }
  }

  Future<void> checkIsAuthenticated(BuildContext context) async {
    authService.currentUser(context);
  }
}