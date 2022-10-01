import 'package:ecommerce_app/component/button.dart';
import 'package:ecommerce_app/constant/api_config.dart';
import 'package:ecommerce_app/constant/colors.dart';
import 'package:ecommerce_app/views/auth/login.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../constant/constant.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameCntrl = TextEditingController();
  final TextEditingController emailCntrl = TextEditingController();
  final TextEditingController mobileCntrl = TextEditingController();
  final TextEditingController passWordCntrl = TextEditingController();

  TextStyle optionStyle = const TextStyle(
    color: kPrimaryColor,
    fontSize: 18,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: formKey,
          child: ListView(children: [
            Align(
              alignment: Alignment.topLeft,
              child: CircleAvatar(
                backgroundColor: kLightGreyColor,
                child: Center(
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: kPrimaryColor,
                        size: 20,
                      )),
                ),
              ),
            ),
            const SizedBox(height: 50),
            const Text(
              "Register",
              style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              "Create your new account",
              style: TextStyle(color: kGreyColor, fontSize: 16),
            ),
            buildSignupFiled(
                "Full Name",
                const Icon(Icons.person, color: kPrimaryColor),
                TextInputType.name,
                nameCntrl),
            buildSignupFiled(
              "E-Mail Address",
              const Icon(Icons.email, color: kPrimaryColor),
              TextInputType.emailAddress,
              emailCntrl,
            ),
            buildSignupFiled(
                "Mobile Number",
                const Icon(
                  Icons.mobile_friendly,
                  color: kPrimaryColor,
                ),
                TextInputType.number,
                mobileCntrl),
            buildSignupFiled(
                "Password",
                const Icon(Icons.key, color: kPrimaryColor),
                TextInputType.visiblePassword,
                passWordCntrl),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                      text: 'By signing you agree to our',
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: kMediumText,
                          fontWeight: FontWeight.bold),
                      children: <TextSpan>[
                        TextSpan(
                          text: ' Team of use',
                          style: TextStyle(
                            color: kGreyColor,
                            fontSize: kMediumText,
                          ),
                        ),
                        TextSpan(
                          text: ' and',
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),

                          // recognizer: TapGestureRecognizer()
                          //   ..onTap = () {
                          //     // navigate to desired screen
                          //   }
                        ),
                        TextSpan(
                          text: ' privacy notice',
                          style: TextStyle(
                            color: kGreyColor,
                            fontSize: kMediumText,
                          ),
                        ),
                      ])),
            ),
            Center(
              child: PrimaryButton(
                onPressed: () {
                  getSignUp(nameCntrl.text, emailCntrl.text, mobileCntrl.text,
                      passWordCntrl.text);
                  print(nameCntrl.text);
                },
                buttonName: "SignUP",
              ),
            ),
            const SizedBox(
              height: height,
            ),
            Container(
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: RichText(
                    text: TextSpan(
                        text: 'If You have an account? ',
                        style: const TextStyle(color: kGreyColor, fontSize: 15),
                        children: <TextSpan>[
                          TextSpan(
                              text: ' Sign In',
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
                              // )
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const Login()));
                                })
                        ]),
                  ),
                ))
          ]),
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
              style: kWLTextStyle,
              controller: controler,
              decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: optionStyle,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  prefixIcon: prefixIcon),
            ),
          )),
    );
  }

  Future getSignUp(
      String userName, String email, String mobile, String password) async {
    Map data = {
      'name': userName,
      'email': email,
      'mobile': mobile,
      'password': password,
    };

    final response = await http.post(
        Uri.parse(
          Config.signUpUrl,
        ),
        body: data);

    if (response.statusCode == 200) {
      var signResponse = jsonDecode(response.body);
      if (signResponse["success"] == true) {
        String msg = signResponse['message'];
        final snackBar = SnackBar(
          content: Text(msg, style: kWhiteMdmTextStyle),
          backgroundColor: (Colors.black),
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Login()));
      }
    } else {
      var signResponse = jsonDecode(response.body.toString());
      String msg = signResponse['message'];
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
  }
}
