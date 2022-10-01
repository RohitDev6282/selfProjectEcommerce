import 'package:ecommerce_app/widget/search_button.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Stack(
              children: [
                ClipRRect(
                  child: Image.asset(
                    "assets/images/bg_images.jpeg",
                  ),
                ),
                Padding(
                    padding:
                        const EdgeInsets.only(top: 230, left: 20, right: 20),
                    child: SearchBar(onPressed: () {
                      //  Navigator.push(context,MaterialPageRoute(builder: (context) => Datasearch()));
                    })),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 15, top: 10),
                    child: Text(
                      "Popular",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 40,
                            child: Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image:
                                      AssetImage("assets/images/detergent.jpg"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 54,
                            height: 70,
                            child: const Text("Fruite & Vegetable",
                                maxLines: 2, style: TextStyle(fontSize: 12)),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 40,
                            child: Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image:
                                      AssetImage("assets/images/detergent.jpg"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 54,
                            height: 70,
                            child: const Text("Detergent & Shamopoo",
                                maxLines: 2, style: TextStyle(fontSize: 12)),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 40,
                            child: Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image:
                                      AssetImage("assets/images/detergent.jpg"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Container(
                              width: 54,
                              height: 70,
                              child: const Text("Milk & Dairy Product",
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 12)))
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 40,
                            child: Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image:
                                      AssetImage("assets/images/detergent.jpg"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Container(
                              width: 54,
                              height: 70,
                              child: const Text("Handwash & Soap",
                                  maxLines: 2, style: TextStyle(fontSize: 12)))
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(
                    left: 15,
                  ),
                  child: Text(
                    "Categories",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 40,
                          child: Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image:
                                    AssetImage("assets/images/detergent.jpg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const Text("Detergent", style: TextStyle(fontSize: 12))
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 40,
                          child: Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image:
                                    AssetImage("assets/images/detergent.jpg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const Text("Shampoo", style: TextStyle(fontSize: 12))
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 40,
                          child: Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image:
                                    AssetImage("assets/images/detergent.jpg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Container(
                            width: 54,
                            child: const Text("Air Freshner",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 12)))
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 40,
                          child: Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image:
                                    AssetImage("assets/images/detergent.jpg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const Text("Handwash", style: TextStyle(fontSize: 12))
                      ],
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
