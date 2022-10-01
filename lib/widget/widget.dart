import 'package:ecommerce_app/constant/colors.dart';
import 'package:ecommerce_app/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Default AppBar
AppBar appBarWidget(
  String title, {
  @Deprecated('Use titleWidget instead') Widget? child,
  Widget? titleWidget,
  List<Widget>? actions,
  Color? color,
  bool center = false,
  Color? textColor,
  int textSize = 20,
  bool showBack = true,
  Color? shadowColor,
  double? elevation,
  Widget? backWidget,
  @Deprecated('Use systemOverlayStyle instead') Brightness? brightness,
  SystemUiOverlayStyle? systemUiOverlayStyle,
  TextStyle? titleTextStyle,
  PreferredSizeWidget? bottom,
  Widget? flexibleSpace,
}) {
  return AppBar(
    centerTitle: center,
    title: titleWidget ??
        Text(
          title,
          style: titleTextStyle ?? kMediumTextStyle,
        ),
    actions: actions,
    automaticallyImplyLeading: showBack,
    backgroundColor: color ?? kWhiteColor,
    leading: showBack ? (backWidget ?? BackButton(color: kPrimaryColor)) : null,
    shadowColor: shadowColor,
    systemOverlayStyle: systemUiOverlayStyle,
    bottom: bottom,
    flexibleSpace: flexibleSpace,
  );
}
