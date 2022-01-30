import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_order_app/cubit/food_listing_page_cubit.dart';
import 'package:food_order_app/entity/custom_colors.dart';
import 'package:food_order_app/views/navigation_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sipariş Tamamlandı"), backgroundColor:  appBarColor,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("images/eater_1.gif", height: 200, width: 200,),
            Padding(
              padding: const EdgeInsets.only(top:60.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("TEŞEKKÜRLER!", style: TextStyle(fontSize: 35, color: Colors.red.shade400)),
                  //Icon(Icons.emoji_emotions_outlined, color: removeColor,),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text("Siparişini aldık.", style: TextStyle(color: Colors.brown, fontSize: 20),),
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => NavigationPage(indexInfo: 0)))
                    .then((_){context.read<FoodListingPageCubit>().getAllFoods();});
              },
              child: Container(
                child:Column(
                children:[
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Icon(Icons.home_filled, color: Colors.brown,size: 50,),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:10.0),
                  child: Text("Anasayfaya dön", style: TextStyle(color: Colors.brown, fontSize: 18)),
                ),
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
