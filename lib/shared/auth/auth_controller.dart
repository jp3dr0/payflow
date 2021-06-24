import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payflow/shared/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  UserModel? _user;

  // ! quer dizer que só vai retornar se nao for nulo (non nullable)?
  UserModel get user => _user!;

  void setUser(BuildContext context, UserModel? user) {
    if (user != null) {
      //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
      saveUser(user);
      _user = user;
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  Future<void> saveUser(UserModel user) async {
    final instance = await SharedPreferences.getInstance();
    await instance.setString("user", user.toJson());
  }

  Future<void> curentUser(BuildContext context) async {
    final instance = await SharedPreferences.getInstance();

    await Future.delayed(Duration(seconds: 2));

    if (instance.containsKey("user")) {
      final json = instance.get("user") as String;
      setUser(context, UserModel.fromJson(json));
      return;
    } else {
      setUser(context, null);
    }
  }
}
