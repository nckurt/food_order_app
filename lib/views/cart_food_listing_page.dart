import 'package:flutter/material.dart';
import 'package:food_order_app/cubit/cart_food_listing_page_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_order_app/entity/cart_foods.dart';
import 'package:food_order_app/entity/custom_colors.dart';
import 'package:food_order_app/entity/food_images_enum.dart';
import 'package:food_order_app/views/food_detail_page.dart';
import 'package:food_order_app/views/navigation_page.dart';
import 'package:food_order_app/views/order_page.dart';

class CartFoodListingPage extends StatefulWidget {
  //const CartFoodListingPage({Key? key}) : super(key: key);
   int totalAmount = 0;
   int cartTotal =0;

  @override
  _CartFoodListingPageState createState() => _CartFoodListingPageState();
}

class _CartFoodListingPageState extends State<CartFoodListingPage> {

  @override
  void initState() {
    super.initState();
    context.read<CartFoodListingPageCubit>().getAllCartFoods("nkurt");
    //context.read<CartFoodListingPageCubit>().getTotalCartPrice();
    int total = 0;
    setState(() {
    Future.delayed(Duration.zero,() async{
      int totalAmount = await context.read<CartFoodListingPageCubit>().getTotalCartPrice();
      widget.totalAmount = totalAmount;
     print("delayed içerisindeki total: ${widget.totalAmount}");
    });
    });
  //   widget.totalAmount = total;
  // print("Sayfa açılınca total: ${widget.totalAmount}");

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sepetim"), backgroundColor: appBarColor,),
      body: BlocBuilder<CartFoodListingPageCubit, List<CartFoods>>(
        builder: (context, foodList){
          if(foodList.isNotEmpty){
            return ListView.builder(
              itemCount: foodList.length,
              itemBuilder: (context, indeks){
                var food = foodList[indeks];

                // widget.cartTotal += int.parse(food.food_order_amount) * int.parse(food.food_price);
                // widget.totalAmount = widget.cartTotal;
                // print("arayüz toplamı: ${widget.}");

                return GestureDetector(
                  onTap: (){
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => FoodDetailPage(food: food)))
                    //     .then((_){context.read<CartFoodListingPageCubit>().getAllCartFoods("nkurt");});
                  },
                  child: Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Padding(
                        //   padding: const EdgeInsets.only(left:5.0),
                        //   child: Image.network("${imageUrl}/${imageName}.png", height: 80, width: 80,),
                        // ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Container(
                              decoration: BoxDecoration(
                                color: Colors.brown,
                                border: Border.all(color: Colors.brown),
                                shape: BoxShape.circle
                              ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("${food.food_order_amount}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),),
                                  )
                              ),
                            ),
                            Text("${food.food_name}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.brown),),
                        IconButton(onPressed: (){
                         ScaffoldMessenger.of(context).showSnackBar(
                           SnackBar(
                             content: Text("Ürünü silmek istediğinizden emin misiniz?"),
                             margin: EdgeInsets.only(bottom: 1),
                             behavior: SnackBarBehavior.floating,
                             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                             backgroundColor: removeColor,
                             action: SnackBarAction(
                               label: "Evet",
                               textColor: Colors.white,
                               onPressed:(){
                                 setState(() {
                                 context.read<CartFoodListingPageCubit>().deleteCartFood(int.parse(food.cart_food_id), "nkurt").then((_) => context.read<CartFoodListingPageCubit>().getAllCartFoods("nkurt"));
                                 widget.totalAmount = widget.totalAmount - int.parse(food.food_order_amount)*int.parse(food.food_price);

                                 });
                                 ScaffoldMessenger.of(context).showSnackBar(
                                   SnackBar(
                                       content:Row(
                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                       children: [
                                       Text("Ürün sepetinizden silindi."),
                                         GestureDetector(
                                             onTap: (){
                                               ScaffoldMessenger.of(context).hideCurrentSnackBar();
                                             },
                                             child: Icon(Icons.close, color: Colors.white,))
                                       ]
                                   ),
                                       margin: EdgeInsets.only(bottom: 1),
                                   behavior: SnackBarBehavior.floating,
                                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                                   backgroundColor: appBarColor,
                                   ),
                                 );
                               },
                             ),
                           ),
                         );
                       
                        }, icon: Icon(Icons.delete, color: removeColor))
                      ],
                    ),
                  ),
                );
              },
            );
          }
          else{
            return Center(
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top:80.0, bottom: 20.0),
                    child: Image.asset("images/chickengif.gif", height: 150, width: 150,),
                  ),
                  Text("Sepetin de", style: TextStyle(fontSize: 30, color: removeColor)),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Text("miden gibi bomboş...", style: TextStyle(fontSize: 30, color: removeColor)),
                  ),
                  Text("Menüyü incelemek ister misin?", style: TextStyle(fontSize: 20, color: Colors.brown,),),
                ],
              ),
            );
          }
        },
      ),

      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left:20.0),
        child: Container(
          decoration: BoxDecoration(
            //color: Colors.white,
            //border: Border.all(color: Colors.brown),
              boxShadow: [
                BoxShadow(
                  color: Colors.brown.shade500.withOpacity(0.1),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0,3),
                ),
              ],
              borderRadius: BorderRadius.circular(25)
          ),
          child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left:20.0),
                child: Text("Toplam: ${widget.totalAmount} TL", style: TextStyle(fontSize: 20, color: Colors.brown, fontWeight: FontWeight.bold),),
              ),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => OrderPage()));
              }, child: Text("Sipariş Ver", style: TextStyle(fontSize: 20),),
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.lightGreen)),),
            ],
          ),
        ),
      ),
    );
  }
}
