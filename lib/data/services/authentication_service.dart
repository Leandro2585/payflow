import 'package:flutter/material.dart';
import 'package:payflow/data/models/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationService {
  UserModel? _user;

  UserModel get user => _user!;

  void setUser(BuildContext context, UserModel? user) {
    if (user != null) {
      _user = user;
      Navigator.pushReplacementNamed(context, '/home', arguments: user);
    } else {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  Future<void> saveUser(UserModel user) async {
    final instance = await SharedPreferences.getInstance();
    instance.setString('user', user.parseJson());
    return;
  }

  Future<void> currentUser(BuildContext context) async {
    final instance = await SharedPreferences.getInstance();
    await Future.delayed(const Duration(milliseconds: 400));
    if (instance.containsKey('user')) {
      final user = instance.get('user') as String;
      setUser(context, UserModel.fromJson(user));
    } else {
      setUser(context, null);
    }
  }
}
