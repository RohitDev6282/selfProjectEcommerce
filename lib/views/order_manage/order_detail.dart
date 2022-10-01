import 'package:ecommerce_app/constant/colors.dart';
import 'package:ecommerce_app/constant/constant.dart';
import 'package:flutter/material.dart';

class OrderDetail extends StatefulWidget {
  const OrderDetail({Key? key}) : super(key: key);

  @override
  State<OrderDetail> createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  var expectedDelivery = '';

  //List<DTProductModel> data = getCartProducts();

  int subTotal = 0;
  int totalAmount = 0;
  int shippingCharges = 0;
  int mainCount = 0;

  String? name = 'Austin';
  String? address = '381, Shirley St. Munster, New York';
  String? address2 = 'United States - 10005';

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    // DateTime dateTime = DateTime.now();
    // expectedDelivery = '${dateTime.day + 2} ${getMonth(dateTime.month)}, ${dateTime.year}';

    // calculate();
  }

  // calculate() async {
  //   subTotal = 0;
  //   shippingCharges = 0;
  //   totalAmount = 0;

  //   widget.data.forEach((element) {
  //     subTotal += (element.discountPrice ?? element.price)! * element.qty!;
  //   });

  //   shippingCharges = (subTotal * 10).toInt() ~/ 100;
  //   totalAmount = subTotal + shippingCharges;

  //   setState(() {});
  // }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    Widget addressView() {
      return Container(
        padding: EdgeInsets.all(8),
        decoration: productCon,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text("Ramesh", style: kBMTextStyle),
                    Container(
                      child: Text('Home', style: kBLTextStyle),
                      padding: EdgeInsets.only(left: 8, right: 8),
                      decoration: BoxDecoration(
                          color:
                              Theme.of(context).dividerColor.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ],
                ),
                Icon(
                  Icons.phone,
                )
                // .onTap(() {
                //   launch('tel:+913972847376');
                // }),
              ],
            ),
            Text(address!, style: kMediumTextStyle),
            Text(address2!, style: kMediumTextStyle),
            Text('Change', style: kBLTextStyle
                // .onTap(() async {
                //   DTAddressListModel? data = await DTAddressScreen().launch(context);

                //   if (data != null) {
                //     name = data.name;
                //     address = data.addressLine1;
                //     address2 = data.addressLine2;

                //     setState(() {});
                //   }
                // }),
                )
          ],
        ),
      );
    }

    Widget itemTitle() {
      return Row(
        children: [
          Divider(),
          // .expand(),
          // 10.width,
          Text('Items', style: kMediumTextStyle, maxLines: 1),
          // .center(),
          // 10.width,
          // Divider()
          // .expand(),
        ],
      );
    }

    Widget deliveryDateAndPayBtn() {
      return Column(
        children: [
          Icon(Icons.card_travel, size: 26, color: kPrimaryColor),
          // 10.width,
          Text('Expected Delivery - $expectedDelivery',
              style: kMediumTextStyle, maxLines: 1),
          // 20.height,
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(12),
            decoration: productCon,
            child: Text('Continue to Pay', style: kLTextStyle),
          )
          // .onTap(() {
          //   DTPaymentScreen().launch(context);
          // }),
        ],
      );
      // .paddingAll(8);
    }

    Widget mobileWidget() {
      return SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                addressView(),
                // 20.height,
                itemTitle(),
                Divider(height: 20),
                deliveryDateAndPayBtn(),
                // 8.height,
              ],
            ),
            // .paddingAll(8),
            // CartListView(mIsEditable: false, isOrderSummary: true),
          ],
        ),
      );
    }

    Widget webWidget() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.all(8),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  // 16.height,
                  addressView(),
                  // 16.height,
                  itemTitle(),
                  // 16.height,
                  // CartListView(mIsEditable: false, isOrderSummary: true),
                ],
              ),
            ),
          ),
          // .expand(flex: 60),
          Container(
            margin: EdgeInsets.all(16),
            child: Column(
              children: [
                // 20.height,
                // totalAmountWidget(subTotal, shippingCharges, totalAmount),
                const Divider(height: 20),
                deliveryDateAndPayBtn(),
              ],
            ),
          )
          // .expand(flex: 40),
        ],
      );
    }

    return SafeArea(
      child: Scaffold(
        // drawer: DTDrawerWidget(),
        body: Column(
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.keyboard_arrow_left_sharp,
                      size: 30,
                    )),
                const Text(
                  "Order Summary",
                  style: kBXLTextStyle,
                )
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: ContainerX(
                  mobile: mobileWidget(),
                  web: webWidget(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContainerX extends StatelessWidget {
  final Widget? mobile;
  final Widget? web;
  final bool? useFullWidth;

  ContainerX({this.mobile, this.web, this.useFullWidth});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        return Container(
          alignment: Alignment.topCenter,
          child: Container(
            // constraints: useFullWidth.validate() ? null : dynamicBoxConstraints(maxWidth: context.width() * 0.9),
            child: web ?? const SizedBox(),
          ),
        );
      },
    );
  }
}
