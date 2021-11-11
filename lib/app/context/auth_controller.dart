import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthController {
  var _isAuthenticated = false;
  var _user;

  get user => _user;

  void setUser(BuildContext context, var user) {
    if (user != null) {
      _user = user;
      _isAuthenticated = true;
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      _isAuthenticated = false;
      Navigator.pushReplacementNamed(context, '/login');
    }
  }
}
