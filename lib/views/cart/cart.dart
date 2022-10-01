import 'package:ecommerce_app/constant/colors.dart';
import 'package:ecommerce_app/constant/constant.dart';
import 'package:ecommerce_app/model/product_List/product_list.dart';
import 'package:ecommerce_app/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../constant/string_const.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  var a = $;
  late final _ratingController;
  late double rating;

  double _userRating = 4.0;
  int _ratingBarMode = 1;
  double _initialRating = 2.0;
  bool _isRTLMode = false;
  bool _isVertical = false;

  IconData? _selectedIcon;
  int _itemCount = 1;

  void increament() {
    setState(() {
      _itemCount++;
    });
  }

  void decreament() {
    setState(() {
      _itemCount--;
    });
  }

  static var $;

  @override
  void initState() {
    super.initState();
    _ratingController = TextEditingController(text: '3.0');
    rating = _initialRating;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 5, left: 10, right: 5, bottom: 0),
          child: ListView(
            children: [
              const Text(
                "Shoping Cart",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "2 Items",
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              // ListView.builder(
              //   shrinkWrap: true,
              //   physics: const ScrollPhysics(),
              //   itemCount: itemList.length,
              //   itemBuilder: (context, index) {
              //     return Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Padding(
              //           padding: const EdgeInsets.all(8),
              //           child: Row(
              //             children: [
              //               ClipRRect(
              //                 borderRadius: BorderRadius.circular(16),
              //                 child: Image.asset(
              //                   itemList[index].image,
              //                   height:
              //                       MediaQuery.of(context).size.height * 0.18,
              //                   width: MediaQuery.of(context).size.width * 0.25,
              //                   fit: BoxFit.contain,
              //                 ),
              //               ),
              //               Padding(
              //                 padding: const EdgeInsets.all(8.0),
              //                 child: Column(
              //                   crossAxisAlignment: CrossAxisAlignment.start,
              //                   children: <Widget>[
              //                     Text(itemList[index].productName,
              //                         style: const TextStyle(
              //                             fontSize: 20,
              //                             color: Colors.black87,
              //                             fontWeight: FontWeight.w500)),
              //                     Row(
              //                       children: [
              //                         RatingBarIndicator(
              //                           itemCount: 5,
              //                           itemSize: 16,
              //                           rating: 4,
              //                           itemBuilder: (context, index) => Icon(
              //                             _selectedIcon ?? Icons.star,
              //                             color: Colors.amber,
              //                           ),
              //                         ),
              //                         Text(itemList[index].rating.toString()),
              //                       ],
              //                     ),
              //                     Padding(
              //                       padding: const EdgeInsets.only(
              //                           top: 16, bottom: 10),
              //                       child: Row(
              //                         children: [
              //                           Text(itemList[index]
              //                                   .quantity
              //                                   .toString() +
              //                               "ml")
              //                         ],
              //                       ),
              //                     ),
              //                     Row(
              //                       mainAxisAlignment:
              //                           MainAxisAlignment.spaceBetween,
              //                       children: [
              //                         SizedBox(
              //                             width: 40,
              //                             child: Text(
              //                                 ruppes + itemList[index].price)),
              //                         SizedBox(
              //                           width:
              //                               MediaQuery.of(context).size.width *
              //                                   0.30,
              //                         ),
              //                         Container(
              //                           height: 38,
              //                           decoration: BoxDecoration(
              //                             border: Border.all(
              //                                 color: const Color(0xffe0e0e0)),
              //                           ),
              //                           child: FittedBox(
              //                             child: Row(
              //                               children: [
              //                                 _itemCount != 0
              //                                     ? IconButton(
              //                                         icon: const Icon(
              //                                           Icons.remove,
              //                                           size: 14,
              //                                         ),
              //                                         onPressed: decreament)
              //                                     : Container(),
              //                                 Text(
              //                                   _itemCount.toString(),
              //                                   style: const TextStyle(
              //                                       fontSize: 16),
              //                                 ),
              //                                 IconButton(
              //                                     icon: const Icon(
              //                                       Icons.add,
              //                                       size: 14,
              //                                     ),
              //                                     onPressed: increament),
              //                               ],
              //                             ),
              //                           ),
              //                         ),
              //                       ],
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //       ],
              //     );
              //   },
              // ),
              // const Divider(
              //   thickness: 2,
              // ),
              Row(
                children: const [
                  Text(
                    "Grand Total",
                    style: kXLCAtStyle,
                  ),
                  Spacer(),
                  Text(
                    "\$334.00",
                    style: kXLCAtStyle,
                  ),
                ],
              ),
              CustomButton(text: "CheckOut", colors: kPrimaryColor)
            ],
          ),
        ),

        // floatingActionButton: Container(
        //   height: 40,
        //   width: MediaQuery.of(context).size.width * 0.92,
        //   decoration: BoxDecoration(
        //       color: kPrimaryColor, borderRadius: BorderRadius.circular(10)),
        //   child: Row(
        //     children: [
        //       MaterialButton(
        //         onPressed: () {
        //           // Navigator.push(context,
        //           //     MaterialPageRoute(builder: (context) => const Checkout()));
        //         },
        //         child: const Text(
        //           "CHECK OUT",
        //           style: TextStyle(color: Colors.white, fontSize: 12),
        //         ),
        //       ),
        //       const Spacer(),
        //       const Padding(
        //         padding: EdgeInsets.only(right: 15),
        //         child: Icon(
        //           Icons.arrow_forward_ios,
        //           color: Colors.white,
        //           size: 16,
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
