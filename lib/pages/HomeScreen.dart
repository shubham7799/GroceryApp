import 'package:flutter/material.dart';
import 'package:grocery_app/pages/cartPage.dart';
import 'package:grocery_app/pages/homePage.dart';
import 'package:grocery_app/pages/profilePage.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<HomeScreen> {
  int selectedPosition = 0;
  List<Widget> listBottomWidget = new List();

  @override
  void initState() {
    super.initState();
    addHomePage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNavigation(),
      body: Builder(builder: (context) {
        return listBottomWidget[selectedPosition];
      }),
    );
  }

  Widget bottomNavigation() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
        BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart), title: Text("Cart")),
        BottomNavigationBarItem(
            icon: Icon(Icons.person), title: Text("Account")),
      ],
      currentIndex: selectedPosition,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.green,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white38,
      onTap: (position) {
        setState(() {
          selectedPosition = position;
        });
      },
    );
  }

  void addHomePage() {
    listBottomWidget.add(HomePage());
    listBottomWidget.add(CartPage());
    listBottomWidget.add(ProfilePage());
  }
}
