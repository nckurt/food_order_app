import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_order_app/cubit/food_listing_page_cubit.dart';
import 'package:food_order_app/entity/custom_colors.dart';
import 'package:food_order_app/views/food_listing_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_order_app/views/navigation_page.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Acıktım!"),  backgroundColor: appBarColor,),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset("images/eater_2.gif", height: 150, width: 150,),
                  Image.asset("images/eater_3.gif", height: 150, width: 150,),
              ],),
            ),

            Padding(
              padding: const EdgeInsets.only(top:50.0),
              child: Text("Hoşgeldin Nesibe!", style: TextStyle(fontSize: 35, color: Colors.brown),),
            ),
            Padding(
              padding: const EdgeInsets.only(top:40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Icon(Icons.emoji_emotions_outlined , color: Colors.orangeAccent, size: 25,),
                Text("Menüye göz atmak", style: TextStyle(fontSize: 20, color: Colors.brown,),),
                Text("ister misin?", style: TextStyle(fontSize: 20, color: Colors.brown,),),
                // Icon(Icons.local_restaurant , color: Colors.orangeAccent, size: 25,),
              ],
              ),
            ),
          ],
        ),
      ),

    );
  }
}
