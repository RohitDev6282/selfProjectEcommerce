import 'package:ecommerce_app/constant/colors.dart';
import 'package:ecommerce_app/model/drawer_category.dart';
import 'package:ecommerce_app/search/search_page.dart';
import 'package:ecommerce_app/views/cart/cart.dart';
import 'package:ecommerce_app/views/home/home.dart';
import 'package:ecommerce_app/views/profile/profile.dart';
import 'package:flutter/material.dart';

class Footer extends StatefulWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  List<DrawerCategory> list = [];
  Widget currentPage = const Footer();
  final tabs = [
    const MyHomePage(),
    const CartPage(),
    const SearchPage(),
    const ProfilePage(),
  ];

  int _selectedIndex = 0;

  void _selectTab(Widget tabItem, int index) {
    setState(() {
      currentPage = tabs[index];
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          tabs[_selectedIndex],
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 60,
        child: BottomNavigationBar(
          selectedLabelStyle: const TextStyle(fontSize: 10),
          unselectedFontSize: 9,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 18),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined, size: 18),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search, size: 18),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, size: 18),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: kPrimaryColor,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          onTap: (int index) {
            _selectTab(tabs[index], index);
          },
        ),
      ),
    );
  }
}
