import 'package:ecommerce_app/constant/colors.dart';
import 'package:ecommerce_app/model/product_List/product_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductDetatil extends StatefulWidget {
  Datum productDetail;
  var imagePath;
  ProductDetatil(
      {Key? key, required this.productDetail, required this.imagePath})
      : super(key: key);

  @override
  _ProductDetatilState createState() => _ProductDetatilState();
}

class _ProductDetatilState extends State<ProductDetatil> {
  final List<String> iconList = ["100 ml", "500 ml", "900 ml"];
  List<bool> isSelected = [false, false, false];
  var _selectedIcon;

  bool _alreadySaved = false;

  @override
  Widget build(BuildContext context) {
    var imageLink = widget.imagePath;
    return Scaffold(
        backgroundColor: Colors.deepPurple[50],
        body: SafeArea(
          child: Container(
              color: Colors.deepPurple[50],
              child: Stack(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 250,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            "$imageLink/${widget.productDetail.mainImage}"),
                        fit: BoxFit.cover,
                      ),
                      //Border.all
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        //BoxShadow
                        BoxShadow(
                          color: Colors.white,
                          offset: Offset(0.0, 0.0),
                          blurRadius: 0.0,
                          spreadRadius: 0.0,
                        ), //BoxShadow
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back, color: kPrimaryColor),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(150, 290, 0, 0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.deepPurple[50], shape: BoxShape.circle),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 20,
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              _alreadySaved =
                                  !_alreadySaved; //<--update alreadSaved
                            });
                          },
                          icon: Icon(
                            _alreadySaved
                                ? Icons.favorite
                                : Icons.favorite_border,
                          ),
                          color: _alreadySaved ? kPrimaryColor : kPrimaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 700,
                  child: DraggableScrollableSheet(
                    builder: (context, controller) => Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(24),
                            topLeft: Radius.circular(24)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              Text(
                                widget.productDetail.productName.toString(),
                                style: TextStyle(fontSize: 24),
                              ),
                              Row(
                                children: [
                                  RatingBarIndicator(
                                    itemCount: 5,
                                    itemSize: 22,
                                    rating: 4,
                                    itemBuilder: (context, index) => Icon(
                                      _selectedIcon ?? Icons.star,
                                      color: Colors.amber,
                                    ),
                                  ),
                                  const Text("4.5")
                                ],
                              ),
                              const SizedBox(height: 5),
                              const Text("Selected size: 500ml",
                                  style: TextStyle(
                                    fontSize: 14,
                                  )),
                              const SizedBox(
                                height: 7,
                              ),
                              const Text(
                                "Pamper your skin. Our hand wash is the perfect kitchen and bathroom companion. It gently washes away germs and bacteria without the use of chemical use. is the perfect kitchen and bathroom companion. It gently washes away germs and bacteria without the use of chemical use. is the perfect kitchen and bathroom companion. It gently washes away germs and bacteria without the use of chemical use.",
                                style: TextStyle(
                                    fontSize: 18,
                                    letterSpacing: 2,
                                    color: kDarkGreyColor),
                              ),
                              FittedBox(
                                child: Ink(
                                  width: 200,
                                  height: 38,
                                  child: GridView.count(
                                    primary: true,
                                    crossAxisCount:
                                        3, //set the number of buttons in a row
                                    crossAxisSpacing:
                                        12, //set the spacing between the buttons
                                    childAspectRatio:
                                        2.5, //set the width-to-height ratio of the button,
                                    //>1 is a horizontal rectangle
                                    children: List.generate(isSelected.length,
                                        (index) {
                                      //using Inkwell widget to create a button
                                      return InkWell(
                                          //the default splashColor is grey
                                          onTap: () {
                                            //set the toggle logic
                                            setState(() {
                                              for (int indexBtn = 0;
                                                  indexBtn < isSelected.length;
                                                  indexBtn++) {
                                                if (indexBtn == index) {
                                                  isSelected[indexBtn] = true;
                                                } else {
                                                  isSelected[indexBtn] = false;
                                                }
                                              }
                                            });
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                //set the background color of the button when it is selected/ not selected
                                                color: isSelected[index]
                                                    ? Colors.white
                                                    : Colors.white,
                                                // here is where we set the rounded corner
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                //don't forget to set the border,
                                                //otherwise there will be no rounded corner

                                                border: Border.all(
                                                    color: kPrimaryColor)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8, 4, 8, 4),
                                              child: Text(
                                                iconList[index],
                                                style: TextStyle(
                                                    color: isSelected[index]
                                                        ? kPrimaryColor
                                                        : kGreyColor,
                                                    fontSize: 13),
                                              ),
                                            ),
                                            //set the color of the icon when it is selected/ not selected
                                          ));
                                    }),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 10, 10, 0),
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.07,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(
                                        30), //border corner radius
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.white
                                            .withOpacity(0.9), //color of shadow
                                        spreadRadius: 50, //spread radius
                                        blurRadius: 50, // blur radius
                                        offset: Offset(
                                            0, 8), // changes position of shadow
                                        //first paramerter of offset is left-right
                                        //second parameter is top to down
                                      ),
                                      //you can set more BoxShadow() here
                                    ],
                                  ),
                                  child: Row(
                                    children: [
                                      const Text(
                                        '\$235.00',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: kGreyColor),
                                      ),
                                      Spacer(),
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.06,
                                        child: TextButton(
                                          style: ButtonStyle(
                                              foregroundColor:
                                                  MaterialStateProperty.all<
                                                      Color>(Colors.white),
                                              backgroundColor:
                                                  MaterialStateProperty.all<
                                                      Color>(kPrimaryColor),
                                              shape: MaterialStateProperty.all<
                                                      RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                              ))),
                                          onPressed: () {},
                                          child: const Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                30, 0, 25, 0),
                                            child: Text(
                                              "Add to Cart",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ])),
        ));
  }
}
