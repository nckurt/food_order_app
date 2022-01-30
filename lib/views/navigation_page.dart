import 'package:flutter/material.dart';
import 'package:food_order_app/entity/custom_colors.dart';
import 'package:food_order_app/views/cart_food_listing_page.dart';
import 'package:food_order_app/views/food_listing_page.dart';
import 'package:food_order_app/views/homepage.dart';

class NavigationPage extends StatefulWidget {
  //const NavigationPage({Key? key}) : super(key: key);
int indexInfo;

NavigationPage({required this.indexInfo});

  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {

//int selectedIndex = ;
var pageList = [Homepage(), FoodListingPage(), CartFoodListingPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // appBar: AppBar(),
      body: pageList[widget.indexInfo],

      bottomNavigationBar: BottomNavigationBar(
          selectedFontSize: 15,
          unselectedFontSize: 15,
          selectedItemColor: Colors.brown,
          unselectedItemColor: Colors.brown.shade200,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home_filled, size: 30,), label: "Anasayfa",),
            BottomNavigationBarItem(icon: Icon(Icons.restaurant_menu,  size: 30,), label: "Menü"),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_basket,  size: 30,), label: "Sepetim"),
          ],
          currentIndex: widget.indexInfo,
          onTap: (index){
            setState(() {
              widget.indexInfo = index;
            });
          },
    ),
    );
  }
}
