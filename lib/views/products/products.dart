import 'package:ecommerce_app/constant/colors.dart';
import 'package:ecommerce_app/constant/constant.dart';
import 'package:ecommerce_app/constant/string_const.dart';
import 'package:ecommerce_app/model/product_List/product_list.dart';
import 'package:ecommerce_app/repository/productlist_repos.dart';
import 'package:ecommerce_app/views/products/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

enum SingingCharacter { lafayette, jefferson }

class ProductList extends StatefulWidget {
  final String categoryid;
  const ProductList({Key? key, required this.categoryid}) : super(key: key);

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  bool _selectedIndex = false;
  // _onSelected(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  int radioValue = 0;
  SingingCharacter? character = SingingCharacter.lafayette;

  int selectedIndex = 0;

  late final ratingController;
  late double rating;

  double userRating = 4.0;
  int ratingBarMode = 1;
  double initialRating = 2.0;

  bool isAdded = false;
// on click added button on text channge

  String addText = "added";

  IconData? _selectedIcon;
  final bool hasBeenPressed = false;

  @override
  void initState() {
    super.initState();
    ratingController = TextEditingController(text: '3.0');
    rating = initialRating;
  }

  int counter = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kLightGreyColor,
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: const Text("Product List"),
          actions: const [],
        ),
        body: FutureBuilder<ProductListModel>(
            future: getProductlist(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 2 / 2.5,
                      crossAxisCount: 2,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5),
                  itemCount: snapshot.data!.data!.length,
                  itemBuilder: (context, index) {
                    var item = snapshot.data!.data![index];
                    var path = snapshot.data!.path;
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                                transitionDuration: const Duration(seconds: 2),
                                transitionsBuilder:
                                    (context, animation, animationTime, child) {
                                  animation = CurvedAnimation(
                                      parent: animation,
                                      curve: Curves.elasticInOut);
                                  return ScaleTransition(
                                    alignment: Alignment.center,
                                    scale: animation,
                                    child: child,
                                  );
                                },
                                pageBuilder:
                                    (context, animation, animationTime) =>
                                        ProductDetatil(
                                            productDetail:
                                                snapshot.data!.data![index],
                                            imagePath: path)));
                      },
                      child: Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                color: kWhiteColor,
                                borderRadius: BorderRadius.circular(6)),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(
                                    height: 100,
                                    width: 80,
                                    child: Image(
                                      image: NetworkImage(
                                        "$path/${item.mainImage}",
                                      ),
                                    ),
                                  ),
                                  Text(item.productName.toString(),
                                      style: kBMTextStyle),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      RatingBarIndicator(
                                        itemCount: 5,
                                        itemSize: 16,
                                        rating: 4,
                                        itemBuilder: (context, index) => Icon(
                                          _selectedIcon ?? Icons.star,
                                          color: Colors.amber,
                                        ),
                                      ),
                                      Text(item.discount.toString()),
                                    ],
                                  ),
                                  Text(
                                    ruppes + item.mrp.toString(),
                                    style: kBMTextStyle,
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
                                            padding: const EdgeInsets.all(5),
                                            height: 30,
                                            width: 70,
                                            decoration: BoxDecoration(
                                                color: kPrimaryColor,
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
                                                            color: kWhiteColor),
                                                      ),
                                                    ))
                                              ],
                                            ),
                                          ),
                                        ),
                                ],
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                    child: Icon(
                                      Icons.favorite,
                                      color: _selectedIndex != null &&
                                              _selectedIndex == index
                                          ? Colors.redAccent
                                          : Colors.grey,
                                    ),
                                    onTap: () {
                                      _selectedIndex = !_selectedIndex;
                                    }),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
            }));
  }
}
