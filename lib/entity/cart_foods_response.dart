import 'package:food_order_app/entity/cart_foods.dart';

class CartFoodsResponse{
  List<CartFoods> cartFoodList;
  int success;

  CartFoodsResponse({required this.cartFoodList, required this.success});

  factory CartFoodsResponse.fromJson(Map<String, dynamic> json){
    var jsonArray = json["sepet_yemekler"] as List;
    List<CartFoods> cartFoodList = jsonArray.map((e) => CartFoods.fromJson(e)).toList();
    //liste boş mu kontrol et
    if(cartFoodList.isNotEmpty){

      return CartFoodsResponse(cartFoodList: cartFoodList, success: json["success"] as int);
    }
else{
  List<CartFoods> emptyList = [];
  return CartFoodsResponse(cartFoodList: emptyList, success: json["success"] as int);
    }
  }

}