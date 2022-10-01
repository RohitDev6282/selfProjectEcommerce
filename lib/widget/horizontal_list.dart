import 'package:ecommerce_app/constant/colors.dart';
import 'package:ecommerce_app/constant/constant.dart';
import 'package:ecommerce_app/model/product_model.dart';
import 'package:flutter/material.dart';

import '../views/products/products.dart';

class HorizontalList extends StatefulWidget {
  final String text;

  const HorizontalList({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  State<HorizontalList> createState() => _HorizontalListState();
}

class _HorizontalListState extends State<HorizontalList> {
  bool isAdded = false;
  int? _selectedIndex;
  _onSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  int counter = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildHeader(context),
        SizedBox(
          height: 260,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: product.length,
            itemBuilder: (context, index) {
              return buildList(index, context);
            },
          ),
        ),
      ],
    );
  }

  Padding buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 4, 8, 8),
      child: Row(
        children: [
          Text(
            widget.text,
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

  GestureDetector buildList(int index, BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          width: 150,
          margin: const EdgeInsets.all(5),
          decoration: productCon,
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
                        color: _selectedIndex != null && _selectedIndex == index
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
                  height: MediaQuery.of(context).size.height * 0.17,
                  width: 120,
                  fit: BoxFit.cover,
                ),
              ),

              // ignore: avoid_unnecessary_containers
              Padding(
                padding: const EdgeInsets.only(left: 8),
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
                                      borderRadius: BorderRadius.circular(4),
                                      border:
                                          Border.all(color: Colors.white70)),
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
                                        borderRadius: BorderRadius.circular(4),
                                        border:
                                            Border.all(color: kPrimaryColor)),
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
        ),
      ),
    );
  }
}
