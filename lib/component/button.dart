import 'package:flutter/material.dart';

import '../constant/colors.dart';

class PrimaryButton extends StatelessWidget {
  VoidCallback onPressed;
  String buttonName;

  PrimaryButton({Key? key, required this.onPressed, required this.buttonName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
                color: kGreyColor, width: 1, style: BorderStyle.solid),
          ),
          width: MediaQuery.of(context).size.width * 0.7,
          child: MaterialButton(
            onPressed: onPressed,
            child: Text(
              buttonName,
              style: const TextStyle(fontSize: 16, color: kWhiteColor),
            ),
          )),
    );
  }
}
