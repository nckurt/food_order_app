import 'package:flutter/material.dart';
import 'package:food_order_app/cubit/cart_food_listing_page_cubit.dart';
import 'package:food_order_app/cubit/food_detail_page_cubit.dart';
import 'package:food_order_app/cubit/food_listing_page_cubit.dart';
import 'package:food_order_app/entity/custom_colors.dart';
import 'package:food_order_app/entity/food_images_enum.dart';
import 'package:food_order_app/entity/foods.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_order_app/views/cart_food_listing_page.dart';
import 'package:food_order_app/views/navigation_page.dart';

class FoodDetailPage extends StatefulWidget {
 Foods food;
 var imageName;
 var currentPrice;
 FoodDetailPage({required this.food});

  @override
  _FoodDetailPageState createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  String imageUrl = "http://kasimadalan.pe.hu/yemekler/resimler/";
  var orderCount = 1;


  @override
  void initState() {
    super.initState();
    var food = widget.food;

    var currentPrice = widget.food.food_price;
    widget.currentPrice = currentPrice;

    var enumValue = FoodImagesEnum.values[int.parse(food.food_id)-1].toString();
    widget.imageName = enumValue.substring(15);

    context.read<CartFoodListingPageCubit>().getAllCartFoods("nkurt");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.food.food_name}", style: TextStyle(color: Colors.white),),
        // actions: [
        //   // Text("${widget.totalAmount}"),
        //   IconButton(onPressed: (){
        //     Navigator.push(context, MaterialPageRoute(builder: (context) => CartFoodListingPage()))
        //         .then((_){context.read<CartFoodListingPageCubit>().getAllCartFoods("nkurt");});
        //   }, icon: Icon(Icons.shopping_basket_outlined, color: Colors.white,),),
        // ],
        backgroundColor: appBarColor,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(height:200, width: 200,child: Image.network("${imageUrl}/${widget.imageName}.png")),
            ),
            Text("${widget.currentPrice} TL", style: TextStyle(color: Colors.orangeAccent, fontSize: 25, fontWeight: FontWeight.bold),),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(onPressed: (){
                    setState(() {
                      if(orderCount != 0 && orderCount != 1){
                        orderCount--;
                        widget.currentPrice = (int.parse(widget.food.food_price) * orderCount).toString();
                      }
                    });
                  }, icon: Icon(Icons.remove, size: 25, color: Colors.brown,),),
                  Text("${orderCount}", style: TextStyle(fontSize: 25, color: Colors.brown),),
                 // TextField(controller: tfController,),
                  IconButton(onPressed: (){
                    setState(() {
                      orderCount++;
                      widget.currentPrice = (int.parse(widget.food.food_price) * orderCount).toString();
                    });
                  }, icon: Icon(Icons.add, size: 25, color: Colors.brown,)),
                ],
              ),
            ),
           Padding(
             padding: const EdgeInsets.all(5.0),
             child: GestureDetector(
               onTap: (){
                 context.read<FoodDetailPageCubit>().saveCartFood(widget.food.food_name, widget.imageName, int.parse(widget.food.food_price), orderCount, "nkurt");
                 context.read<CartFoodListingPageCubit>().getAllCartFoods("nkurt");
                 context.read<CartFoodListingPageCubit>().getTotalCartPrice();
                 // Navigator.push(context, MaterialPageRoute(builder: (context) => NavigationPage(indexInfo: 2)))
                 //     .then((_){context.read<CartFoodListingPageCubit>().getAllCartFoods("nkurt");});
                 ScaffoldMessenger.of(context).showSnackBar(
                     SnackBar(
                       content: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Text("${orderCount} adet ${widget.food.food_name} sepete eklendi!"),
                           GestureDetector(
                               onTap: (){
                                 ScaffoldMessenger.of(context).hideCurrentSnackBar();
                               },
                               child: Icon(Icons.close, color: Colors.white,))
                         ],
                       ),
                       margin: EdgeInsets.only(bottom: 1),
                       behavior: SnackBarBehavior.floating,
                       shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(25),
                       ),
                       backgroundColor: appBarColor,

                     ));
               },
               child: SizedBox(
                width: 150,
                 child: DecoratedBox(
                   decoration: BoxDecoration(color:Colors.lightGreen, borderRadius: BorderRadius.circular(25)),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       Padding(
                         padding: const EdgeInsets.only(left: 10.0),
                         child: Text("Sepete Ekle", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),),
                       ),
                       IconButton(onPressed: (){}, icon: Icon(Icons.shopping_basket_outlined), color: Colors.white, ),
                     ],
                   ),
                 ),
               ),
             ),
           ),
      //       ElevatedButton(onPressed: (){
      // Navigator.push(context, MaterialPageRoute(builder: (context) => CardFoodListingPage()))
      //     .then((_){context.read<CartFoodListingPageCubit>().getAllCartFoods("nkurt");});
      //       }, child: Text("Sepeti görüntüle")),
          ],
        ),
      ),
    );
  }
}
