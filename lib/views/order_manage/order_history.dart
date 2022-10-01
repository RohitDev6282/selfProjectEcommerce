import 'package:ecommerce_app/constant/colors.dart';
import 'package:ecommerce_app/views/order_manage/order_detail.dart';
import 'package:ecommerce_app/widget/custom_button.dart';
import "package:flutter/material.dart";

import '../../constant/constant.dart';

class OrderedList extends StatefulWidget {
  const OrderedList({Key? key}) : super(key: key);

  @override
  State<OrderedList> createState() => _OrderedListState();
}

class _OrderedListState extends State<OrderedList> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back)),
                const Text(
                  "Order History",
                  style: kBLTextStyle,
                )
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ListView.builder(
                        itemCount: 3,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => BookingHistoryDetail(
                              //             detail: _fetchBookingData[index])));
                            },
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                              child: Card(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 4, 8, 4),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: const [
                                          Text(
                                            "OrderNo.",
                                            style: kBLTextStyle,
                                          ),
                                          Spacer(),
                                          Text(
                                            "ORDO94677640",
                                            style: kBMTextStyle,
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: const [
                                          Text(
                                            "Total Amount",
                                            style: kMediumTextStyle,
                                          ),
                                          Spacer(),
                                          Text(
                                            " 300 Rupees",
                                            style: kMediumTextStyle,
                                          )
                                        ],
                                      ),
                                      const Text(
                                        "11 Items",
                                        style: kSmallTextStyle,
                                      ),
                                      Row(
                                        children: [
                                          const Text(
                                            "13 aug 2022,8:47 pm",
                                            style: kMediumTextStyle,
                                          ),
                                          const Spacer(),
                                          TextButton(
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const OrderDetail()));
                                              },
                                              child: const Text(
                                                "View Detail",
                                                style: TextStyle(
                                                    color: kPrimaryColor),
                                              )),
                                          const Icon(
                                            Icons.keyboard_arrow_right,
                                            color: kPrimaryColor,
                                          )
                                          // CustomButton(text: "Call", colors: kPrimaryColor)
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
