import 'package:food_order_app/entity/foods.dart';

class FoodsResponse{
  List<Foods> foodsList;
  int success;

  FoodsResponse({required this.foodsList, required this.success});
  
  
  factory FoodsResponse.fromJson(Map<String, dynamic> json){
    var jsonArray = json["yemekler"] as List;
    List<Foods> foodList = jsonArray.map((e) => Foods.fromJson(e)).toList();
    return FoodsResponse(foodsList: foodList, success: json["success"] as int);
  }
}
    