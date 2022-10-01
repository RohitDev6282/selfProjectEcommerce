import 'package:badges/badges.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:ecommerce_app/constant/constant.dart';
import 'package:ecommerce_app/constant/string_const.dart';
import 'package:ecommerce_app/model/category_model/category_model.dart';
import 'package:ecommerce_app/views/cart/cart.dart';
import 'package:ecommerce_app/views/home/category/product_categor.dart';
import 'package:ecommerce_app/views/home/side_drawer.dart';
import 'package:ecommerce_app/widget/search_button.dart';
import 'package:flutter/material.dart';

import '../../constant/colors.dart';
import '../../model/product_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var position = 0;
  List<String> banners = [];
  late CategoryModel fetchCategory;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    List<String> banner = [];
    for (var i = 1; i < 5; i++) {
      banner.add("assets/images/banner/b" + i.toString() + ".jpeg");
    }
    setState(() {
      banners.clear();
      banners.addAll(banner);
    });
  }

  bool isAdded = false;
  int? _selectedIndex;
  _onSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  int counter = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text(
          "Kirana wala Store",
          style: kLTextStyle,
        ),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(
              Icons.menu,
              color: kBlackColor,
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        elevation: 0,
        iconTheme: const IconThemeData(color: kBlackColor),
        backgroundColor: kWhiteColor,
        actions: [
          IconButton(
            color: kBlackColor,
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_bag,
            ),
          ),
        ],
      ),
      drawer: const Drawer(
        child: SideDrawer(),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SearchBar(onPressed: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => const SearchPage()));
                        }),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.30,
                          decoration: productCon,
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: <Widget>[
                              PageView.builder(
                                itemCount: banners.length,
                                itemBuilder: (context, index) {
                                  return Image.asset(banners[index],
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.30,
                                      fit: BoxFit.cover);
                                },
                                onPageChanged: (index) {
                                  setState(() {
                                    position = index;
                                  });
                                },
                              ),
                              Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: DotsIndicator(
                                    dotsCount: banners.length,
                                    position: position.toDouble(),
                                    decorator: const DotsDecorator(
                                      color: kDarkGreyColor,
                                      activeColor: kLightGreyColor,
                                      size: Size.square(7.0),
                                      activeSize: Size.square(10.0),
                                      spacing: EdgeInsets.all(3),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          "All Catergories",
                          style: TextStyle(color: Colors.black54, fontSize: 20),
                        ),
                      ),
                      const Categories(),
                      buildHeader(context, "Fruit And Vegetable"),
                      SizedBox(
                        height: 260,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.only(bottom: 4, right: 16),
                          itemCount: product.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return buildHorizontal(index, context);
                          },
                        ),
                      ),
                      Divider(
                        color: Colors.grey[300],
                        thickness: 2,
                      ),
                      buildHeader(context, "Milk and Dairy Product"),
                      SizedBox(
                        height: 260,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: product.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return buildHorizontal(index, context);
                          },
                        ),
                      ),
                      Divider(
                        color: Colors.grey[300],
                        thickness: 1,
                      ),
                      buildHeader(context, "Beverages"),
                      SizedBox(
                        height: 260,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.only(bottom: 4, right: 16),
                          itemCount: product.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return buildHorizontal(index, context);
                          },
                        ),
                      ),
                      Divider(
                        color: Colors.grey[300],
                        thickness: 1,
                      ),
                      buildHeader(context, "Personal Goods"),
                      SizedBox(
                        height: 260,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.only(bottom: 4, right: 16),
                          itemCount: product.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return buildHorizontal(index, context);
                          },
                        ),
                      ),
                      Divider(
                        color: Colors.grey[300],
                        thickness: 1,
                      ),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHorizontal(int index, BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: productCon,
      child: GestureDetector(
          onTap: () {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => const ProductDetatil()));
            // // FoodDescription().launch(context);
          },
          child: Column(
            children: [
              Container(
                width: 150,
                margin: const EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Text(product[index].weight,
                        //     style: kMediumTextStyle),
                        const SizedBox(
                          width: 110,
                        ),
                        GestureDetector(
                            child: Icon(
                              Icons.favorite,
                              color: _selectedIndex != null &&
                                      _selectedIndex == index
                                  ? Colors.redAccent
                                  : Colors.grey,
                            ),
                            onTap: () {
                              _onSelected(index);
                            })
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Image.asset(
                        product[index].image,
                        height: MediaQuery.of(context).size.height * 0.15,
                        width: 120,
                        fit: BoxFit.cover,
                      ),
                    ),

                    // ignore: avoid_unnecessary_containers
                    Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product[index].productName,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 14.0,
                              color: kDarkGreyColor,
                            ),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Text(
                            product[index].weight,
                            style: const TextStyle(
                              fontSize: 12.0,
                              color: kBlackColor,
                            ),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          SizedBox(
                            width: 135,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  product[index].price,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 12.0,
                                    color: kBlackColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(
                                  width: 40,
                                ),
                                isAdded
                                    ? Center(
                                        child: Container(
                                        height: 30,
                                        width: 70,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            border: Border.all(
                                                color: Colors.white70)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    if (counter < 2) {
                                                      isAdded = !isAdded;
                                                    } else {
                                                      counter--;
                                                    }
                                                  });
                                                },
                                                child: const Icon(
                                                  Icons.remove,
                                                  color: Colors.green,
                                                  size: 18,
                                                )),
                                            Text(
                                              counter.toString(),
                                              style: const TextStyle(
                                                  color: kPrimaryColor),
                                            ),
                                            InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    counter++;
                                                  });
                                                },
                                                child: const Icon(
                                                  Icons.add,
                                                  color: Colors.green,
                                                  size: 18,
                                                )),
                                          ],
                                        ),
                                      ))
                                    : Center(
                                        child: Container(
                                          padding: const EdgeInsets.all(3),
                                          height: 25,
                                          width: 60,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              border: Border.all(
                                                  color: kPrimaryColor)),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      isAdded = !isAdded;
//
                                                    });
                                                  },
                                                  child: const Center(
                                                    child: Text(
                                                      'ADD',
                                                      style: TextStyle(
                                                          color: kPrimaryColor),
                                                    ),
                                                  ))
                                            ],
                                          ),
                                        ),
                                      ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }

  Padding buildHeader(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 4, 8, 8),
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
                letterSpacing: 1.5,
                color: Colors.grey[800]),
          ),
          const Spacer(),
          SizedBox(
            height: 40,
            child: FittedBox(
              child: TextButton(
                style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(kPrimaryColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ))),
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => const ProductList()));
                },
                child: const Padding(
                  padding: EdgeInsets.only(left: 8, right: 8),
                  child: Text(
                    "View all",
                    style: TextStyle(fontSize: 13),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
