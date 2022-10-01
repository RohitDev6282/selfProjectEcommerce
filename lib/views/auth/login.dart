import 'dart:convert';

import 'package:ecommerce_app/component/button.dart';
import 'package:ecommerce_app/constant/api_config.dart';
import 'package:ecommerce_app/constant/colors.dart';
import 'package:ecommerce_app/constant/constant.dart';
import 'package:ecommerce_app/views/auth/signup.dart';
import 'package:ecommerce_app/views/footer.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();

  GlobalKey<FormState> globalfromKey = GlobalKey<FormState>();
  final TextEditingController usrNameCntrl = TextEditingController();
  final TextEditingController passwerdCntrl = TextEditingController();
  TextStyle optionStyle = const TextStyle(
    color: kPrimaryColor,
    fontSize: 18,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: formKey,
            child: Column(children: [
              Center(
                  child: Image.asset(
                "assets/images/logo.jpeg",
                height: 270,
              )),

              Center(
                  child: RichText(
                text: const TextSpan(
                    text: "Kirana",
                    style: TextStyle(
                        color: kDblueColors,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                    children: <TextSpan>[
                      TextSpan(
                          text: ' Store',
                          style: TextStyle(color: kPrimaryColor, fontSize: 25))
                    ]),
              )),
              const SizedBox(
                height: 30,
              ),

              buildSignupFiled(
                  "User Name",
                  const Icon(
                    Icons.phone,
                    color: kPrimaryColor,
                    size: 22,
                  ),
                  TextInputType.text,
                  usrNameCntrl),
              buildSignupFiled(
                  "Password",
                  const Icon(
                    Icons.lock,
                    color: kPrimaryColor,
                    size: 22,
                  ),
                  TextInputType.visiblePassword,
                  passwerdCntrl),

              // Padding(
              //   padding: const EdgeInsets.only(left: 40, right: 40),
              //   child: RichText(
              //       textAlign: TextAlign.center,
              //       text: const TextSpan(
              //           text: 'By signing you agree to our',
              //           style: TextStyle(
              //               color: kPrimaryColor,
              //               fontSize: 16,
              //               fontWeight: FontWeight.bold),
              //           children: <TextSpan>[
              //             TextSpan(
              //               text: ' Team of use',
              //               style: TextStyle(
              //                 color: kGreyColor,
              //                 fontSize: 16,
              //               ),
              //             ),
              //             TextSpan(
              //               text: ' and',
              //               style: TextStyle(
              //                   color: kPrimaryColor,
              //                   fontSize: 16,
              //                   fontWeight: FontWeight.bold),

              //               // recognizer: TapGestureRecognizer()
              //               //   ..onTap = () {
              //               //     // navigate to desired screen
              //               //   }
              //             ),
              //             TextSpan(
              //               text: ' privacy notice',
              //               style: TextStyle(
              //                 color: kGreyColor,
              //                 fontSize: 16,
              //               ),
              //             ),
              //           ])),
              // ),
              const SizedBox(
                height: 30,
              ),
              PrimaryButton(
                onPressed: () {
                  getLogin(usrNameCntrl.text, passwerdCntrl.text);
                },
                buttonName: "Login",
              ),
              Container(
                  padding: const EdgeInsets.all(10),
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                          text: 'Don\'t have an account? ',
                          style:
                              const TextStyle(color: kGreyColor, fontSize: 15),
                          children: <TextSpan>[
                            TextSpan(
                              text: ' Sign up',
                              style: const TextStyle(
                                  shadows: [
                                    Shadow(
                                        color: kPrimaryColor,
                                        offset: Offset(-2, -2))
                                  ],
                                  color: Colors.transparent,
                                  decoration: TextDecoration.underline,
                                  decorationColor: kPrimaryColor,
                                  decorationThickness: 2,
                                  fontWeight: FontWeight.bold),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SignupPage()));
                                },
                            )
                          ]),
                    ),
                  )),
            ]),
          ),
        ),
      ),
    ));
  }

  Padding buildSignupFiled(String hintText, Icon prefixIcon,
      TextInputType textType, TextEditingController controler) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
          height: 55,
          decoration: BoxDecoration(
            color: kSearchBarColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: controler,
              keyboardType: textType,
              style: kWLTextStyle,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hintText,
                  hintStyle: optionStyle,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  prefixIcon: prefixIcon),
            ),
          )),
    );
  }

  Future getLogin(String userName, String password) async {
    Map data = {'username': userName, 'password': password};

    final response = await http.post(
        Uri.parse(
          Config.loginUrl,
        ),
        body: data);
    var loginResponse = json.decode(response.body);
    if (loginResponse["success"] == true) {
      final snackBar = SnackBar(
        content: Text(loginResponse["message"].toString(),
            style: kWhiteMdmTextStyle),
        backgroundColor: (Colors.black),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      var userId = loginResponse["data"]["user_id"];
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Footer()));
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setInt('logged', userId);
    } else {
      var loginResponse = json.decode(response.body);
      String msg = loginResponse['message'];
      final snackBar = SnackBar(
        content: Text(msg.toString(), style: kLCAtStyle),
        backgroundColor: (Colors.black12),
        action: SnackBarAction(
          label: 'dismiss',
          onPressed: () {},
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    // await leadData
    //     .map<LeadListModel>((json) => LeadListModel.fromJson(json))
    //     .toList();
  }
}
