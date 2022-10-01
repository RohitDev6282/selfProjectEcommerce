import 'package:ecommerce_app/constant/colors.dart';
import 'package:ecommerce_app/constant/constant.dart';
import 'package:ecommerce_app/model/product_model.dart';
import 'package:ecommerce_app/model/profile_model/profile_model.dart';
import 'package:ecommerce_app/repository/profile_service.dart';
import 'package:ecommerce_app/views/profile/edit_profile.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late Future<ProfileModel> future;

  bool isExpanded = false;
  bool _customTileExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        const SizedBox(
          height: 10,
        ),
        FutureBuilder<ProfileModel>(
            future: getProfile(),
            builder: (context, snapshot) {
              return Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.deepPurple[200],
                    radius: 65,
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/profile.jpg',
                        height: 120,
                        width: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text(
                    snapshot.data?.data.name ?? "no Data found",
                    style: kBLTextStyle,
                  ),
                  const SizedBox(
                    height: height,
                  ),
                  Text(snapshot.data?.data.email ?? "No email Found",
                      style: kLTextStyle)
                ],
              );
            }),
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 20.0,
              ),
            ],
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 15, 10, 12),
            child: Column(
              children: [
                ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProfileEditingPage()));
                  },
                  leading: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.pink[100],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Icon(
                      Icons.person,
                      color: Colors.pinkAccent[400],
                    ),
                  ),
                  trailing: const Icon(
                    Icons.keyboard_arrow_right_sharp,
                    size: 35,
                    color: Colors.black,
                  ),
                  title: const Text(
                    "Edit Profile",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(height: 20),
                ListTile(
                  onTap: () {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => MyOrderPage()));
                  },
                  leading: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.blue[100],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(
                      Icons.business,
                      color: Colors.blue,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.keyboard_arrow_right_sharp,
                    size: 35,
                    color: Colors.black,
                  ),
                  title: const Text(
                    "My order",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(height: 20),
                Theme(
                  data: Theme.of(context)
                      .copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    leading: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.red[100],
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Icon(
                        Icons.favorite,
                        color: Colors.red[300],
                      ),
                    ),

                    // trailing: Icon(
                    //   Icons.arrow_forward_ios,color: Colors.black,
                    //   size: 22,
                    // ),
                    title: const Text(
                      "Favourites",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),

                    trailing: Icon(
                      _customTileExpanded
                          ? Icons.keyboard_arrow_down_sharp
                          : Icons.keyboard_arrow_right_sharp,
                      size: 35,
                      color: Colors.black,
                    ),

                    //  onExpansionChanged: (bool expanded) {
                    // setState(() => _customTileExpanded = expanded);

                    children: [
                      SizedBox(
                        height: 200,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: product.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 5, right: 5),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: kLightGreyColor, width: 2),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        product[index].image,
                                        height: 80,
                                        width: 80,
                                        fit: BoxFit.fill,
                                      ),
                                      const SizedBox(height: 5),

                                      // ignore: avoid_unnecessary_containers
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.2,
                                        height: 35,
                                        child: Text(
                                          product[index].productName,
                                          maxLines: 2,
                                          textAlign: TextAlign.start,
                                          style: const TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        children: const [
                                          Text(
                                            "500ml",
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          SizedBox(
                                            width: 30,
                                          ),
                                          Text(
                                            "\$200",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500),
                                          )
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 35,
                                            child: FittedBox(
                                              child: MaterialButton(
                                                color: kPrimaryColor,
                                                onPressed: () {},
                                                child: const Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 35, right: 35),
                                                  child: Text(
                                                    "Add",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                    onExpansionChanged: (bool expanded) {
                      setState(() => _customTileExpanded = expanded);
                    },
                  ),
                ),
                const SizedBox(height: 20),
                ListTile(
                  leading: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(
                      Icons.help,
                      color: Colors.black,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.keyboard_arrow_right_sharp,
                    size: 35,
                    color: Colors.black,
                  ),
                  title: const Text(
                    "Help",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(height: 10)
              ],
            ),
          ),
        )
      ]),
    );
  }
}

class DrawTriangle extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();
    path.moveTo(size.width * 2, 0);

    path.lineTo(0, size.height * 0);
    path.lineTo(0, size.width * 0.35);

    path.lineTo(200, 250);
    path.close();
    canvas.drawPath(path, Paint()..color = kPrimaryColor);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
