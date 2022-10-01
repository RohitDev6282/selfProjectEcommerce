import 'dart:async';
import 'package:ecommerce_app/views/auth/login.dart';
import 'package:ecommerce_app/views/footer.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future getuserValidation() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var _finalStatus = preferences.getInt('logged');
    if (_finalStatus != null) {
      Timer(
          const Duration(seconds: 2),
          () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Footer()),
              ));
    } else {
      Timer(
          const Duration(seconds: 2),
          () => Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const Login()),
              (route) => false));
    }
  }

  @override
  void initState() {
    super.initState();
    getuserValidation();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.all(0),
      child: Scaffold(
        body: Center(
          child: Container(
            height: 250,
            width: 250,
            decoration: const BoxDecoration(),
            child: Center(
                child: Image.asset(
              "assets/images/logo.jpeg",
            )),
          ),
        ),
      ),
    );
  }

  // loginUi() {
  //   // return Consumer<LoginController>(builder: (context, model, child) {
  //   //if we are already login
  //   // ignore: unrelated_type_equality_checks

  //   if (_finalStatus != "") {
  //     return (const Footer());
  //   } else {
  //     return const LoginPage();
  //   }
  //   // });
  // }
}
