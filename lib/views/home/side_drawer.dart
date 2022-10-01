import 'package:ecommerce_app/constant/colors.dart';
import 'package:ecommerce_app/constant/constant.dart';
import 'package:ecommerce_app/model/drawer_category.dart';
import 'package:ecommerce_app/views/auth/login.dart';
import 'package:ecommerce_app/views/home/contact_us.dart';
import 'package:ecommerce_app/views/home/faq.dart';
import 'package:ecommerce_app/views/order_manage/order_history.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SideDrawer extends StatefulWidget {
  const SideDrawer({Key? key}) : super(key: key);

  @override
  State<SideDrawer> createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  List<DrawerCategory> list = [];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.85,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Center(
                      child: Padding(
                          padding: const EdgeInsets.only(top: 30, right: 24.0),
                          child: Column(
                            children: <Widget>[
                              Card(
                                semanticContainer: true,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                elevation: 16,
                                margin: const EdgeInsets.all(4.0),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100.0)),
                                child: const Padding(
                                  padding: EdgeInsets.all(4.0),
                                  child: CircleAvatar(
                                      backgroundImage:
                                          AssetImage("assets/images/user.png"),
                                      radius: 55),
                                ),
                              ),
                              const SizedBox(height: 20),
                              const Text(
                                "Guest User",
                                style: kLTextStyle,
                              )
                            ],
                          )),
                    ),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                            padding: const EdgeInsets.only(left: 16, top: 0),
                            child: IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(Icons.clear))))
                  ],
                ),
                const SizedBox(height: 30),
                Container(
                  color: kWhiteColor,
                  padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) =>
                                        const OrderedList())));
                          },
                          child: Column(
                            children: const [
                              Text(
                                "08",
                                style: TextStyle(color: kPrimaryColor),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "My Order",
                                style: kMediumTextStyle,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                            setState(() {
                              // selectedTab = 1;
                            });
                          },
                          child: Column(
                            children: const [
                              Text("07", style: kMediumTextStyle),
                              SizedBox(height: 4),
                              Text("Wishlist", style: kMediumTextStyle),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: list.length,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemBuilder: (context, index) {
                    return getDrawerItem(
                      list[index].image,
                      list[index].name,
                      callback: () {
                        // ShSubCategory(category: list[index]).launch(context);
                      },
                    );
                  },
                ),
                const Divider(color: kGreyColor, height: 1),
                getDrawerItem("assets/images/user.png", "Account",
                    callback: () {
                  // ShAccountScreen().launch(context);

                  /*bool isWishlist = launchScreen(context, ShAccountScreen.tag) ?? false;
                    if (isWishlist) {
                      selectedTab = 1;
                      setState(() {});
                    }*/
                }),
                getDrawerItem("assets/images/user.png", "Setting",
                    callback: () {
                  // ShSettingsScreen().launch(context);
                }),
                const SizedBox(height: 20),
                getDrawerItem(null, "FAQ", callback: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FAQPages()));
                }),
                getDrawerItem(null, "Contact Us", callback: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ContactUs()));
                }),
                getDrawerItem(null, "Logoout", callback: () async {
                  SharedPreferences preferences =
                      await SharedPreferences.getInstance();
                  preferences.remove('logged');

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Login()));
                }),
                const SizedBox(height: 50),
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: kWhiteColor.withOpacity(0.2)),
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: <Widget>[
                      Image.asset("assets/images/logo.jpeg", width: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text("Thakur", style: kGMTextStyle),
                          Text("dukan", style: kGMTextStyle),
                        ],
                      ),
                      const Text("v 1.0", style: kGMTextStyle)
                    ],
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getDrawerItem(String? icon, String? name, {VoidCallback? callback}) {
    return InkWell(
      onTap: callback,
      child: Container(
        color: kWhiteColor,
        padding: EdgeInsets.fromLTRB(20, 14, 20, 14),
        child: Row(
          children: <Widget>[
            icon != null
                ? Image.asset(icon, width: 20, height: 20, color: kWhiteColor)
                : Container(width: 20),
            SizedBox(width: 20),
            Text(name!,
                style: TextStyle(
                  fontSize: 16,
                  color: kDarkGreyColor,
                ))
          ],
        ),
      ),
    );
  }
}
