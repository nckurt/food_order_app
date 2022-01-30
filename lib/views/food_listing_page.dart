import 'package:flutter/material.dart';
import 'package:food_order_app/cubit/food_listing_page_cubit.dart';
import 'package:food_order_app/entity/custom_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_order_app/entity/food_images_enum.dart';
import 'package:food_order_app/entity/foods.dart';
import 'package:food_order_app/views/food_detail_page.dart';

class FoodListingPage extends StatefulWidget {
  const FoodListingPage({Key? key}) : super(key: key);

  @override
  _FoodListingPageState createState() => _FoodListingPageState();
}

class _FoodListingPageState extends State<FoodListingPage> {

  String imageUrl = "http://kasimadalan.pe.hu/yemekler/resimler/";
var orderCount = 0;

  @override
  void initState() {
    super.initState();
    context.read<FoodListingPageCubit>().getAllFoods();
  }

  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Menü"), backgroundColor: appBarColor,),
      body: BlocBuilder<FoodListingPageCubit, List<Foods>>(
        builder: (context, foodList){
          if(foodList.isNotEmpty){
            return ListView.builder(
              itemCount: foodList.length,
              itemBuilder: (context, indeks){
                var food = foodList[indeks];
                var enumValue = FoodImagesEnum.values[indeks].toString();
                var imageName = enumValue.substring(15);
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => FoodDetailPage(food: food)));
                          // .then((_){context.read<FoodListingPageCubit>().getAllFoods();});
                    },
                    child: Card(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left:5.0),
                                child: Image.network("${imageUrl}/${imageName}.png", height: 80, width: 80,),
                              ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0, right: 20.0),
                                    child: Column(
                                      children: [
                                        Text("${food.food_name}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.brown),),
                                        Text("${food.food_price} TL", style: TextStyle(fontSize: 15, color: Colors.orangeAccent, fontWeight: FontWeight.bold),),
                                      ],
                                    ),
                                  ),
                                  // Row(
                                  //   mainAxisAlignment: MainAxisAlignment.center,
                                  //   children: [
                                  //     IconButton(onPressed: (){
                                  //       setState(() {
                                  //         if(orderCount != 0){
                                  //           orderCount--;
                                  //         }
                                  //       });
                                  //     }, icon: Icon(Icons.remove, size: 25,),),
                                  //     Text("${orderCount}", style: TextStyle(fontSize: 25),),
                                  //     IconButton(onPressed: (){
                                  //       setState(() {
                                  //         orderCount++;
                                  //       });
                                  //     }, icon: Icon(Icons.add, size: 25,)),
                                  //   ],
                                  // ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 5.0),
                                    child: ElevatedButton(
                                      onPressed: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => FoodDetailPage(food: food)))
                                            .then((_){context.read<FoodListingPageCubit>().getAllFoods();});
                                      }, child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("İncele", style: TextStyle(fontSize: 10),),
                                    ), style:ElevatedButton.styleFrom(primary: Colors.lightGreen, ),),
                                  ),
                            ],
                          ),
                    ),
                  );
              },
            );
          }
          else{
            return Center();
          }
        },
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   selectedFontSize: 15,
      //   unselectedFontSize: 15,
      //   selectedItemColor: Colors.brown,
      //   unselectedItemColor: Colors.brown,
      //   selectedLabelStyle: TextStyle(color: Colors.brown, fontWeight: FontWeight.bold),
      //   unselectedLabelStyle: TextStyle(color: Colors.brown, fontWeight: FontWeight.bold),
      //   items: [
      //     BottomNavigationBarItem(icon: Icon(Icons.home_filled, color: removeColor, size: 30,), label: "Anasayfa",),
      //     BottomNavigationBarItem(icon: Icon(Icons.restaurant_menu, color: removeColor, size: 30,), label: "Menü"),
      //     BottomNavigationBarItem(icon: Icon(Icons.shopping_basket, color: removeColor, size: 30,), label: "Sepetim"),
      //   ],
      //   currentIndex: selectedIndex
      //   onTap: (index){
      //       setState(() {
      //
      //       });
      //   },
      // ),


    );
  }
}


