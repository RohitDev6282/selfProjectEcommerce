import 'package:ecommerce_app/constant/colors.dart';
import 'package:flutter/material.dart';

const TextStyle kXSmallTextStyle =
    TextStyle(color: kBlackColor, fontSize: kXSmallText);
const TextStyle kSmallTextStyle =
    TextStyle(color: kBlackColor, fontSize: kSmallText);
const TextStyle kMediumTextStyle =
    TextStyle(color: kBlackColor, fontSize: kMediumText);

const TextStyle kLTextStyle = TextStyle(
  color: kBlackColor,
  fontSize: kLargeText,
);

const TextStyle kXLTextStyle = TextStyle(
  color: kBlackColor,
  fontSize: kXlargeText,
);

const TextStyle kDXLTextStyle = TextStyle(
  color: kPrimaryColor,
  fontSize: 20,
);

// white normal size Text style

const TextStyle kWhiteSmlTextStyle =
    TextStyle(color: kWhiteColor, fontSize: kSmallText);
const TextStyle kWhiteMdmTextStyle =
    TextStyle(color: kWhiteColor, fontSize: kMediumText);

const TextStyle kWhiteLrgTextStyle = TextStyle(
  color: kWhiteColor,
  fontSize: kLargeText,
);
const TextStyle kWtXtaTstSte = TextStyle(color: kWhiteColor, fontSize: 20);
const TextStyle kCAtStyle =
    TextStyle(color: Colors.red, fontSize: 10, fontWeight: FontWeight.w500);
const TextStyle kLCAtStyle = TextStyle(
    color: Colors.red, fontSize: kMediumText, fontWeight: FontWeight.w500);
const TextStyle kXLCAtStyle = TextStyle(
    color: Colors.red, fontSize: kXlargeText, fontWeight: FontWeight.w500);

// bold textStyle

const TextStyle kBSTextStyle = TextStyle(
  color: kBlackColor,
  fontSize: kSmallText,
);

const TextStyle kBMTextStyle = TextStyle(
  color: kBlackColor,
  fontSize: kMediumText,
);
const TextStyle kBLTextStyle = TextStyle(
  color: kBlackColor,
  fontSize: kLargeText,
);
const TextStyle kBXLTextStyle = TextStyle(
  color: kBlackColor,
  fontSize: kXlargeText,
);
const TextStyle kDBXLTextStyle = TextStyle(
  color: kBlackColor,
  fontSize: kDXlargeText,
);

// weight :500 / grey text style

const TextStyle kGSTextStyle = TextStyle(
    color: kDarkGreyColor, fontSize: kSmallText, fontWeight: FontWeight.w500);

const TextStyle kGMTextStyle = TextStyle(
    color: kDarkGreyColor, fontSize: kMediumText, fontWeight: FontWeight.w500);
const TextStyle kGLTextStyle = TextStyle(
    color: kDarkGreyColor, fontSize: kLargeText, fontWeight: FontWeight.w500);
const TextStyle kGXLTextStyle = TextStyle(
    color: kDarkGreyColor, fontSize: kXlargeText, fontWeight: FontWeight.w500);
const TextStyle kGDXLTextStyle = TextStyle(
    color: kDarkGreyColor, fontSize: kDXlargeText, fontWeight: FontWeight.w500);

//weight500 bold text

const TextStyle kWSTextStyle = TextStyle(
    color: kPrimaryColor, fontSize: kSmallText, fontWeight: FontWeight.w500);

const TextStyle kWMTextStyle = TextStyle(
  color: kPrimaryColor,
  fontSize: kMediumText,
);
const TextStyle kWLTextStyle = TextStyle(
    color: kPrimaryColor, fontSize: kLargeText, fontWeight: FontWeight.w500);
const TextStyle kWXLTextStyle = TextStyle(
    color: kPrimaryColor, fontSize: kXlargeText, fontWeight: FontWeight.w500);
const TextStyle kWBXLTextStyle = TextStyle(
    color: kPrimaryColor, fontSize: kDXlargeText, fontWeight: FontWeight.w500);

//black  000000 444444 666666 and similar variants
//grey grey 959595 E5E5E5 9C9C9C CFCECEgrey 959595 E5E5E5 9C9C9C CFCECE

// test style

const double kXSmallText = 10.0;
const double kSmallText = 12.0;
const double kMediumText = 14.0;
const double kLargeText = 16.0;
const double kXlargeText = 18.0;
const double kDXlargeText = 20.0;

// padding
const double kDefaultPadding = 15.0;

// display mediaquery size

Size displaySize(BuildContext context) {
  debugPrint('Size = ' + MediaQuery.of(context).size.toString());
  return MediaQuery.of(context).size;
}

double displayHeight(BuildContext context) {
  debugPrint('Height = ' + displaySize(context).height.toString());
  return displaySize(context).height;
}

double displayWidth(BuildContext context) {
  debugPrint('Width = ' + displaySize(context).width.toString());
  return displaySize(context).width;
}

// when no data get from the api

// const String SUCCESS_MESSAGE=" You will be contacted by us very soon.";
const String kNoimageFound = "assets/images/noImageFound.jpg";
const String kDataNotFond = "No data Found";

// fixed Sized box
const double xsmlheight = 3.0;
const double smlheight = 5.0;
const double height = 8.0;
const double mdimheight = 10.0;
const double extraheight = 12.0;

const SizedBox smlsizebox = SizedBox(height: smlheight);
const SizedBox normalsizebox = SizedBox(height: height);
const SizedBox largesizebox = SizedBox(height: mdimheight);
const SizedBox extrasizebox = SizedBox(height: extraheight);

BoxDecoration productCon = BoxDecoration(
  borderRadius: BorderRadius.circular(8),
  color: kWhiteColor,
  boxShadow: [
    BoxShadow(
      color: kDarkGreyColor.withOpacity(0.25),
      spreadRadius: 1,
      blurRadius: 1,
      offset: const Offset(0, 0), // changes position of shadow
    ),
  ],
);
